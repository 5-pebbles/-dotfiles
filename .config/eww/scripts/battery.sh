#!/usr/bin/env sh

battery=$(ls /sys/class/power_supply | grep BAT | head -n 1)
percent=$(cat /sys/class/power_supply/$battery/capacity)

icon() {
    if [ $percent -lt 10 ]; then
        icon="󰁺"
    elif [ $percent -lt 20 ]; then
        icon="󰁻"
    elif [ $percent -lt 30 ]; then
        icon="󰁼"
    elif [ $percent -lt 40 ]; then
        icon="󰁽"
    elif [ $percent -lt 50 ]; then
        icon="󰁾"
    elif [ $percent -lt 60 ]; then
        icon="󰁿"
    elif [ $percent -lt 80 ]; then
        icon="󰂀"
    elif [ $percent -lt 90 ]; then
        icon="󰂂"
    else
        icon="󰁹"
    fi
    echo -n "$icon"
}

if [ "$1" = "icon" ]; then
    echo "$(icon)"
else
    echo $percent
fi
