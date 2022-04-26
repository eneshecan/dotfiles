#!/usr/bin/env bash

widget=$1
file="$HOME/.cache/eww_launch_${widget}.xyz"
eww="/usr/bin/eww"

run_eww() {
	${eww} open ${widget}
}

if [[ ! -f "$file" ]]; then
	touch "$file"
	run_eww
else
	${eww} close ${widget}
	rm "$file"
fi

