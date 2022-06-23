#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Missing operation argument"
    exit 1
fi


op=$1

confirm_exit() {
    echo -e "Yes\nNo" | (! pgrep -x wofi && wofi -p "Do you really want to ${op}?" --width 300 --height 120 --dmenu)
}

if [[ $op == "lock" ]]; then
    swaylock
else
    ans=$(confirm_exit &)
    if [[ $ans == "Yes" ]]; then
        if [[ $op == "logout" ]]; then
            swaymsg exit
        elif [[ $op == "suspend" ]]; then
            systemctl suspend
        elif [[ $op == "reboot" ]]; then
            systemctl reboot
        elif [[ $op == "poweroff" ]]; then
            systemctl poweroff
        else
            echo "Invalid operation"
            exit 1
        fi
    elif [[ $ans == "No" ]]; then
	    exit 0
	fi
fi

