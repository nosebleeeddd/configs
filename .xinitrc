#!/bin/sh

# for second monitor output and turn off laptop screen
xrandr --output HDMI-1-0 --mode 1920x1080 --rate 180
xrandr --output eDP --off
# background manager (FEH)

feh --bg-fill Downloads/wallhaven-je1jdm.png
#fonts
xset +fp /usr/share/fonts/X11/misc
xset fp rehash

# Automatically update music block on track changes
playerctl metadata --format '{{artist}} - {{title}}' --follow 2>/dev/null |
while read; do
    pkill -RTMIN+1 dwmblocks
done &

# start dwm and status bar
dwmblocks &

exec dwm

