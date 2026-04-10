#!/bin/bash

# CPU usage
cpu=$(awk '/^cpu / {u=$2+$4; t=$2+$4+$5; print int((u/t)*100)}' /proc/stat)
cpu=${cpu:-N/A}

# CPU temperature
if [ -r /sys/class/thermal/thermal_zone0/temp ]; then
    read -r temp < /sys/class/thermal/thermal_zone0/temp
    temp=$((temp / 1000))
else
    temp="N/A"
fi

# RAM usage
read -r _ total used _ < <(free -h | grep Mem:)
ram="$used/$total"

# Disk usage
read -r _ _ used total _ < <(df -h / | tail -n1)
disk="$used/$total"

# Output
printf "CPU %s%% %s°C | RAM %s | DISK %s\n" "$cpu" "$temp" "$ram" "$disk"
