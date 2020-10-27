#!/bin/bash

if [[ "$(playerctl status 2> /dev/null)" == "Playing" || "$(playerctl status 2> /dev/null)" == "Paused" ]]; then
    playerctl --player=playerctld metadata --format "{{ title }} - {{ artist }}"
else
    echo ""
fi
