#!/bin/sh
# dmenu prompt
# label $1
# command $2
$(echo sudo brightnessctl -d "intel_backlight set $1)
echo "a" | dmenu -i 
