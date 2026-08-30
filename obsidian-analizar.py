import os
from os import listdir
from os.path import isfile

from datetime import datetime, timedelta

import pandas as pd
import matplotlib.pyplot as plt
import mplcursors
import numpy as np
import re

dir = "/home/enzo/Documents/notas-obsidian/Notas diarias/"
files = [f for f in os.listdir(dir) if os.path.isfile(os.path.join(dir, f))]
sorted_files = sorted(files)


def remove_emojis(text):
    # Define a regex pattern for various emoji Unicode blocks
    emoji_pattern = re.compile("["
                               u"\U0001F600-\U0001F64F"  # emoticons
                               u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                               u"\U0001F680-\U0001F6FF"  # transport & map symbols
                               u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                               u"\U00002702-\U000027B0"  # dingbats
                               u"\U000024C2-\U0001F251"  # enclosed characters
                               u"\U0001F900-\U0001F9FF"  # supplemental symbols
                               u"\U0001FA00-\U0001FA6F"  # chess symbols
                               u"\U0001FA70-\U0001FAFF"  # symbols extended-a
                               u"\U00002600-\U000026FF"  # misc symbols
                               u"\U00002300-\U000023FF"  # misc technical
                               "]+", flags=re.UNICODE)
    return emoji_pattern.sub('', text)


def write_file_list(file_name: str, pelis_por_año: dict):
    dict_keys = pelis_por_año.keys()
    for key in dict_keys:
        pelis_por_año[año].sort()
        with open(f"{file_name}-{key}.md", "w") as file:
            titulo = file_name.replace("-", " ").capitalize()
            file.write(f"# {titulo} {key}\n")
            for line in pelis_por_año[key]:
                line = line.strip()
                file.write("- ")
                file.write(line)
                file.write("\n")


def leer_archivo(archivo):
    pelis = []
    actividades = []
    despertarse = ""
    dormir = ""
    series = []
    with open(archivo) as file:
        next(file)  # Salta la primera linea #Notas-diarias
        apartado = 0
        stripped = ""
        for line in file:
            stripped = line.strip().lower()
            stripped = remove_emojis(stripped)

            if len(stripped) == 0:
                continue
            match stripped:
                case "# actividades" | "# sucesos":
                    apartado = 1
                    continue
                case "# pelis":
                    apartado = 2
                    continue
                case "# hora de despertarse/dormir":
                    apartado = 3
                    continue
                case "# series":
                    apartado = 4
                    continue

            # tratamiento
            inicio_parentesis = stripped.find("(")
            final_parentesis = stripped.find(")")
            if inicio_parentesis != -1 & final_parentesis != -1:
                stripped = stripped[:inicio_parentesis] + \
                    stripped[final_parentesis:]

            inicio_flecha = stripped.find("→")
            if inicio_flecha != -1:
                stripped = stripped[:inicio_flecha]

            match apartado:
                # Actividades
                case 1:
                    # Salta el guion al principio de la linea
                    if stripped[0] == "-":
                        stripped = stripped[2:]
                    else:
                        stripped = "fallito"
                    actividades.append(stripped.capitalize())

                # Pelis
                case 2:
                    # Salta el guion al principio de la linea
                    if stripped[0] == "-":
                        stripped = stripped[2:]
                    else:
                        stripped = "fallito"
                    pelis.append(stripped.capitalize())

                # Mimir
                case 3:
                    # Salta el guion al principio de la linea
                    if stripped[0] == "-":
                        stripped = stripped[2:]
                    else:
                        stripped = "fallito"

                    if "despertado" in stripped:
                        despertarse = stripped.replace(
                            "me he despertado: ", "")
                    if "dormido" in stripped:
                        dormir = stripped.replace("me he dormido: ", "")

                # Series
                case 4:
                    # Salta el guion al principio de la linea
                    if stripped[0] == "-":
                        stripped = stripped[2:]
                    else:
                        stripped = "fallito"
                    series.append(stripped.capitalize())

    return pelis, actividades, despertarse, dormir, series


lista_pelis_año = {}
lista_pelis = []

lista_series_año = {}
lista_series = []

lista_actividades = {}

lista_despertarse = []
lista_dormir = []

archivos_encontrados = 0

for i in sorted_files:
    archivo = dir + i
    archivos_encontrados += 1

    pelis, actividades, despertarse, dormir, series = leer_archivo(archivo)

    fecha_str = i.replace(".md", "")
    fecha_dt = datetime.strptime(fecha_str, "%Y-%m-%d").date()

    año = fecha_dt.year

    # Pelis por año
    if año not in lista_pelis_año.keys():
        lista_pelis_año[año] = []

    for cinematografía in pelis:
        lista_pelis_año[año].append(cinematografía)

    # Series por año
    if año not in lista_series_año.keys():
        lista_series_año[año] = []

    for episodio in series:
        lista_series_año[año].append(episodio)

    # Activaddes
    for acto in actividades:
        if acto not in lista_actividades.keys():
            lista_actividades[acto] = 1
        else:
            lista_actividades[acto] += 1

    # Hora despertarse

    if len(despertarse) == 0:
        continue
    elif despertarse[-1] == ":":
        continue
    else:
        hora_despertarse = datetime.strptime(despertarse, "%H:%M")
        fecha_despertarse = (fecha_str, hora_despertarse)
        lista_despertarse.append(fecha_despertarse)

    # Hora dormir
    if len(dormir) == 0:
        continue
    elif dormir[-1] == ":":
        continue
    else:
        hora_dormir = datetime.strptime(dormir, "%H:%M")
        if hora_dormir <= datetime.strptime("12:00", "%H:%M"):
            fecha_dt += timedelta(days=1)
            fecha_str = fecha_dt.strftime('%Y-%m-%d')
        fecha_dormir = (fecha_str, hora_dormir)
        lista_dormir.append(fecha_dormir)


# Exportar como archivo
write_file_list("lista-pelis", lista_pelis_año)
write_file_list("lista-series", lista_series_año)

# Graph
despertarse_df = pd.DataFrame(lista_despertarse, columns=[
                              "fecha", "hora despertarse"])
dormir_df = pd.DataFrame(lista_dormir, columns=["fecha", "hora dormir"])

despertarse_df["fecha"] = pd.to_datetime(
    despertarse_df["fecha"], format="%Y-%m-%d")
despertarse_df["hora despertarse"] = pd.to_datetime(
    despertarse_df["hora despertarse"], format="%H:%M")
despertarse_df = despertarse_df.set_index("fecha")  # eje X

dormir_df["fecha"] = pd.to_datetime(dormir_df["fecha"], format="%Y-%m-%d")
dormir_df["hora dormir"] = pd.to_datetime(
    dormir_df["hora dormir"], format="%H:%M")
dormir_df = dormir_df.set_index("fecha")  # eje X

# Plot settings
despertarse_color = "orange"
dormir_color = "blue"
despertarse_label = "Despertarse"
dormir_label = "Dormir"

# 2 graficos
# fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4))
# despertarse_df.plot(marker='o', linestyle='none', ax=ax1,
#                     title=despertarse_label, label=despertarse_label, color=despertarse_color)
# dormir_df.plot(marker='o', linestyle='none', ax=ax2,
#                title=dormir_label, label=dormir_label, color=dormir_color)

# 1 graficos
fig, ax = plt.subplots(figsize=(10, 4))
despertarse_df.plot(marker='o', linestyle='none', ax=ax,
                    label=despertarse_label, color=despertarse_color)
dormir_df.plot(marker='o', linestyle='none', ax=ax,
               label=dormir_label, color=dormir_color)
plt.gca().invert_yaxis()

# Gradiente azul → amarillo → azul
n = 512
alpha = -0.1
azul = np.array([0, 0, 1])
amarillo = np.array([1, 1, 0])

# --- Construir gradiente ---
t = np.linspace(0, 1, n)
dist = np.abs(t - 0.5) * 2
dist = np.clip(dist / (1 - alpha), 0, 1)
gradient = azul * dist[:, None] + amarillo * (1 - dist[:, None])

# --- Plot ---
xlim = ax.get_xlim()
ylim = ax.get_ylim()
ax.imshow(gradient[:, None, :], aspect='auto', extent=[
          xlim[0], xlim[1], ylim[0], ylim[1]], origin='lower', alpha=0.5, zorder=-1)

# Mostrar grafica
mplcursors.cursor(ax, hover=True)  # ← tooltip al pasar el ratón
ax.legend()

# Print values
# print(f"Pelis:\n{lista_pelis_año}\n")
# print(f"Series:\n{lista_series_año}\n")
print(f"Actividades:\n{lista_actividades}\n")
print(f"{despertarse_df}\n{dormir_df}")
print(f"\nNº archivos encontrados: {archivos_encontrados}")

# Guardar grafica
plt.savefig('mimir-graph.svg', dpi=300)
print("(Plot saved!)")

# Confirmacion
if input("¿Quieres mostrar el grafo? [y/N] ").strip().lower() == "y":
    plt.show()
plt.close()
