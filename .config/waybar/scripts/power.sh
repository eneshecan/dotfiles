#!/usr/bin/env bash

entries="﫼 Logout\n⏾ Suspend\n菱 Reboot\n襤 Shutdown"

selected=$(echo -e $entries|wofi --width 320 --height 220 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
    logout)
        hyprctl dispatch exit 0;;
    suspend)
        exec systemctl suspend;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff -i;;
esac
