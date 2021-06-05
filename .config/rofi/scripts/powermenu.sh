#!/usr/bin/env bash
rofi_command="rofi"
ROFI_DIR="/home/juki/.config/rofi"

# Options
shutdown="「 シャットダウン 」 Shutdown"
reboot="「 リブート 」 Reboot"
suspend="「 サスペンド 」 Suspend"
logout="「 ログアウト 」 Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        $ROFI_DIR/scripts/promptmenu.sh --yes-command "poweroff" --query "     Poweroff?"
    ;;
    $reboot)
        $ROFI_DIR/scripts/promptmenu.sh --yes-command "reboot" --query "      Reboot?"
    ;;
    $suspend)
        systemctl suspend
    ;;
    $logout)
        $ROFI_DIR/scripts/promptmenu.sh --yes-command "pkill -KILL -u $(whoami)" --query "      Logout?"
    ;;
esac
