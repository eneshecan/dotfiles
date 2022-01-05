#!/usr/bin/env bash

confirm_exit() {
    echo -e "Yes\nNo" | wofi -p "Are you sure?" --width 200 --height 120 --dmenu
}

ans=$(confirm_exit &)
if [[ $ans == "Yes" ]]; then
	systemctl reboot
elif [[ $ans == "No" ]]; then
	exit 0
fi

