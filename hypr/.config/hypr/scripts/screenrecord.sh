#!/usr/bin/env bash
# Start or stop a screen recording (GNOME: Ctrl+Alt+Shift+R).
# gpu-screen-recorder encodes on the Nvidia GPU. The first run asks which screen to
# record through the portal; later runs reuse that choice.
# Saved to ~/Videos/Screencasts, like GNOME.
set -uo pipefail

# Match the full command line: the process name is truncated (and wrapped on NixOS).
if pkill -INT -f 'gpu-screen-recorder.* -w portal'; then
    exit 0 # the running instance sends the "saved" notification below
fi

dir="$HOME/Videos/Screencasts"
mkdir -p "$dir"
file="$dir/Screencast from $(date '+%Y-%m-%d %H-%M-%S').mp4"

notify-send -a "Screen recorder" -i media-record "Recording started" "Press Ctrl+Alt+Shift+R to stop"
if gpu-screen-recorder -w portal -restore-portal-session yes -f 60 -a default_output -o "$file"; then
    notify-send -a "Screen recorder" -i video-x-generic "Recording saved" "$file"
else
    notify-send -a "Screen recorder" -u critical "Recording failed" "See: journalctl --user -t gpu-screen-recorder"
fi
