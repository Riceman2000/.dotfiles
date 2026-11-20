-- Window and layer rules. Hyprland already floats real dialogs (file pickers,
-- preferences windows), so only add a rule after checking a window's class and
-- title with `hyprctl clients`.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- From the Hyprland example config.
hl.window_rule({
    -- Ignore maximize requests from apps; tiling decides the size.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland.
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Volume and network settings (opened from waybar), and screenshot
-- annotation: small tool windows that shouldn't take half the screen.
hl.window_rule({
    name   = "float-tools",
    match  = { class = "^(com\\.saivert\\.pwvucontrol|nm-connection-editor|com\\.gabm\\.satty)$" },
    float  = true,
    size   = "900 600",
    center = true,
})

-- Don't lock or blank the screen while any window is fullscreen (games, videos).
hl.window_rule({
    name         = "idle-inhibit-fullscreen",
    match        = { class = ".*" },
    idle_inhibit = "fullscreen",
})

-- Blur behind the bar, notifications and fuzzel.
hl.layer_rule({
    name         = "blur-shell",
    match        = { namespace = "^(waybar|swaync-control-center|swaync-notification-window|launcher)$" },
    blur         = true,
    ignore_alpha = 0.5,
})

-- No fade on the screenshot selection and colour picker overlays. grimblast tries
-- to add this itself with `hyprctl keyword`, which a Lua config doesn't accept.
hl.layer_rule({
    name    = "no-anim-selection",
    match   = { namespace = "^(selection|hyprpicker)$" },
    no_anim = true,
})
