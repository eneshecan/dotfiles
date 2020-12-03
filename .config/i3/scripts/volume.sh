#!/bin/sh

OP=${1}
ICON=notification-audio-volume-medium

getSink() {
    pacmd list-sinks | awk '/index:/{i++} /* index:/{print i; exit}'
}

getVolume() {
    pacmd list-sinks | awk '/^\svolume:/{i++} i=='$(getSink)'{print $5; exit}'
}

if [ ${OP} == "inc" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ ${OP} == "dec" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ ${OP} == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ ${OP} == "micmute" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi

LEVEL=$(getVolume)
notify-send -u low -i ${ICON} -h string:x-canonical-private-synchronous:anything ${LEVEL}
