#!/usr/bin/env bash

op=${1}

if [ "${op}" == "inc" ]; then
    pamixer --increase 5
elif [ "${op}" == "dec" ]; then
    pamixer --decrease 5
elif [ "${op}" == "mute" ]; then
    pamixer --toggle-mute
fi

level=$(pamixer --get-volume)
muteStatus=$(pamixer --get-mute)
icon="notification-audio-volume-medium"
if [ "${muteStatus}" == "true" ]; then
    level=0
    icon="notification-audio-volume-muted"
elif [ ${level} -gt 70 ]; then
    icon="notification-audio-volume-high"
elif [ ${level} -lt 30 ]; then
    icon="notification-audio-volume-low"
else
    icon="notification-audio-volume-medium"
fi

notify-send -u low -i ${icon} -h string:x-canonical-private-synchronous:anything "${level}%"
