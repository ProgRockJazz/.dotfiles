-- Minimal WezTerm config used only for aerospace fzf pickers.
-- Invoked via: wezterm --config-file ~/.config/wezterm/picker.lua start -- ...
-- Aerospace identifies the popup by the fixed window title "aerospace-picker"
-- (see [[on-window-detected]] in aerospace.toml).

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

config.colors = theme.colors()
config.window_frame = theme.window_frame()
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.initial_cols = 100
config.initial_rows = 20

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

wezterm.on("format-window-title", function()
	return "aerospace-picker"
end)

return config
