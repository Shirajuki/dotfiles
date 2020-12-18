#!/bin/sh
#bindsym $mod+$alt+q sudo -A shutdown -h now
#sudo -A reboot
#sudo -A systemctl suspend

choices='\n\n\nshutdown\nrestart\nhibernate'
chosen=$(echo "${choices}" | dmenu -i)
case "$chosen" in
	shutdown) shutdown -h now ;;
	restart) reboot ;;
	hibernate) systemctl suspend ;;
esac

