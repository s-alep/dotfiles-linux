local wezterm = require('wezterm')
local lo = require('layouts')
local act = wezterm.action

local on_call = function(window,pane)
  local current_win = window:mux_window()

  local tab, gsport_pane , mux_window = current_win:spawn_tab{
        workspace = 'on_call',
        domain = 'DefaultDomain'
  }

  local sl2_pane = gsport_pane:split {
    direction = 'Right',
    domain = 'DefaultDomain'
  }

  wezterm.time.call_after(0.1, function()
    gsport_pane:send_text('ssh ovh docker logs -f gsport_app\r\n')
    sl2_pane:send_text('ssh ovh docker logs -f sl2_app\r\n')
  end)

  tab:set_title 'on_call'
end

return {
	{
		brief = 'On Call',
		icon = 'md_soccer',
		action = wezterm.action_callback(on_call)
	},
	{
		brief = 'Toggle Dark/Light',
		icon = 'md_lightbulb',
		action = wezterm.action_callback(
		    function(window)
                light_scheme = 'Gruvbox light, hard (base16)'
                dark_scheme = 'Default Dark (base16)'
                local overrides = window:get_config_overrides() or {}
                if (overrides.color_scheme == light_scheme)
                then
                    overrides.color_scheme = dark_scheme
                else
                    overrides.color_scheme = light_scheme
                end
                window:set_config_overrides(overrides)
            end
		)
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

