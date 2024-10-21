#!/bin/zsh

# Path to wallpaper
WALLPAPER="${XDG_CONFIG_HOME:-$HOME/.config}/bg/wallpaper.jpg"

# Get list of connected monitors
n_monitors=$(xrandr --listactivemonitors | awk 'NR == 1 {print $2}')

# Set the background
for ((i=0; i<n_monitors; i++)); do
    feh --bg-fill "$WALLPAPER" --no-fehbg
done
