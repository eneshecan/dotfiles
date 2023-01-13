#!/usr/bin/env bash

tmp_weather="/tmp/eww/weather"
tmp_weather_stat=$tmp_weather/weatherstat
tmp_weather_degree=$tmp_weather/weatherdegree
tmp_weather_hex=$tmp_weather/weatherhex
tmp_weather_icon=$tmp_weather/weathericon
tmp_weather_location=$tmp_weather/weatherlocation

if [ ! -d $tmp_weather ]; then
    mkdir -p $tmp_weather
fi

# Put in your api and stuff link here
# If you dunno, head to openweathermap.org, and make and account
# (completely free I swear, and then get your API Key and  your City ID)
# I wish I was smart enough to do it like Elena, but this is the top I could do lol
KEY="80dc3a2d0e9d9a11cacbd95501dedc17"
ID="2892794"
UNIT="metric" #Options are 'metric' and 'imperial'
weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?id="$ID"&appid="$KEY"&units="$UNIT"")
echo $weather
if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
    weather_location=$(echo "$weather" | jq -r ".name" | head -1)
	weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g")

	#Big long if statement of doom
	if [ "$weather_icon_code" == "50d"  ]; then
		weather_icon=" "
        weather_hex="#84afdb"  #a7b8b2
    elif [ "$weather_icon_code" == "50n"  ]; then
        weather_icon=" "
        weather_hex="#84afdb"
	elif [ "$weather_icon_code" == "01d"  ]; then
        weather_icon=" "
        weather_hex="#ffd86b"
    elif [ "$weather_icon_code" == "01n"  ]; then
        weather_icon=" "
        weather_hex="#fcdcf6"
    elif [ "$weather_icon_code" == "02d"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "02n"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "03d"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "03n"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "04d"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "04n"  ]; then
        weather_icon=" "
        weather_hex="#adadff"
    elif [ "$weather_icon_code" == "09d"  ]; then
        weather_icon=" "
        weather_hex="#6b95ff"
    elif [ "$weather_icon_code" == "09n"  ]; then
        weather_icon=" "
        weather_hex="#6b95ff"
    elif [ "$weather_icon_code" == "10d"  ]; then
        weather_icon=" "
        weather_hex="#6b95ff"
    elif [ "$weather_icon_code" == "10n"  ]; then
        weather_icon=" "
        weather_hex="#6b95ff"
    elif [ "$weather_icon_code" == "11d"  ]; then
        weather_icon=""
        weather_hex="#ffeb57"
    elif [ "$weather_icon_code" == "11n"  ]; then
        weather_icon=""
        weather_hex="#ffeb57"
    elif [ "$weather_icon_code" == "13d"  ]; then
        weather_icon=" "
        weather_hex="#e3e6fc"
    elif [ "$weather_icon_code" == "13n"  ]; then
        weather_icon=" "
        weather_hex="#e3e6fc"
    elif [ "$weather_icon_code" == "40d"  ]; then
        weather_icon=" "
        weather_hex="#84afdb"
    elif [ "$weather_icon_code" == "40n"  ]; then
        weather_icon=" "
        weather_hex="#84afdb"
    else
        weather_icon=" "
        weather_hex="#adadff"
    fi
        echo "$weather_icon" >  $tmp_weather_icon
        echo "$weather_description" > $tmp_weather_stat
        echo "$weather_temp""°C" > $tmp_weather_degree
        echo "$weather_hex" > $tmp_weather_hex
        echo "$weather_location" > $tmp_weather_location
    else
        echo "Unknown Weather" > $tmp_weather_stat
        echo " " > $tmp_weather_icon
        echo "-" > $tmp_weather_degree
        echo "#adadff" > $tmp_weather_hex
        echo "Unknown Location" > $tmp_weather_location
fi

