#!/bin/env bash
# Copiar y pegar un enlace de mis notas de Obsidian

# Configurar teclado para que no haya problemas
# setxkbmap es

cd "$HOME/Documents/Notas de obsidian/" || exit

theme="$HOME/.config/rofi/vertical.rasi"
# Extraer los enlaces si están tal cual o en formato md [text](link)
selected=$(grep -roP '(?:\[[^\]]*\]\()?(https?://[^\s)]+)(?:\))?' --include=*.md --  | sort -u | rofi -dmenu -l 20 -i -theme $theme)
if [ -z "$selected" ]; then
	exit
fi

link=$(echo "$selected" | sed -E 's/.*(https?:\/\/[^)]+).*/\1/')


# Copiar al portapapeles e insertar
echo -n "$link" | xclip -selection primary   # Mid click
echo -n "$link" | xclip -selection clipboard # <C-v>
# xdotool key --clearmodifiers Shift+Insert
