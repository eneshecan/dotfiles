#!/usr/bin/env bash

op=${1}
name="VPN"

if [ "${op}" == "toggle" ]; then
    if test -d /proc/sys/net/ipv4/conf/tun0 ; then
        nmcli connection down ${name} > /dev/null 2>&1
    else
        nmcli connection up ${name} > /dev/null 2>&1
    fi
elif [ "${op}" == "gettext" ]; then
    if test -d /proc/sys/net/ipv4/conf/tun0 ; then
        echo "{\"text\": \"\", \"class\": \"connected\", \"tooltip\": \"Connected to ${name}\"}"
    else
        echo "{\"text\": \"\", \"class\": \"disconnected\", \"tooltip\": \"Disconnected from ${name}\"}"
    fi
fi
