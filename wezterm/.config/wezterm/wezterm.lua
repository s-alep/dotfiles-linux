local wezterm = require("wezterm")
local config = wezterm.config_builder()
local font = wezterm.font
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
-- config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true
config.color_scheme = 'zenwritten_dark'
config.default_prog = {'nu'}
config.default_workspace = "nu"
config.adjust_window_size_when_changing_font_size = false
config.tab_max_width = 20
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.font=font('D2Coding Ligature Nerd Font Mono')
config.font_size = 13
config.enable_wayland = true
config.disable_default_key_bindings = true
config.hide_mouse_cursor_when_typing = true
config.warn_about_missing_glyphs = false
config.window_background_opacity = 1.0
config.inactive_pane_hsb = {saturation = 1.0, brightness = 1.0,}
config.window_padding = {left = "0", right = "0", top = "0", bottom = "0",}
config.colors = {tab_bar = { background = "none" },}
config.window_decorations = "NONE"
config.leader = { key = "s", mods = "CTRL" }
config.keys = require('keymaps')

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local tab_title = function(tab_info)
		local title = tab_info.tab_title
		if title and #title > 0 then
			return title
		end
		return tab_info.active_pane.title
	end

	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Text = " " .. title .. " " },
		}
	else
		return {
			{ Background = { Color = "none" } },
			{ Text = " " .. title .. " " },
		}
	end
end)


wezterm.on('augment-command-palette', function(window, pane)
	return require('command_palette')
end)
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

smart_splits.apply_to_config(config)
return config
