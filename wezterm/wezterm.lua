local wezterm = require("wezterm")
local config = wezterm.config_builder()
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

config.window_decorations = "RESIZE"

config.colors = theme.colors()
config.window_frame = theme.window_frame()

config.hide_tab_bar_if_only_one_tab = true
--config.font = wezterm.font("Fira Code")

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")

return config
