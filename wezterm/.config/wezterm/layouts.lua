local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

M.sl2 = function(window,pane)
  local current_win = window:mux_window()
  wezterm.log_info(current_win)
  local mux_tab, mux_pane , mux_window = current_win:spawn_tab{
        cwd = '/home/salepakos/Documents/dev/super-league-2/sl2_flask'
  }

  local flask_pane = mux_pane
  local ng_pane = flask_pane:split {
    direction = 'Bottom',
    cwd = '/home/salepakos/Documents/dev/super-league-2/AngularApp',
  }
  wezterm.time.call_after(0.1, function()
    flask_pane:send_text('sl2_flask_setup\r\n')
    ng_pane:send_text('echo 1beer | sudo -S bun run start\r\n')
  end)

  mux_tab:set_title 'logs'
end

M.sl2dev = function(window,pane)
  local mux_tab, mux_pane , mux_window = wezterm.mux.spawn_window{
        workspace= 'sl2',
        domain = 'DefaultDomain',
        cwd = '/home/salepakos/Documents/dev/super-league-2/sl2_flask',
  }

  local flask_pane = mux_pane
  local ng_pane = flask_pane:split {
    cwd = '/home/salepakos/Documents/dev/super-league-2/AngularApp',
  }
  wezterm.time.call_after(0.1, function()
    flask_pane:send_text('sl2_flask_setup\r\n')
    ng_pane:send_text('echo 1beer | sudo -S bun run start\r\n')
  end)

  mux_tab:set_title 'logs'

  local ft, ft_pane, ft_window = mux_window:spawn_tab {
    cwd = '/home/salepakos/Documents/dev/super-league-2/sl2_flask'
  }
  ft:set_title 'flask'

  local nt, nt_pane, nt_window = mux_window:spawn_tab {
    cwd = '/home/salepakos/Documents/dev/super-league-2/AngularApp'
  }
  nt:set_title 'ng'
  window:perform_action(
    act.SwitchToWorkspace({
      name = 'sl2',
    }),
    pane
  )
  flask_pane:activate()
end

return M
