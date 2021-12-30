#!/usr/bin/env bash

op=$( echo -e "襤 Poweroff\n漏 Reboot\n⏾ Suspend\n Lock\n﫼 Logout" | wofi \
    --width 200 --height 160 -i --dmenu | awk '{print tolower($2)}' )

case $op in
    poweroff)
        ;&
    reboot)
        ;&
    suspend)
        systemctl $op
        ;;
    lock)
		swaylock
        ;;
    logout)
        swaymsg exit
        ;;
esac
