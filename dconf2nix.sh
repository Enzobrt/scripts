#!/usr/bin/env bash
# @vicinae.schemaVersion 1
# @vicinae.title Dconf2nix
# @vicinae.mode fullOutput
# @vicinae.exec ["/usr/bin/env", "bash"]
set -euo pipefail

dconf dump / > /tmp/dconf.txt
cp /tmp/dconf.txt /tmp/dconf-clean.txt

while true; do
    if dconf2nix < /tmp/dconf-clean.txt > dconf.nix 2>/tmp/dconf-error; then
        echo "✓ dconf2nix terminó correctamente"
        break
    fi

    line=$(grep -oP 'line \K[0-9]+' /tmp/dconf-error | head -1)

    if [[ -z "$line" ]]; then
        cat /tmp/dconf-error
        exit 1
    fi

    echo "Eliminando línea problemática: $line"
    sed -i "${line}d" /tmp/dconf-clean.txt
done
