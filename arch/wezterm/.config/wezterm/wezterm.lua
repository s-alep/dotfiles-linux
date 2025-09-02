local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.audible_bell = "Disabled"
config.font_size = 13
config.enable_wayland = false

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

config.warn_about_missing_glyphs = false
config.leader = { key = "q", mods = "CTRL" }
config.disable_default_key_bindings = true
config.hide_mouse_cursor_when_typing = true
config.keys = {
	{ key = "V", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "H", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "CTRL", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "CTRL", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "CTRL", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "CTRL", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "CTRL", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "CTRL", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "CTRL", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "CTRL", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "CTRL", action = act({ ActivateTab = 8 }) },
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = false } }) },
	{ key = ";", mods = "LEADER", action = act.ActivateCommandPalette },

	{ key = "F12", action = "ToggleFullScreen" },
	{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "LEADER", action = act.ResetFontSize },
}
config.window_background_opacity = 1
config.color_scheme = "niji"
config.window_decorations = "RESIZE"

return config
