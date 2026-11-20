#!/usr/bin/env bash
# Screenshot like GNOME: copy to the clipboard and save to ~/Pictures/Screenshots.
# Usage: screenshot.sh area|active|screen|output [--edit]
#   --edit opens the shot in satty for annotation instead (save with Ctrl+S, copy with Ctrl+C).
set -euo pipefail

target="${1:-area}"
dir="${XDG_SCREENSHOTS_DIR:-$HOME/Pictures/Screenshots}"
mkdir -p "$dir"
file="$dir/Screenshot from $(date '+%Y-%m-%d %H-%M-%S').png"

if [[ "${2:-}" == "--edit" ]]; then
    grimblast --freeze save "$target" - |
        satty --filename - --output-filename "$file" --copy-command wl-copy --early-exit
else
    grimblast --notify --freeze copysave "$target" "$file"
fi
