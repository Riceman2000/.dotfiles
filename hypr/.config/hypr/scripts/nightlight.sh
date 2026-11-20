#!/usr/bin/env bash
# Toggle night light (GNOME had it off, so there is no schedule; Super+Shift+N toggles it).
# Pass a colour temperature to change it, e.g. `nightlight.sh 3500`.
set -uo pipefail

temp="${1:-4000}"

if pkill -x hyprsunset; then
    notify-send -a "Night light" -i weather-clear "Night light off"
else
    setsid -f hyprsunset --temperature "$temp" >/dev/null 2>&1
    notify-send -a "Night light" -i weather-clear-night "Night light on" "${temp} K"
fi
