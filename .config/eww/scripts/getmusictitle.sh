#!/usr/bin/env bash

title=$(playerctl metadata --format '{{ title }}')
count=$(echo -n "$title" | wc -c)
if [ -z "$title" ]; then
	echo "No Title...";
else
	if [ "$count" -le 18 ]; then
		echo $title
	else 
		echo $(playerctl metadata --format '{{ title }}' | awk '{print $1, $2}')...
	fi
fi

