-- Outputs, copied from GNOME's ~/.config/monitors.xml.
-- Two ASUS 1920x1080 144 Hz panels side by side on the RTX 3070:
--   DP-1  ASUS VG24VQ1B  left, primary
--   DP-2  ASUS VG249     right
-- If a cable moves to another port the connector name changes (monitors.xml once
-- had the VG24VQ1B on DP-3). Run `hyprctl monitors` and update the names here.
-- An output not listed here still comes up at its preferred mode, placed automatically.
--
-- This file returns the screen names, so other files (rules.lua) can say "left" or
-- "right" instead of repeating connector names.

local M = {
    left  = "DP-1",
    right = "DP-2",
}

hl.monitor({
    output   = M.left,
    mode     = "1920x1080@143.85",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = M.right,
    mode     = "1920x1080@143.86",
    position = "1920x0",
    scale    = 1,
})

-- Each screen starts on its own workspace. Other workspaces open on whichever screen
-- has focus, unless rules.lua's appWorkspaces gives them a monitor.
hl.workspace_rule({ workspace = "1", monitor = M.left, default = true })
hl.workspace_rule({ workspace = "2", monitor = M.right, default = true })

return M
