#!/usr/bin/env bash

op=${1}

if [ "${op}" == "inc" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "${op}" == "dec" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "${op}" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ "${op}" == "micmute" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi

activeSink=$(pacmd list-sinks | awk '/* index:/{print $3}')
level=$(($(pacmd list-sinks | grep -wA 15 'index: '${activeSink}'' | grep 'volume:' | grep -E -v 'base volume:' | awk -F : '{print $3}' | grep -o -P '.{0,3}%'| sed s/.$// | tr -d ' ')))
muteStatus=$(pacmd list-sinks | grep -A 15 'index: '${activeSink}'' | awk '/muted/{ print $2}')
icon="notification-audio-volume-medium"
if [ "${muteStatus}" == "yes" ]; then
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
