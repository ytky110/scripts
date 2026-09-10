#!/bin/sh

#ON_LAYOUT="ch"
#OFF_LAYOUT="ch"
ON_LAYOUT="onishi-chfr"
OFF_LAYOUT="yutaka"

last=""

while true; do
    im=$(/usr/bin/fcitx5-remote -n 2>/dev/null)

    if [ "$im" = "mozc" ]; then
        state="on"
    else
        state="off"
    fi

    if [ "$state" != "$last" ]; then
        if [ "$state" = "on" ]; then
            /usr/bin/swaymsg input type:keyboard xkb_layout "$ON_LAYOUT" #>/dev/null
        else
            /usr/bin/swaymsg input type:keyboard xkb_layout "$OFF_LAYOUT" #>/dev/null
        fi

        last="$state"
    fi

    sleep 0.05
done
