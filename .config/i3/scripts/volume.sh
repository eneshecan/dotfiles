#!/bin/sh

OP=${1}

getSink() {
    pacmd list-sinks | awk '/* index:/{print $3}'
}

getVolume() {
    pacmd list-sinks |grep -wA 15 'index: '$(getSink)'' |grep 'volume:' |egrep -v 'base volume:' |awk -F : '{print $3}' |grep -o -P '.{0,3}%'|sed s/.$// |tr -d ' '
}

getIcon() {
    muteStatus=$(pacmd list-sinks |grep -A 15 'index: '$(getSink)'' | awk '/muted/{ print $2}')
    if [ "${muteStatus}" == "yes" ]; then
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

LEVEL="$(getVolume)%"
notify-send -u low -i $(getIcon) -h string:x-canonical-private-synchronous:anything ${LEVEL}
