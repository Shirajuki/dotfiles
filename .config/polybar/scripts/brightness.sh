#!/usr/bin/env bash

max=$(eval "brightnessctl m")
curr=$(eval "brightnessctl g")
curr=$(($curr*100))
echo $(($curr/$max))%
