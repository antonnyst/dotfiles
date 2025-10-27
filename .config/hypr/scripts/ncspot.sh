#!/bin/bash

EXISTS=$(hyprctl clients -j | jq -c -r '.[] | .tags | select(length > 0) | length > 0')

if [ "$EXISTS" = "true" ]; then
  hyprctl dispatch togglespecialworkspace music
else
  hyprctl dispatch movetoworkspace special:music
  ncspot
fi 




