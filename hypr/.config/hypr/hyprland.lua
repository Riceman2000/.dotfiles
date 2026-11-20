-- Hyprland 0.55 (Lua config) for ricepc, started by GDM through UWSM.
-- Programs come from nix-config (pkgmod.gui.hyprland); this repo only holds config.
-- Session environment variables live in ~/.config/uwsm/env-hyprland (uwsm stow folder).
-- API reference: /run/current-system/sw/share/hypr/stubs/hl.meta.lua
-- Check for errors with: hyprland --verify-config  (or hyprctl configerrors)

require("monitors")
require("look")
require("input")
require("rules")
require("binds")
require("autostart")
