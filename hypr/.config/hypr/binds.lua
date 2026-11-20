-- Keybinds. Hyprland's default binds (from its example config) are all kept;
-- GNOME's shortcuts are added on keys the defaults leave free.
-- `hyprctl binds` lists everything that's bound.
-- Differences from GNOME: Super+V toggles floating (notifications are Super+N),
-- Super+arrows move focus (move windows with Super+Shift+arrows, maximize with
-- Alt+F10), and Super+1..9 switch workspaces (GNOME opened dock apps).
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local p      = require("programs")
local S      = p.scripts
local mod    = "SUPER"
local exec   = hl.dsp.exec_cmd
local locked = { locked = true }
local locked_repeat = { locked = true, repeating = true }

---------------
---- APPS  ----
---------------

-- Tap Super for the launcher, like GNOME's Activities. Super+A too.
hl.bind(mod .. " + SUPER_L", exec(p.launcher .. " -t"), { release = true })
hl.bind(mod .. " + A", exec(p.launcher .. " -t"))
hl.bind(mod .. " + R", exec(p.launcher .. " -t")) -- Hyprland default

hl.bind(mod .. " + Q", exec(p.app(p.terminal))) -- Hyprland default
hl.bind(mod .. " + Return", exec(p.app(p.terminal)))
hl.bind("CTRL + ALT + T", exec(p.app(p.terminal)))
hl.bind(mod .. " + E", exec(p.app(p.fileManager)))

-- Notification centre with Do Not Disturb.
hl.bind(mod .. " + N", exec("swaync-client -t -sw"))

hl.bind(mod .. " + SHIFT + V", exec(S .. "/clipboard.sh"))
hl.bind(mod .. " + period", exec("rofimoji --selector fuzzel --action type copy --typer wtype --clipboarder wl-copy"))
hl.bind(mod .. " + SHIFT + C", exec("hyprpicker --autocopy --format=hex"))
hl.bind(mod .. " + SHIFT + N", exec(S .. "/nightlight.sh"))

hl.bind(mod .. " + L", exec("loginctl lock-session"))
hl.bind("CTRL + ALT + Delete", exec(S .. "/powermenu.sh"))
-- Hyprland default: log out straight away (apps are closed cleanly first).
hl.bind(mod .. " + M", exec("hyprshutdown"))

-----------------
---- WINDOWS ----
-----------------

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mod .. " + C", hl.dsp.window.close())

hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- Hyprland default

-- Maximize (GNOME Alt+F10; "maximized" keeps the bar and gaps) and fullscreen.
hl.bind("ALT + F10", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Focus between windows (Hyprland default), move windows with Shift,
-- move to the other monitor with Ctrl+Shift.
for _, dir in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mod .. " + " .. dir, hl.dsp.focus({ direction = dir }))
    hl.bind(mod .. " + SHIFT + " .. dir, hl.dsp.window.move({ direction = dir }))
end
hl.bind(mod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ monitor = "r" }))

-- Alt+Tab: next window on this workspace, raised to the top.
local function cycle(next)
    return function()
        hl.dispatch(hl.dsp.window.cycle_next({ next = next }))
        hl.dispatch(hl.dsp.window.bring_to_top())
    end
end
hl.bind("ALT + Tab", cycle(true))
hl.bind("ALT + SHIFT + Tab", cycle(false))

-- Minimize (GNOME Super+H): Hyprland has none, so park the window on a hidden
-- special workspace. Super+Shift+H shows it.
hl.bind(mod .. " + H", hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.workspace.toggle_special("minimized"))

hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"))

-- Super + left / right mouse drag moves / resizes.
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
    local key = i % 10 -- 10 is the 0 key
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- GNOME previous / next workspace. "r" is relative and can create a new one,
-- like GNOME's dynamic workspaces. Shift takes the window along.
hl.bind(mod .. " + Page_Up", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + Page_Down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("CTRL + ALT + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("CTRL + ALT + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mod .. " + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mod .. " + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "r+1" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad.
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

------------------------------------
---- SCREENSHOTS / RECORDING ----
------------------------------------

-- GNOME keys. Saved to ~/Pictures/Screenshots and copied to the clipboard.
hl.bind("Print", exec(S .. "/screenshot.sh area"))
hl.bind("SHIFT + Print", exec(S .. "/screenshot.sh screen"))
hl.bind("ALT + Print", exec(S .. "/screenshot.sh active"))
hl.bind("CTRL + Print", exec(S .. "/screenshot.sh area --edit")) -- annotate in satty
hl.bind("CTRL + ALT + SHIFT + R", exec(S .. "/screenrecord.sh"))

---------------------------------
---- MEDIA KEYS (swayosd OSD) ----
---------------------------------

hl.bind("XF86AudioRaiseVolume", exec("swayosd-client --output-volume raise --max-volume 100"), locked_repeat)
hl.bind("XF86AudioLowerVolume", exec("swayosd-client --output-volume lower"), locked_repeat)
hl.bind("XF86AudioMute", exec("swayosd-client --output-volume mute-toggle"), locked)
hl.bind("XF86AudioMicMute", exec("swayosd-client --input-volume mute-toggle"), locked)
hl.bind("XF86MonBrightnessUp", exec("swayosd-client --brightness raise"), locked_repeat)
hl.bind("XF86MonBrightnessDown", exec("swayosd-client --brightness lower"), locked_repeat)
hl.bind("XF86AudioNext", exec("swayosd-client --playerctl next"), locked)
hl.bind("XF86AudioPrev", exec("swayosd-client --playerctl prev"), locked)
hl.bind("XF86AudioPlay", exec("swayosd-client --playerctl play-pause"), locked)
hl.bind("XF86AudioPause", exec("swayosd-client --playerctl play-pause"), locked)
