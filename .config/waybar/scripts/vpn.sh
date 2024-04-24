#!/usr/bin/env bash

op=${1}
name="4-VPN-443udp"

if [ "${op}" == "toggle" ]; then
    if test -d /proc/sys/net/ipv4/conf/tun0 ; then
        openvpn3 session-manage --disconnect --config ${name}.ovpn > /dev/null 2>&1
    else
        printf "username\npassword\n" | openvpn3 session-start --config ${name}.ovpn > /dev/null 2>&1
    fi
elif [ "${op}" == "gettext" ]; then
    if test -d /proc/sys/net/ipv4/conf/tun0 ; then
        echo "{\"text\": \"\", \"class\": \"connected\", \"tooltip\": \"Connected to ${name}\"}"
    else
        echo "{\"text\": \"\", \"class\": \"disconnected\", \"tooltip\": \"Disconnected from ${name}\"}"
    fi
fi
