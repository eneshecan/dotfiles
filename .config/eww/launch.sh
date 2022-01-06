#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.xyz"
EWW="/usr/bin/eww"

## Open widgets 
run_eww() {
	${EWW} open-many \
		   time_side \
		   weather_side \
		   calendar_side \
		   player_side \
		   sliders_side \
		   power_side
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close-all
	rm "$FILE"
fi
