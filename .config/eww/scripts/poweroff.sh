#!/usr/bin/env bash

confirm_exit() {
    echo -e "Yes\nNo" | wofi -p "Do you want to poweroff?" --width 260 --height 120 --dmenu
}

ans=$(confirm_exit &)
if [[ $ans == "Yes" ]]; then
	systemctl poweroff
elif [[ $ans == "No" ]]; then
	exit 0
fi

