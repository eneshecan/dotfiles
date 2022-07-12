#!/usr/bin/env bash

if ! playerctl position > /dev/null 2>&1; then
	exit
fi

if ! playerctl metadata mpris:length > /dev/null 2>&1; then
	echo "0"
	exit
fi

threshold=20  # seconds
pos_int=$(printf "%.0f" ${1})
duration=$(playerctl metadata mpris:length)
pos=$((${pos_int} * ${duration} / 100000000))
current_pos=$(printf "%.0f" $(playerctl position))
diff_pos=$((${pos} - ${current_pos}))

if [ ${diff_pos} -gt ${threshold} ] || [ ${diff_pos} -lt -${threshold} ]; then
	playerctl position $pos
fi
