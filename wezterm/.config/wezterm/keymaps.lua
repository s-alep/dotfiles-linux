local wezterm = require("wezterm")
local muxer = require("sessionizer")
local act = wezterm.action

return {
	{ key = "t", mods = "LEADER", action = wezterm.action_callback(muxer.new_tab) },
	{ key = "p", mods = "LEADER", action = wezterm.action_callback(muxer.toggle) },
    { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },},
    { key = 'u', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
    { key = 'i', mods = 'LEADER', action = act.SwitchWorkspaceRelative(-1) },
	{ key = "V", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    {
        key = 'w',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace' },
            },
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:perform_action(
                        act.SwitchToWorkspace {
                            name = line,
                        },
                        pane
                    )
                end
            end),
        },
    },
	{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = false } }) },

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
	{ key = "]", mods = "LEADER", action = act.QuickSelect },
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
	{ key = "n", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "nvim", "/home/salepakos/Documents/notes/" }  }),},
	{ key = ".", mods = "LEADER", action = act.SpawnCommandInNewTab({ args = { "/home/salepakos/.local/bin/config" } }) },
}
