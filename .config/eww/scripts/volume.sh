#!/usr/bin/env sh

percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d\n", $2 * 100 + 0.5}')

if [ "$1" = "icon" ]; then
    if [ $percent = 0 ]; then
        echo "󰝟"
    else
        echo "󰕾"
    fi
else
    echo $percent
fi
