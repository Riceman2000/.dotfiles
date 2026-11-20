#!/usr/bin/env bash
# Power menu (GNOME: Ctrl+Alt+Delete). Log out / restart / shut down go through
# hyprshutdown, which asks apps to close cleanly first.
set -euo pipefail

choice="$(printf '%s\n' \
    "  Lock" \
    "󰤄  Suspend" \
    "󰍃  Log out" \
    "  Restart" \
    "⏻  Shut down" |
    fuzzel --dmenu --prompt 'Power  ' --lines 5 --width 20)" || exit 0

case "$choice" in
    *Lock) loginctl lock-session ;;
    *Suspend) systemctl suspend ;;
    *"Log out") hyprshutdown --top-label "Logging out..." ;;
    *Restart) hyprshutdown --top-label "Restarting..." --post-cmd "systemctl reboot" ;;
    *"Shut down") hyprshutdown --top-label "Shutting down..." --post-cmd "systemctl poweroff" ;;
esac
