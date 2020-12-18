#!/bin/sh
# dmenu prompt
# label $1
# command $2
choices='yes\nno'
chosen=$(echo "${choices}" | dmenu -i -p "$1")
case "$chosen" in
	yes) $(echo $2) ;;
esac
