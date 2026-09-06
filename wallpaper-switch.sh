WALLPAPER="$(find /home/enzo/Pictures/wallpaper/* -type f | wofi -d --insensitive)"

echo $WALLPAPER
if [ -z $WALLPAPER ]; then
    WALLPAPER="/home/enzo/Pictures/wallpaper/nixos/nixos-pride-pastel.png"
fi
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"

