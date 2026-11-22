-- Layout, decoration and animation speed.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        -- gaps_in is added on each side, so 1 gives 2 px between windows.
        gaps_in          = 1,
        gaps_out         = 2,
        border_size      = 2,

        col              = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Drag window edges to resize them, like GNOME.
        resize_on_border = true,

        layout           = "dwindle",
    },

    decoration = {
        rounding = 10,

        shadow   = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur     = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    -- Window group tab titles.
    group = {
        groupbar = {
            font_family = "Paper Mono",
        },
    },

    misc = {
        -- Hyprland's own text (config error bar, notifications).
        font_family             = "Paper Mono",

        -- hyprpaper draws the wallpaper, so hide Hyprland's own.
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,

        -- Let apps raise themselves when asked (clicking a link focuses the
        -- browser), as on GNOME.
        focus_on_activate       = true,
    },
})

-- Hyprland's built-in animations, 5x faster. Speed is in tenths of a second and
-- every animation inherits "global" (default 8 = 0.8 s), so 1.6 = 0.16 s.
-- Raise it to slow them down; `enabled = false` turns them all off.
hl.animation({ leaf = "global", enabled = true, speed = 1.6, bezier = "default" })
