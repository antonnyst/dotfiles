#!/bin/bash
EXISTS=$(hyprctl clients -j | jq -r '.[] | .title | select(. == "drun") | length > 0')

if [ "$EXISTS" = "true" ]; then
  hyprctl dispatch focuswindow title:drun
else
  wofi --show drun
fi
