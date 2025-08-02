#!/bin/env bash
# Copiar y pegar caracteres ascii

# Configurar teclado para que no haya problemas
setxkbmap es

script_file="$HOME/.local/share/tabla_ascii.txt"
if [ ! -f "$script_file" ]; then
	notify-send "No hay archivo con los símbolos" ":/"
	exit
fi

selected=$(rofi -dmenu -i < "$script_file")
if [ -z "$selected" ]; then
	exit
fi

simbolo=$(echo "$selected" | sed -E 's/^(\S+).*/\1/')

echo -n "$simbolo" | xclip -selection primary   # Mid click
echo -n "$simbolo" | xclip -selection clipboard # <C-v>
xdotool key --clearmodifiers Shift+Insert
