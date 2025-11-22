local wezterm = require('wezterm')
local lo = require('layouts')
local act = wezterm.action

return {
	{
		brief = 'Sl2dev',
		icon = 'md_soccer',
		action = wezterm.action_callback(lo.sl2dev)
	},
	{
		brief = 'Super League 2',
		icon = 'md_soccer',
		action = wezterm.action_callback(lo.sl2)
	},
	{
		brief = 'Open Git Repo in Brave',
		icon = 'md_git',
		action = act.SplitPane{
			direction = 'Right',
			command = {args ={'/home/salepakos/.local/bin/get_git_url.py'}},
		}
	},
	{
		brief = 'Rename tab',
		icon = 'md_rename_box',

		action = act.PromptInputLine {
			description = 'Enter new name for tab',
			initial_value = 'My Tab Name',
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
}

