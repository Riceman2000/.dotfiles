-- Outputs, copied from GNOME's ~/.config/monitors.xml.
-- Two ASUS 1920x1080 144 Hz panels side by side on the RTX 3070:
--   DP-1  ASUS VG24VQ1B  left, primary
--   DP-2  ASUS VG249     right
-- If a cable moves to another port the connector name changes (monitors.xml once
-- had the VG24VQ1B on DP-3). Run `hyprctl monitors` and update the names here.
-- An output not listed here still comes up at its preferred mode, placed automatically.

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@143.85",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@143.86",
    position = "1920x0",
    scale    = 1,
})

-- Start on workspace 1 on the primary and 2 on the right-hand screen.
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true })
