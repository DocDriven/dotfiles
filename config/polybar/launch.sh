#!/bin/env bash

# Terminate already running bar instances and wait until processes shut down
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Wait for X
while ! xset q &>/dev/null; do sleep 1; done

# Launch top and bottom bar
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)
top_log="/tmp/polybar_top.log"
bottom_log="/tmp/polybar_bottom.log"

echo "---" | tee -a "${top_log}" " ${bottom_log}"

MONITORS="${monitors}" polybar top -r -c "${XDG_CONFIG_HOME}/polybar/config.ini" >>"${top_log}" 2>&1 &
MONITORS="${monitors}" polybar bottom -r -c "${XDG_CONFIG_HOME}/polybar/config.ini" >>"${bottom_log}" 2>&1 &
