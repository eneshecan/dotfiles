#!/bin/sh

OP=${1}
ICON=notification-audio-volume-medium

if [ ${OP} == "inc" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ ${OP} == "dec" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ ${OP} == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ${ICON}
elif [ ${OP} == "micmute" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi

LEVEL=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
notify-send -u low -i ${ICON} -h string:x-canonical-private-synchronous:anything ${LEVEL}
