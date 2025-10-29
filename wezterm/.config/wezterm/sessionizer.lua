local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

local fd = "/usr/bin/fd"
local rootPath = "/home/salepakos/Documents/dev/"
local last_session_id = ""

M.switch_2_last = function(window,pane)
  if not last_session_id then
    wezterm.log_info("No Last Session")
    return
  end
  local placeholder = wezterm.mux.get_active_workspace()
  window:perform_action(
    act.SwitchToWorkspace({ name = last_session_id }),
    pane
  )
  last_session_id = placeholder
end

M.all_sessions = function(window, pane)
  local all_windows = wezterm.mux.all_windows()
  local windows = {}
  for _, win in ipairs(all_windows) do
    table.insert(windows, {id = win:get_workspace{}, label = win:get_workspace{}})
  end

  wezterm.log_info(windows)

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          last_session_id = wezterm.mux.get_active_workspace()
          wezterm.log_info("Selected " .. label)
          win:perform_action(
            act.SwitchToWorkspace({ name = id}),
            pane
          )
        end
      end),
      fuzzy = true,
      title = "Select workspace",
      choices = windows,
    }),
    pane
  )
end
M.toggle = function(window, pane)
  local projects = {}

  local success, stdout, stderr = wezterm.run_child_process({
    fd,
    "-td",
    "--max-depth=2",
    ".",
    rootPath,
  })
  if not success then
    wezterm.log_error("Failed to run fd: " .. stderr)
    return
  end

  for line in stdout:gmatch("([^\n]*)\n?") do
    local project = line:gsub("/$", "")
    local label = project
    local id = project:gsub(".*/", "")
    table.insert(projects, { label = tostring(label), id = tostring(id) })
  end

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          last_session_id = wezterm.mux.get_active_workspace()
          wezterm.log_info(last_session_id)
          wezterm.log_info("Selected " .. label)
          win:perform_action(
            act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }),
            pane
          )
        end
      end),
      fuzzy = true,
      title = "Select project",
      choices = projects,
    }),
    pane
  )
end

return M


