#!/bin/bash
# ~/.config/dwmblocks/music.sh
# Music block for dwmblocks
# Supports Spotify, Chromium, Brave
# Updates on click and on track change

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Signal number used in blocks.def.h for this block
SIGNAL=10

# Detect first active player
player=$(playerctl -l 2>/dev/null | grep -E 'spotify|chromium|brave' | head -n1)
[ -z "$player" ] && { echo "♫ Stopped"; exit 0; }

# Handle click events
case "$BLOCK_BUTTON" in
    1) playerctl -p "$player" play-pause 2>/dev/null ;;
    2) playerctl -p "$player" previous 2>/dev/null ;;
    3) playerctl -p "$player" next 2>/dev/null ;;
esac

# Trigger immediate block refresh on click
[ -n "$BLOCK_BUTTON" ] && pkill -RTMIN+$SIGNAL dwmblocks

# Get player status
status=$(playerctl -p "$player" status 2>/dev/null)
case "$status" in
    Playing) symbol="▶" ;;
    Paused)  symbol="⏸" ;;
    *) symbol="⏹" ;;
esac

# Set player icon
case "$player" in
    spotify) icon="♫" ;;
    chromium|brave) icon="🌐" ;;
    *) icon="♪" ;;
esac

# Get current track info
info=$(playerctl -p "$player" metadata --format '{{artist}} - {{title}}' 2>/dev/null)

# Display
echo "$icon $symbol $info |"
