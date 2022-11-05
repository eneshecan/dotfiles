#!/usr/bin/env bash

title=$(playerctl metadata --format '{{ artist }}')
count=$(echo -n "$title" | wc -c)
if [ -z "$title" ]; then
	echo "No Artist...";
else
	if [ "$count" -le 36 ]; then
		echo $title
	else
		echo $(playerctl metadata --format '{{ artist }}' | awk '{print $1, $2, $3, $4}')...
	fi
fi

