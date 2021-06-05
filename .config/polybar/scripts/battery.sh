#!/usr/bin/env bash

bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage:' | awk -F '%' '{print $1}' | awk -F ' ' '{print $2}')
min=11
if [ "$bat" -lt "$min" ]
  then
	notify-send -u critical "Battery (low)" -t 12000
	brightnessctl s 450
	echo "test"
fi
