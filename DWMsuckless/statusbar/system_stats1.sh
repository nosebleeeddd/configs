#!/bin/sh
# Lightweight system stats for dwmblocks-async
# Update interval: 30s

# -------------------------
# CPU usage
# -------------------------
read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
usage=$(( (user + system) * 100 / total ))

# -------------------------
# CPU temperature
# -------------------------
# Reads temperature in milli-Celsius and converts to Celsius
if [ -r /sys/class/thermal/thermal_zone0/temp ]; then
    temp=$(</sys/class/thermal/thermal_zone0/temp)
    temp=$((temp / 1000))
else
    temp="N/A"
fi

# -------------------------
# RAM usage
# -------------------------
# Using -m for megabytes, faster than -h
read total used free shared buff cache <<< $(free -m | awk '/Mem:/ {print $2,$3,$4,$5,$6,$7}')
ram="${used}M/${total}M"

# -------------------------
# Disk usage
# -------------------------
read _ used total _ < <(df -m / | awk 'NR==2 {print $1,$3,$2,$5}')
disk="${used}M/${total}M"

# -------------------------
# Output
# -------------------------
printf "CPU %s%% %s°C | RAM %s | DISK %s\n" "$usage" "$temp" "$ram" "$disk"
