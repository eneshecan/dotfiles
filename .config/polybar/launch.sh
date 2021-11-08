#!/usr/bin/env bash

BAR_NAME=top

# Terminate already running bar instances
killall -q polybar

# Launch bar on connected monitors
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch bar on primary monitor first for tray icons
MONITOR=$PRIMARY polybar --reload $BAR_NAME &
sleep 1

# Launch bar on all other monitors
for m in $OTHERS; do
    MONITOR=$m polybar --reload $BAR_NAME &
done
