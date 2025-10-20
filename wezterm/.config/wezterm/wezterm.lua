local wezterm = require("wezterm")
local muxer = require('sessionizer')
local config = wezterm.config_builder()
local act = wezterm.action

config.use_fancy_tab_bar = false
config.tab_max_width = 20
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.font_size = 12
config.enable_wayland = false
config.disable_default_key_bindings = true
config.hide_mouse_cursor_when_typing = true
config.warn_about_missing_glyphs = false
config.window_background_opacity = 0.9
config.color_scheme = "niji"
config.window_decorations = "RESIZE"

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

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
	{ Text = ' ' .. title .. ' ' },
      }
    else 
      return {
	{Background = {Color='none'}},
	{ Text = ' ' .. title .. ' ' },
      }
    end
  end
)

config.colors = {
	tab_bar = { background = 'none'}
}
config.leader = { key = "q", mods = "CTRL" }
config.keys = {
	{ key = "p",     mods = "LEADER",     action = wezterm.action_callback(muxer.toggle) },
	{ key = "o",     mods = "LEADER",     action = wezterm.action_callback(muxer.switch_2_last) },
	{ key = "s",     mods = "LEADER",     action = wezterm.action_callback(muxer.all_sessions) },
	{ key = "V",     mods = "LEADER",     action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v",     mods = "LEADER",     action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	{ key = "c",     mods = "LEADER",     action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "x",     mods = "LEADER",     action = act({ CloseCurrentPane = { confirm = false } }) },

	--move between panes
	{ key = "h",     mods = "LEADER",     action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "j",     mods = "LEADER",     action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "k",     mods = "LEADER",     action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "l",     mods = "LEADER",     action = act({ ActivatePaneDirection = "Right" }) },

	--resize panes
	{ key = "h",     mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "j",     mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "k",     mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "l",     mods = "CTRL|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },

	--Move tabs
	{ key = "1",     mods = "CTRL",       action = act({ ActivateTab = 0 }) },
	{ key = "2",     mods = "CTRL",       action = act({ ActivateTab = 1 }) },
	{ key = "3",     mods = "CTRL",       action = act({ ActivateTab = 2 }) },
	{ key = "4",     mods = "CTRL",       action = act({ ActivateTab = 3 }) },
	{ key = "5",     mods = "CTRL",       action = act({ ActivateTab = 4 }) },
	{ key = "6",     mods = "CTRL",       action = act({ ActivateTab = 5 }) },
	{ key = "7",     mods = "CTRL",       action = act({ ActivateTab = 6 }) },
	{ key = "8",     mods = "CTRL",       action = act({ ActivateTab = 7 }) },
	{ key = "9",     mods = "CTRL",       action = act({ ActivateTab = 8 }) },


	{ key = "[",     mods = "LEADER",     action = act.ActivateCopyMode },
	{ key = ";",     mods = "LEADER",     action = act.ActivateCommandPalette },
	{ key = "Enter", mods = "CTRL",       action = "ToggleFullScreen" },
	{ key = "c",     mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "v",     mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "=",     mods = "CTRL",       action = act.IncreaseFontSize },
	{ key = "-",     mods = "CTRL",       action = act.DecreaseFontSize },
	{ key = "0",     mods = "LEADER",     action = act.ResetFontSize },

	-- spawn commands
	{ key = 'g',     mods = 'LEADER',     action = act.SpawnCommandInNewTab { args = { 'lazygit' }, }, },
	{ key = 'd',     mods = 'LEADER',     action = act.SpawnCommandInNewTab { args = { 'lazydocker' }, }, },
}

return config
