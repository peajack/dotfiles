#!/bin/sh
case "$1" in
    "full")
        scrot || exit 1
    ;;

    "area")
        scrot -fs || exit 1
    ;;
    
    *)
        exit 1
    ;;

esac

notify-send "screen shoot"
