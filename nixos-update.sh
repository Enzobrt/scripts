#!/usr/bin/env bash

set -e

FLAKE="/etc/nixos#nixos"

echo "======================================"
echo "       NixOS Configuration Update"
echo "======================================"
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

sudo nixos-rebuild switch --flake "$FLAKE"

echo
echo "======================================"
echo "       ✅ NixOS actualizado"
echo "======================================"
