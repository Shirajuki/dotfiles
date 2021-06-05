#!/usr/bin/env bash

echo $(curl --silent https://ukenr.no/ | grep id=\"ugenr\" | awk '{split($0,a," "); print a[3]}' | awk '{split($0,a,"<"); print a[1]}');
