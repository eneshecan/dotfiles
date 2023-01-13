#!/usr/bin/env bash

weather=$(cat /tmp/eww/weather/weatherstat)
weather_count=$(cat /tmp/eww/weather/weatherstat | wc -c)

if [ "$weather_count" -lt 24 ]; then
	echo $weather;
else
	echo $(cat /tmp/eww/weather/weatherstat | cut -c1-16)...
fi
