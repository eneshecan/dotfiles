#!/bin/sh

OP=${1}

xbacklight "-${OP}" 5
notify-send -u low -i notification-display-brightness -h string:x-canonical-private-synchronous:anything $(xbacklight -get)
