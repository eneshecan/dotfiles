#!/usr/bin/env bash

op=${1}
name="VPN-unrooted"
status="$(systemctl is-active openvpn@${name}.service)"

if [ "${op}" == "toggle" ]; then
    if [ "${status}" == "active" ]; then
        systemctl stop openvpn@${name}.service
    else
        systemctl start openvpn@${name}.service
    fi
elif [ "${op}" == "gettext" ]; then
    if [ "${status}" == "active" ]; then
        echo "{\"text\": \"󰌾\", \"class\": \"connected\", \"tooltip\": \"Connected to ${name}\"}"
    else
        echo "{\"text\": \"󰿆\", \"class\": \"disconnected\", \"tooltip\": \"Disconnected from ${name}\"}"
    fi
fi
