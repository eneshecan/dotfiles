#!/usr/bin/env bash

if ! playerctl position > /dev/null 2>&1; then
	echo "0"
	exit
fi

position=$(echo "$(playerctl position) * 1000000" | bc)
duration=$(playerctl metadata mpris:length)

echo "${position} * 100 / ${duration}" | bc
