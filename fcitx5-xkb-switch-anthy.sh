#!/bin/sh

#ON_LAYOUT="ch"
#OFF_LAYOUT="ch"
ON_LAYOUT="onishi-chfr"
OFF_LAYOUT="yutaka"

last=""

sleep 3

while true; do
    im=$(/usr/local/bin/fcitx5-remote -n 2>/dev/null)

    if [ "$im" = "anthy" ]; then
        state="on"
    else
        state="off"
    fi

    if [ "$state" != "$last" ]; then
        if [ "$state" = "on" ]; then
            touch $HOME/anthy
            /usr/local/bin/swaymsg input type:keyboard xkb_layout "$ON_LAYOUT" #>/dev/null
        else
            rm -f $HOME/anthy
            /usr/local/bin/swaymsg input type:keyboard xkb_layout "$OFF_LAYOUT" #>/dev/null
        fi

        last="$state"
    fi

    sleep 0.05
done
