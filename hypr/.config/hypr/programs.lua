-- Program names shared by binds.lua and autostart.lua.
-- The session runs under UWSM, so apps are started with `uwsm app` and each gets
-- its own systemd unit instead of piling into Hyprland's.

local M = {}

-- An app the user opens (terminal, file manager, ...).
function M.app(cmd)
    return "uwsm app -- " .. cmd
end

-- A long-running helper (bar, daemons).
function M.daemon(cmd)
    return "uwsm app -s b -- " .. cmd
end

M.terminal = "ghostty"
M.fileManager = "nautilus --new-window"
M.launcher = "hyprlauncher"
M.scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

return M
