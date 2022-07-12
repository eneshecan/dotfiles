#!/usr/bin/env bash

op=${1}

light "${op}" 5

brightness=$( printf "%.0f" $(light -G) )
icon="notification-display-brightness-medium"
if [ ${brightness} -gt 70 ]; then
    icon="notification-display-brightness-high"
elif [ ${brightness} -lt 30 ]; then
    icon="notification-display-brightness-low"
else
    icon="notification-display-brightness-medium"
fi

notify-send -u low -i ${icon} -h string:x-canonical-private-synchronous:anything "${brightness}%"
