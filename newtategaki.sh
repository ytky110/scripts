#!/bin/sh

conf="$HOME/.tategaki_template.conf"

if [ "$#" != 0 -a "$1" = "--help" ]
then
    echo "Copy odt file of empty tategaki text for new document."
    echo "usage: newtategaki.sh [FILENAME]"
    echo "If FILENAME is not supecified, it becames 'a.odt'"
fi

if [ ! -e "$conf" ]
then
    echo "Please write the path of tategaki template in 1st line of '~/.tategaki_template.conf'." >&2
    exit 1
fi

path=$(head -n 1 "$conf" | sed "s;~;$HOME;")

if [ ! -e "$path" ]
then
    echo "Template file don't exist at configurated path." >&2
    echo "  Path = '$path'"
    echo "Please check '~/.tategaki_template.conf'." >&2
    exit 1
fi

case "$#" in
    0)
        cp "$path" "$PWD/a.odt" || exit 1
        ;;
    1)
        cp "$path" "$1" || exit 1
        ;;
    *)
        echo "Too much arguments." >&2
        exit 1
        ;;
esac

exit 0
