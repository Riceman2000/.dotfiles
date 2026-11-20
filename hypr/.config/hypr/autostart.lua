-- Programs started with the session. Runs once, not on config reload.
-- UWSM also runs XDG autostart entries, which already cover nm-applet and
-- gnome-keyring.

local p = require("programs")

hl.on("hyprland.start", function()
    hl.exec_cmd(p.daemon("waybar"))
    hl.exec_cmd(p.daemon("hyprpaper"))
    hl.exec_cmd(p.daemon("swaync"))
    hl.exec_cmd(p.daemon("hypridle"))
    hl.exec_cmd(p.daemon("swayosd-server"))
    hl.exec_cmd(p.daemon(p.launcher .. " -d")) -- keep the launcher warm
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")

    -- Clipboard history, and keep the clipboard after the source app closes.
    hl.exec_cmd(p.daemon("wl-paste --watch cliphist store"))
    hl.exec_cmd(p.daemon("wl-clip-persist --clipboard regular"))

    hl.exec_cmd(p.daemon("udiskie --automount --notify --smart-tray"))
    hl.exec_cmd(p.daemon("solaar --window=hide")) -- Logitech Bolt receiver
end)
