#!/usr/bin/env bash

WIDGET=$1
FILE="$HOME/.cache/eww_launch_${WIDGET}.xyz"
EWW="/usr/bin/eww"

run_eww() {
	${EWW} open ${WIDGET}
}

if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close ${WIDGET}
	rm "$FILE"
fi

