#!/bin/sh

OP=${1}

getSink() {
    pacmd list-sinks | awk '/index:/{i++} /* index:/{print i; exit}'
}

getVolume() {
    pacmd list-sinks | awk '/^\svolume:/{i++} i=='$(getSink)'{print $5; exit}'
}

# Doesn't detect mute yet
getIcon() {
    CURRENT_SINK=$(pactl info | grep "Default Sink" | cut -f3 -d" ")
    MUTE_STATUS=$(pactl list sources | grep -A 10 ${CURRENT_SINK} | grep "Mute:")
    if [ "${MUTE_STATUS}" == "Mute: yes" ]; then
        echo "notification-audio-volume-muted"
    else
        echo "notification-audio-volume-medium"
    fi
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
notify-send -u low -i $(getIcon) -h string:x-canonical-private-synchronous:anything ${LEVEL}
