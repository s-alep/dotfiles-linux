local wezterm = require("wezterm")
local config = wezterm.config_builder()
local font = wezterm.font

local toggle_terminal = wezterm.plugin.require("https://github.com/zsh-sage/toggle_terminal.wez")

config.use_fancy_tab_bar = false
config.default_prog = { 'nu'}
config.tab_max_width = 20
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.font=font('JetBrainsMono Nerd Font Mono')
config.font_size = 13
config.enable_wayland = true
config.disable_default_key_bindings = true
config.hide_mouse_cursor_when_typing = true
config.warn_about_missing_glyphs = false
config.window_background_opacity = 1.0
config.color_scheme = 'zenwritten_dark'
config.color_scheme = 'Ef-Autumn'
config.inactive_pane_hsb = {saturation = 1.0, brightness = 1.0,}
config.window_padding = {left = "0", right = "0", top = "0", bottom = "0",}
config.colors = {tab_bar = { background = "none" },}

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

toggle_terminal.apply_to_config(config, {
	key = ";", -- Key for the toggle action
	mods = "LEADER", -- Modifier keys for the toggle action
	direction = "Down", -- Direction to split the pane
	size = { Percent = 40 }, -- Size of the split pane
	change_invoker_id_everytime = false, -- Change invoker pane on every toggle
	zoom = {
		auto_zoom_toggle_terminal = false, -- Automatically zoom toggle terminal pane
		auto_zoom_invoker_pane = true, -- Automatically zoom invoker pane
		remember_zoomed = true, -- Automatically re-zoom the toggle pane if it was zoomed before switching away
	}
})
return config
