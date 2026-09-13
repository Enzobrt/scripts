#!/usr/bin/env bash
# @vicinae.schemaVersion 1
# @vicinae.title Dconf2nix (AI)
# @vicinae.mode fullOutput
# @vicinae.exec ["/usr/bin/env", "bash"]

set -euo pipefail

# dconf2nix.sh
# Regenera /etc/nixos/home/programs/dconf.nix desde el dconf de la sesión actual.
#
# El flujo es deliberadamente conservador:
#   1. dconf dump /
#   2. canonización de secciones/claves duplicadas
#   3. dconf2nix
#   4. si dconf2nix da un error de parser, localizar la línea exacta del dump y
#      eliminar únicamente esa clave
#   5. validar sintaxis Nix
#   6. copiar /etc/nixos a un árbol temporal y ejecutar un dry-build REAL con
#      `path:` para validar el módulo Home Manager y el resto de NixOS
#   7. si el dry-build falla en una línea atribuible inequívocamente a dconf.nix,
#      eliminar únicamente esa clave y repetir
#   8. reemplazar el archivo real mediante rename atómico
#
# NO modifica nixos-update.sh y NO hace git add.

readonly NIXOS_DIR="/etc/nixos"
readonly OUTPUT_FILE="${NIXOS_DIR}/home/programs/dconf.nix"
readonly MAX_ATTEMPTS=1000
readonly LOCK_DIR="${TMPDIR:-/tmp}/dconf2nix-${UID}.lock"

WORK_DIR=""
FINAL_TMP=""
REMOVED_COUNT=0

cleanup() {
    local status=$?
    if [[ -n "${FINAL_TMP}" && -e "${FINAL_TMP}" ]]; then
        rm -f -- "${FINAL_TMP}"
    fi
    if [[ -n "${WORK_DIR}" && -d "${WORK_DIR}" ]]; then
        rm -rf -- "${WORK_DIR}"
    fi
    if [[ -d "${LOCK_DIR}" ]]; then
        rm -rf -- "${LOCK_DIR}"
    fi
    exit "$status"
}
trap cleanup EXIT HUP INT TERM

fail() {
    echo "❌ $*" >&2
    exit 1
}

need_command() {
    local cmd=$1
    command -v "$cmd" >/dev/null 2>&1 || fail "No se encontró la dependencia: $cmd"
}

# Evita dos generadores concurrentes escribiendo el mismo dconf.nix.
if ! mkdir -- "${LOCK_DIR}" 2>/dev/null; then
    if [[ -f "${LOCK_DIR}/pid" ]]; then
        old_pid=$(<"${LOCK_DIR}/pid")
        if [[ "$old_pid" =~ ^[0-9]+$ ]] && kill -0 "$old_pid" 2>/dev/null; then
            fail "Ya hay otra instancia de dconf2nix.sh ejecutándose (PID ${old_pid})."
        fi
    fi
    rm -rf -- "${LOCK_DIR}"
    mkdir -- "${LOCK_DIR}" 2>/dev/null || fail "No se pudo adquirir el bloqueo ${LOCK_DIR}."
fi
echo "$$" > "${LOCK_DIR}/pid"

need_command dconf
need_command dconf2nix
need_command python3
need_command sed
need_command grep
need_command awk
need_command sort
need_command uniq
need_command nix-instantiate
need_command nixos-rebuild

[[ -d "${NIXOS_DIR}" ]] || fail "No existe ${NIXOS_DIR}."
mkdir -p -- "$(dirname -- "${OUTPUT_FILE}")"

# WORK_DIR va fuera del repositorio. El único temporal dentro de /etc/nixos será
# FINAL_TMP, creado en el mismo directorio del destino para que mv sea atómico.
WORK_DIR=$(mktemp -d "${TMPDIR:-/tmp}/dconf2nix.XXXXXXXX")
chmod 700 -- "${WORK_DIR}"
FINAL_TMP=$(mktemp "${OUTPUT_FILE}.tmp.XXXXXXXX")

RAW_DUMP="${WORK_DIR}/dconf.raw"
NORMALIZED_DUMP="${WORK_DIR}/dconf.normalized"
NORMALIZED_NEXT="${WORK_DIR}/dconf.normalized.next"
CANDIDATE_NIX="${WORK_DIR}/dconf.nix"
ERROR_FILE="${WORK_DIR}/dconf2nix.stderr"
NIX_ERROR_FILE="${WORK_DIR}/nix.stderr"
TEST_TREE="${WORK_DIR}/nixos-test"

printf '%s\n' "→ Generando dconf dump..."
if ! dconf dump / >"${RAW_DUMP}"; then
    fail "dconf dump / falló."
fi

# Canonización semántica del dump:
# - secciones repetidas => se fusionan
# - clave repetida dentro de la misma sección => gana la última aparición
# - no se elimina una sección entera solo porque tenga una clave problemática
#
# Además se descartan claves volátiles que no sobreviven al round-trip
# dconf -> dconf2nix -> home-manager: home-manager vuelve a serializar el valor
# a texto GVariant y GLib lo rechaza al activarse (p. ej. el weather de GNOME
# Shell: "can not parse as value of type 'u'").
python3 - "${RAW_DUMP}" "${NORMALIZED_DUMP}" <<'PY'
from __future__ import annotations

import re
import sys
from collections import OrderedDict

src, dst = sys.argv[1:]
section_re = re.compile(r"^\[([^\]]+)\]\s*$")
key_re = re.compile(r"^([^=\s][^=]*)=(.*)$")

BLOCKLIST = {
    "org/gnome/shell/weather": {"locations"},
}

sections: "OrderedDict[str, OrderedDict[str, str]]" = OrderedDict()
current: str | None = None

with open(src, "r", encoding="utf-8", newline="") as f:
    for lineno, raw in enumerate(f, 1):
        line = raw.rstrip("\r\n")
        stripped = line.strip()

        if not stripped or stripped.startswith("#") or stripped.startswith(";"):
            continue

        sm = section_re.match(stripped)
        if sm:
            current = sm.group(1)
            sections.setdefault(current, OrderedDict())
            continue

        km = key_re.match(line)
        if km:
            if current is None:
                raise SystemExit(f"Clave dconf fuera de sección en línea {lineno}: {line!r}")
            sections[current][km.group(1).strip()] = km.group(2)
            continue

        raise SystemExit(f"Sintaxis dconf inesperada en línea {lineno}: {line!r}")

dropped: list[str] = []
for section, values in sections.items():
    for key in BLOCKLIST.get(section, ()):
        if key in values:
            del values[key]
            dropped.append(f"[{section}] {key}")

if dropped:
    print(
        "⚠️  Descartadas (no soportan el round-trip de home-manager): "
        + ", ".join(dropped),
        file=sys.stderr,
    )

with open(dst, "w", encoding="utf-8", newline="\n") as f:
    for section, values in sections.items():
        f.write(f"[{section}]\n")
        for key, value in values.items():
            f.write(f"{key}={value}\n")
        f.write("\n")
PY

remove_dump_line() {
    local input=$1
    local output=$2
    local line_number=$3

    python3 - "${input}" "${output}" "${line_number}" <<'PY'
from __future__ import annotations

import re
import sys

src, dst, wanted_s = sys.argv[1:]
wanted = int(wanted_s)
section_re = re.compile(r"^\[([^\]]+)\]\s*$")
key_re = re.compile(r"^([^=\s][^=]*)=(.*)$")

with open(src, "r", encoding="utf-8", newline="") as f:
    lines = f.readlines()

if wanted < 1 or wanted > len(lines):
    raise SystemExit(f"El parser indicó la línea {wanted}, pero el dump tiene {len(lines)} líneas.")

current = None
removed_section = None
removed_key = None

with open(dst, "w", encoding="utf-8", newline="") as f:
    for number, raw in enumerate(lines, 1):
        line = raw.rstrip("\r\n")
        stripped = line.strip()

        sm = section_re.match(stripped)
        if sm:
            current = sm.group(1)

        if number == wanted:
            km = key_re.match(line)
            if current is None or km is None:
                raise SystemExit(
                    f"La línea {wanted} no corresponde inequívocamente a una clave dconf.\n"
                    f"Contenido: {line!r}"
                )
            removed_section = current
            removed_key = km.group(1).strip()
            continue

        f.write(raw)

if removed_section is None or removed_key is None:
    raise SystemExit(f"No se pudo eliminar la línea {wanted}.")

print(f"{removed_section}\t{removed_key}")
PY
}

# Quita una clave concreta por identidad semántica (sección + clave), no por
# número de línea. Se usa para reparar errores que aparecen durante dry-build.
remove_dump_key() {
    local input=$1
    local output=$2
    local wanted_section=$3
    local wanted_key=$4

    python3 - "${input}" "${output}" "${wanted_section}" "${wanted_key}" <<'PY'
from __future__ import annotations

import re
import sys

src, dst, wanted_section, wanted_key = sys.argv[1:]
section_re = re.compile(r"^\[([^\]]+)\]\s*$")
key_re = re.compile(r"^([^=\s][^=]*)=(.*)$")

current = None
removed = False

with open(src, "r", encoding="utf-8", newline="") as f:
    lines = f.readlines()

with open(dst, "w", encoding="utf-8", newline="") as f:
    for raw in lines:
        line = raw.rstrip("\r\n")
        stripped = line.strip()

        sm = section_re.match(stripped)
        if sm:
            current = sm.group(1)
            f.write(raw)
            continue

        km = key_re.match(line)
        if current == wanted_section and km and km.group(1).strip() == wanted_key:
            if removed:
                # Debería ser imposible tras la canonización, pero aborta antes
                # de borrar varias definiciones sin control.
                raise SystemExit(
                    f"La clave [{wanted_section}] {wanted_key} aparece más de una vez."
                )
            removed = True
            continue

        f.write(raw)

if not removed:
    raise SystemExit(f"No existe en el dump la clave [{wanted_section}] {wanted_key}.")

print("ok")
PY
}

# Obtiene la última localización que apunta al dconf.nix temporal desde un
# error de NixOS/Home Manager. Para errores de duplicados suele haber dos
# localizaciones; la última corresponde a la definición problemática más nueva.
extract_dconf_location() {
    local error_file=$1
    local test_tree=$2

    grep -Eo "${test_tree//\//\/}/home/programs/dconf\.nix:[0-9]+:[0-9]+" "${error_file}" \
        | tail -n1 \
        | sed -E 's/.*dconf\.nix:([0-9]+):([0-9]+)/\1 \2/'
}

# Devuelve <sección>	<clave> para la línea Nix indicada. Si la línea está en
# un valor multilínea, se atribuye a la última clave de su bloque, que es la
# clave que generó ese valor.
map_nix_location_to_dconf_key() {
    local file=$1
    local line_number=$2

    python3 - "${file}" "${line_number}" <<'PY'
from __future__ import annotations

import re
import sys

path, target_s = sys.argv[1:]
target = int(target_s)
header_re = re.compile(r'^\s{4}"([^"]+)"\s*=\s*\{\s*$')
key_re = re.compile(r'^\s{6}([A-Za-z0-9][A-Za-z0-9_-]*)\s*=\s')
close_re = re.compile(r'^\s{4}\};\s*$')

with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

if target < 1 or target > len(lines):
    raise SystemExit(f"Línea Nix fuera de rango: {target}")

section = None
key = None

for number, raw in enumerate(lines, 1):
    line = raw.rstrip("\n")
    hm = header_re.match(line)
    if hm:
        section = hm.group(1)
        key = None
    elif close_re.match(line):
        key = None
        section = None
    else:
        km = key_re.match(line)
        if km:
            key = km.group(1)

    if number == target:
        if section is None or key is None:
            raise SystemExit(
                f"La ubicación {target} no está dentro de una propiedad dconf inequívoca."
            )
        print(f"{section}\t{key}")
        raise SystemExit(0)

raise SystemExit(f"No se pudo mapear la línea Nix {target}.")
PY
}

# Intenta extraer además una identidad "ruta"."clave" de mensajes de Nix,
# útil especialmente para duplicate attributes.
extract_dconf_attr_identity() {
    local error_file=$1
    python3 - "${error_file}" <<'PY'
from __future__ import annotations

import re
import sys

text = open(sys.argv[1], "r", encoding="utf-8", errors="replace").read()
# Ejemplo: attribute '"org/gnome/foo".bar' already defined
matches = re.findall(r'"([^"]+)"\.([A-Za-z0-9][A-Za-z0-9_-]*)', text)
if matches:
    section, key = matches[-1]
    print(f"{section}\t{key}")
    raise SystemExit(0)
raise SystemExit(1)
PY
}

# Fusiona bloques top-level duplicados generados por dconf2nix.
# Se trabaja sobre la estructura textual conocida del resultado de dconf2nix.
dedupe_nix_blocks() {
    local input=$1
    local output=$2

    python3 - "${input}" "${output}" <<'PY2'
from __future__ import annotations

import re
import sys
from collections import OrderedDict

src, dst = sys.argv[1:]
text = open(src, "r", encoding="utf-8").read()

def string_end(s, i):
    quote = s[i]
    i += 1
    while i < len(s):
        if s[i] == "\\":
            i += 2
            continue
        if s[i] == quote:
            return i + 1
        i += 1
    raise ValueError("cadena Nix sin cerrar")

def matching_brace(s, start):
    depth = 0
    i = start
    while i < len(s):
        c = s[i]
        if c in ('"', "'"):
            i = string_end(s, i); continue
        if c == '#':
            nl = s.find('\n', i)
            i = len(s) if nl == -1 else nl + 1
            continue
        if c == '{': depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0: return i
        i += 1
    raise ValueError("bloque Nix sin cerrar")

def split_entries(body):
    entries=[]; start=0; i=0
    brace=bracket=paren=0
    while i < len(body):
        c=body[i]
        if c in ('"', "'"):
            i=string_end(body,i); continue
        if c == '#':
            nl=body.find('\n',i); i=len(body) if nl==-1 else nl+1; continue
        if c=='{': brace+=1
        elif c=='}': brace-=1
        elif c=='[': bracket+=1
        elif c==']': bracket-=1
        elif c=='(': paren+=1
        elif c==')': paren-=1
        elif c==';' and brace==bracket==paren==0:
            chunk=body[start:i+1]
            if chunk.strip(): entries.append(chunk)
            start=i+1
        i+=1
    tail=body[start:]
    if tail.strip(): entries.append(tail)
    return entries

def split_assignment(entry):
    i=0; brace=bracket=paren=0
    while i < len(entry):
        c=entry[i]
        if c in ('"', "'"):
            i=string_end(entry,i); continue
        if c=='#':
            nl=entry.find('\n',i); i=len(entry) if nl==-1 else nl+1; continue
        if c=='{': brace+=1
        elif c=='}': brace-=1
        elif c=='[': bracket+=1
        elif c==']': bracket-=1
        elif c=='(': paren+=1
        elif c==')': paren-=1
        elif c=='=' and brace==bracket==paren==0:
            lhs=entry[:i].strip(); rhs=entry[i+1:].strip()
            return (lhs,rhs) if lhs else None
        i+=1
    return None

def merge_bodies(bodies):
    merged=OrderedDict()
    for body in bodies:
        for entry in split_entries(body):
            pair=split_assignment(entry)
            if pair is None:
                raise ValueError(f"No se pudo interpretar una propiedad Nix: {entry!r}")
            lhs,rhs=pair
            merged[lhs]=rhs
    out=[]
    for lhs,rhs in merged.items():
        parts=rhs.splitlines() or [""]
        out.append(f"      {lhs} = {parts[0]}")
        out.extend(parts[1:])
    return "\n".join(out)

header=re.compile(r'(?m)^(?P<indent>[ \t]*)"(?P<path>(?:[^"\\]|\\.)*)"[ \t]*=[ \t]*\{')
blocks=[]; pos=0
while True:
    m=header.search(text,pos)
    if not m: break
    open_pos=text.find('{',m.start(),m.end())
    try: close_pos=matching_brace(text,open_pos)
    except ValueError as e: raise SystemExit(str(e))
    after=close_pos+1
    while after < len(text) and text[after] in ' \t': after+=1
    if after>=len(text) or text[after]!=';':
        pos=m.end(); continue
    blocks.append({"start":m.start(),"end":after+1,"path":m.group('path'),"open":open_pos,"close":close_pos,"indent":m.group('indent')})
    pos=after+1

if not blocks:
    open(dst,'w',encoding='utf-8').write(text); raise SystemExit(0)

groups=OrderedDict()
for b in blocks: groups.setdefault(b['path'],[]).append(b)

first_by_start = {ms[0]['start']: (path, ms) for path, ms in groups.items()}
duplicate_starts = {b['start'] for ms in groups.values() if len(ms) > 1 for b in ms[1:]}

out=[]; cursor=0
for b in blocks:
    out.append(text[cursor:b['start']])
    if b['start'] in duplicate_starts:
        cursor=b['end']
        continue
    path, ms = first_by_start.get(b['start'], (b['path'], [b]))
    if len(ms)==1:
        out.append(text[b['start']:b['end']])
    else:
        bodies=[text[x['open']+1:x['close']] for x in ms]
        body=merge_bodies(bodies)
        indent=b['indent']
        out.append(f'{indent}"{path}" = {{\n')
        if body: out.append(body+'\n')
        out.append(f'{indent}}};')
    cursor=b['end']
out.append(text[cursor:])
open(dst,'w',encoding='utf-8').write(''.join(out))

for path,ms in groups.items():
    if len(ms)>1: print(f"{path}\t{len(ms)}")
PY2
}


# Genera, limpia y valida el candidato. La función puede llamarse de nuevo
# después de cada eliminación provocada por un error de evaluación.
prepare_candidate() {
    while true; do
        : > "${CANDIDATE_NIX}"
        : > "${ERROR_FILE}"

        printf '%s\n' "→ Ejecutando dconf2nix (intento ${attempt})..."

        if dconf2nix <"${NORMALIZED_DUMP}" >"${CANDIDATE_NIX}" 2>"${ERROR_FILE}"; then
            break
        fi

        parser_line=$(grep -Eo 'line [0-9]+, column [0-9]+' "${ERROR_FILE}" \
            | head -n1 \
            | sed -E 's/^line ([0-9]+), column [0-9]+$/\1/' || true)

        if [[ ! "${parser_line}" =~ ^[0-9]+$ ]]; then
            echo "❌ dconf2nix falló sin una línea de entrada eliminable de forma segura:" >&2
            cat "${ERROR_FILE}" >&2
            return 1
        fi

        if (( attempt >= MAX_ATTEMPTS )); then
            echo "❌ Se alcanzó el máximo de ${MAX_ATTEMPTS} intentos." >&2
            return 1
        fi
        ((attempt+=1))

        remove_result=""
        if ! remove_result=$(remove_dump_line "${NORMALIZED_DUMP}" "${NORMALIZED_NEXT}" "${parser_line}"); then
            echo "❌ dconf2nix señaló una posición que no corresponde inequívocamente a una clave dconf." >&2
            echo "   Línea indicada: ${parser_line}" >&2
            cat "${ERROR_FILE}" >&2
            return 1
        fi
        mv -- "${NORMALIZED_NEXT}" "${NORMALIZED_DUMP}"

        section=${remove_result%%$'\t'*}
        key=${remove_result#*$'\t'}
        ((REMOVED_COUNT+=1))
        printf '⚠️  Ignorando [%s] %s por error de parser de dconf2nix.\n' "${section}" "${key}"
    done

    printf '%s\n' "→ Limpiando duplicados..."
    dedupe_report="${WORK_DIR}/dedupe.report"
    if ! dedupe_nix_blocks "${CANDIDATE_NIX}" "${CANDIDATE_NIX}.dedup" >"${dedupe_report}" 2>"${NIX_ERROR_FILE}"; then
        echo "❌ No se pudo deduplicar de forma segura el Nix generado:" >&2
        cat "${NIX_ERROR_FILE}" >&2
        return 1
    fi
    mv -- "${CANDIDATE_NIX}.dedup" "${CANDIDATE_NIX}"

    if [[ -s "${dedupe_report}" ]]; then
        while IFS=$'\t' read -r duplicate_path duplicate_count; do
            [[ -z "${duplicate_path}" ]] && continue
            printf '⚠️  Fusionadas %s definiciones de [%s].\n' "${duplicate_count}" "${duplicate_path}"
        done <"${dedupe_report}"
    fi

    printf '%s\n' "→ Validando sintaxis Nix..."
    if ! nix-instantiate --parse "${CANDIDATE_NIX}" >"/dev/null" 2>"${NIX_ERROR_FILE}"; then
        echo "❌ El archivo generado no tiene sintaxis Nix válida:" >&2
        cat "${NIX_ERROR_FILE}" >&2
        return 1
    fi

    return 0
}

attempt=1
if ! prepare_candidate; then
    exit 1
fi

# ---------------------------------------------------------------------------
# Validación real de Home Manager/NixOS
# ---------------------------------------------------------------------------
# La prueba se ejecuta sobre una COPIA del árbol de /etc/nixos y usando
# `path:/...`; así Nix no depende del índice Git y sí ve el candidato no
# versionado. No se toca el árbol original durante la prueba.
run_real_dry_build() {
    rm -rf -- "${TEST_TREE}"
    mkdir -p -- "${TEST_TREE}"

    cp -a -- "${NIXOS_DIR}/." "${TEST_TREE}/"
    cp -- "${CANDIDATE_NIX}" "${TEST_TREE}/home/programs/dconf.nix"

    : > "${NIX_ERROR_FILE}"

    if sudo nixos-rebuild dry-build --flake "path:${TEST_TREE}#nixos" >"${WORK_DIR}/nixos-build.stdout" 2>"${NIX_ERROR_FILE}"; then
        return 0
    fi

    return 1
}

while true; do
    printf '%s\n' "→ Validando con nixos-rebuild dry-build en un árbol temporal..."

    if run_real_dry_build; then
        break
    fi

    # Solo autoeliminamos cuando las localizaciones de archivos pertenecen al
    # árbol temporal y, entre ellas, dconf.nix es el único archivo local citado.
    # Así un fallo real de configuration.nix, flake.nix, etc. no se "cura"
    # borrando dconf al azar.
    local_refs=$(grep -Eo "${TEST_TREE//\//\/}/[^'\"[:space:]]+\.nix:[0-9]+:[0-9]+" "${NIX_ERROR_FILE}" \
        | sort -u || true)

    unsafe_ref=0
    while IFS= read -r ref; do
        [[ -z "${ref}" ]] && continue
        case "${ref}" in
            "${TEST_TREE}/home/programs/dconf.nix:"*) ;;
            *) unsafe_ref=1; break ;;
        esac
    done <<< "${local_refs}"

    if (( unsafe_ref != 0 )); then
        echo "❌ nixos-rebuild dry-build falló por una ruta que no pertenece inequívocamente a dconf.nix." >&2
        cat "${NIX_ERROR_FILE}" >&2
        exit 1
    fi

    location=$(extract_dconf_location "${NIX_ERROR_FILE}" "${TEST_TREE}" || true)
    identity=$(extract_dconf_attr_identity "${NIX_ERROR_FILE}" || true)

    mapped=""
    if [[ -n "${identity}" ]]; then
        mapped=${identity}
    elif [[ -n "${location}" ]]; then
        nix_line=${location%% *}
        mapped=$(map_nix_location_to_dconf_key "${TEST_TREE}/home/programs/dconf.nix" "${nix_line}" || true)
    fi

    if [[ -z "${mapped}" ]]; then
        echo "❌ El dry-build falla, pero no puedo asociar el error con una clave dconf concreta de forma segura." >&2
        cat "${NIX_ERROR_FILE}" >&2
        exit 1
    fi

    section=${mapped%%$'\t'*}
    key=${mapped#*$'\t'}

    if [[ -z "${section}" || -z "${key}" ]]; then
        echo "❌ No se pudo determinar de forma segura la sección/clave afectada." >&2
        cat "${NIX_ERROR_FILE}" >&2
        exit 1
    fi

    if ! remove_dump_key "${NORMALIZED_DUMP}" "${NORMALIZED_NEXT}" "${section}" "${key}" >/dev/null; then
        echo "❌ NixOS señaló ${section}.${key}, pero esa clave no pudo localizarse de forma única en el dump." >&2
        cat "${NIX_ERROR_FILE}" >&2
        exit 1
    fi
    mv -- "${NORMALIZED_NEXT}" "${NORMALIZED_DUMP}"

    ((REMOVED_COUNT+=1))
    printf '⚠️  Ignorando [%s] %s porque rompe la evaluación Nix/Home Manager.\n' "${section}" "${key}"

    # Volver a generar desde el dump ya corregido.
    ((attempt+=1))
    if ! prepare_candidate; then
        exit 1
    fi
done

# Copia final en el mismo directorio y rename atómico.
if [[ -e "${OUTPUT_FILE}" ]]; then
    chmod --reference="${OUTPUT_FILE}" "${CANDIDATE_NIX}" 2>/dev/null || true
fi
cp --reflink=auto -- "${CANDIDATE_NIX}" "${FINAL_TMP}" 2>/dev/null || cp -- "${CANDIDATE_NIX}" "${FINAL_TMP}"

python3 - "${FINAL_TMP}" <<'PY' >/dev/null 2>&1 || true
import os
import sys
fd = os.open(sys.argv[1], os.O_RDONLY)
try:
    os.fsync(fd)
finally:
    os.close(fd)
PY

mv -f -- "${FINAL_TMP}" "${OUTPUT_FILE}"
FINAL_TMP=""

printf '%s\n' "✅ dconf.nix generado correctamente"
printf '   %s\n' "${OUTPUT_FILE}"
printf '   %s\n' "Claves descartadas automáticamente: ${REMOVED_COUNT}"
printf '%s\n' "   No se modificó nixos-update.sh ni se hizo git add."

