#!/bin/sh

# BATTERY STATUS WITH DEPLETING BAR
bat="/sys/class/power_supply/BAT0"

capacity=$(cat $bat/capacity)
status=$(cat $bat/status)

bars=10
filled=$((capacity * bars / 100))
empty=$((bars - filled))

fill=$(printf "%0.s█" $(seq 1 $filled))
blank=$(printf "%0.s░" $(seq 1 $empty))

if [ "$status" = "Charging" ]; then
    icon="CHR"
else
    icon="BAT"
fi

printf "%s [%s%s] %d%%\n" "$icon" "$fill" "$blank" "$capacity"
