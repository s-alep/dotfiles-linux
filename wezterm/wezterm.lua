-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Tabs Settings
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.audible_bell = "Disabled"
-- Change Apperance of inactive panes
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.keys = {
	{ key = "`", mods = "CTRL", action = wezterm.action.ActivateCommandPalette },
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("PrimarySelection") },
	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
	{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
	{ key = "6", mods = "CTRL", action = act.ActivateTab(5) },
	{ key = "7", mods = "CTRL", action = act.ActivateTab(6) },
	{ key = "8", mods = "CTRL", action = act.ActivateTab(7) },
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "[", mods = "CTRL", action = act.ActivatePaneDirection("Prev") },
	{ key = "]", mods = "CTRL", action = act.ActivatePaneDirection("Next") },
	{ key = "q", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
}
config.window_background_opacity = 0.95
-- For example, changing the color scheme:
config.color_scheme = "Material Palenight (base16)"
config.default_prog={ "/bin/bash"} 
-- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login" }
-- and finally, return the configuration to wezterm
return config
