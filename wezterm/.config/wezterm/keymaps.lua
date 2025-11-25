local wezterm = require("wezterm")
local muxer = require("sessionizer")
local act = wezterm.action
local keys = {
	{ key = "p", mods = "LEADER", action = wezterm.action_callback(muxer.just_cd) },
	-- { key = "p", mods = "LEADER|CTRL", action = wezterm.action_callback(muxer.toggle) },
	{ key = "s", mods = "LEADER", action = wezterm.action_callback(muxer.all_sessions) },
	{ key = "V", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = false } }) },

	-- move between panes
	-- { key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
	-- { key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
	-- { key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
	-- { key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },

	-- resize panes
	-- { key = "h", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	-- { key = "j", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	-- { key = "k", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	-- { key = "l", mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },

	--Move tabs
	{ key = "1", mods = "CTRL", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "CTRL", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "CTRL", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "CTRL", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "CTRL", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "CTRL", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "CTRL", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "CTRL", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "CTRL", action = act({ ActivateTab = 8 }) },

	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = ";", mods = "LEADER", action = act.ActivateCommandPalette },
	{ key = ",", mods = "LEADER",
		action = act.PromptInputLine {
			description = 'Enter new name for tab',
			initial_value = '',
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end)
		}
	},
	{ key = "Enter", mods = "CTRL", action = "ToggleFullScreen" },
	{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "LEADER", action = act.ResetFontSize },
	{ key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState,},

	-- spawn commands
	{ key = "g", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "lazygit" } }) },
	{ key = "d", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "lazydocker" } }) },
	{ key = "n", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "nvim" }, set_environment_variables = { NVIM_APPNAME = "obsivim", }, }),},
	{ key = "t", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "tjournal" } }),},
	{ key = ".", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "/home/salepakos/.local/bin/config" } }) },
}
return keys
