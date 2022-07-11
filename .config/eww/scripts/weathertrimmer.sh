#!/usr/bin/env bash

weather=$(cat /tmp/eww/weather/weather-stat)
weather_count=$(cat /tmp/eww/weather/weather-stat | wc -c)

if [ "$weather_count" -lt 10 ]; then
	echo $weather;
else 
	echo $(cat /tmp/eww/weather/weather-stat | cut -c1-16)...
fi
