#!/usr/bin/env bash

set -e

cd /etc/nixos/

FLAKE="/etc/nixos#nixos"

echo "======================================"
echo "       NixOS Configuration Update"
echo "======================================"
echo

# Check if there are changes in the configuration
if git diff --quiet && git diff --cached --quiet && [ -z "$(git status --porcelain)" ]; then
    echo "No configuration changes detected, exiting."
    exit 0
fi

echo "Changes detected:"
echo "$(git status --porcelain)"

echo "→ Formating files"
echo

alejandra . &>/dev/null \
  || {
    alejandra .
    echo "❌ Formatting failed!"
    exit 1
  }

echo "✅ Formatting completed."
echo

# Stage formatted changes
git add /etc/nixos/*

echo "→ Added changes"
echo

echo "→ Ejecutando dry-build..."
echo

if ! sudo nixos-rebuild dry-build --flake "$FLAKE"; then
    echo
    echo "❌ dry-build ha fallado."
    echo "No se ha aplicado ningún cambio."
    exit 1
fi

echo
echo "✅ dry-build correcto."
echo

read -rp "¿Quieres aplicar la configuración? [y/N] " answer

if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
    echo "Cancelado."
    exit 0
fi

echo
echo "→ Aplicando configuración..."
echo

#sudo nixos-rebuild switch --flake "$FLAKE"
sudo nixos-rebuild switch --flake "$FLAKE" &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

echo "======================================"
echo "       ✅ NixOS actualizado"
echo "======================================"
echo

notify-send -e "NixOS Rebuilt Correctly!" \
    --icon=software-update-available

echo "→ Generación actual: $(readlink /nix/var/nix/profiles/system | cut -d- -f2)"

git add /etc/nixos/nixos-switch.log
