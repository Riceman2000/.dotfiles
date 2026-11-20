-- Keyboard and mouse, matching the GNOME settings on ricepc.

hl.config({
    input = {
        kb_layout          = "us",
        numlock_by_default = true, -- GNOME: numlock-state=true

        -- Click to focus; scrolling goes to the window under the pointer (as in GNOME).
        follow_mouse       = 2,

        -- GNOME: accel-profile='flat', speed=0.533 (same libinput scale, -1..1).
        accel_profile      = "flat",
        sensitivity        = 0.53,
    },
})

-- Per-device overrides: names from `hyprctl devices`, e.g.
-- hl.device({ name = "logitech-usb-receiver-mouse", sensitivity = 0.3 })
