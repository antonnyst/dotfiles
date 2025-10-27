#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
MONITORS=($(hyprctl monitors -j | jq -r '.[] | .name'))
MONITOR_COUNT=$(hyprctl monitors -j | jq -r 'length')
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f | shuf -n $MONITOR_COUNT))

for i in $(seq 1 $MONITOR_COUNT);
do
	echo $i
	hyprctl hyprpaper reload "${MONITORS[i-1]},${WALLPAPERS[i-1]}" 	
done

