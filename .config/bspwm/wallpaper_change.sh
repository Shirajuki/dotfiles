monitor_count=$(xrandr --listmonitors | grep '*' | awk {'print $4'} | wc -l)
current_workspace=$(bspc query -D -d focused --names)
m=1

if [ $monitor_count -gt $m ]; then
	if [ $current_workspace == "一" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_pekora_2.2.jpg
	elif [ $current_workspace == "二" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_4fit.jpg
	elif [ $current_workspace == "三" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_1.jpg
	elif [ $current_workspace == "四" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_pekora_1fit.jpg
	else
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_2.png
	fi
else
	if [ $current_workspace == "一" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_pekora_2.2.jpg
	elif [ $current_workspace == "二" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_4fit.jpg
	elif [ $current_workspace == "三" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_1.jpg
	elif [ $current_workspace == "四" ]; then
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_pekora_1fit.jpg
	else
		nitrogen --set-zoom-fill /home/juki/.wallpapers/simp_aqua_2.png
	fi
fi

