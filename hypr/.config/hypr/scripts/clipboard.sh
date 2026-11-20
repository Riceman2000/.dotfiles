#!/usr/bin/env bash
# Pick an entry from the clipboard history (cliphist) and copy it again.
# History is recorded by `wl-paste --watch cliphist store` (autostart.lua).
set -euo pipefail

choice="$(cliphist list | fuzzel --dmenu --prompt 'Clipboard  ' --placeholder 'Search history')" || exit 0
printf '%s' "$choice" | cliphist decode | wl-copy
