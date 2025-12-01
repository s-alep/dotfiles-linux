local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

local fd = "/usr/bin/fd"
local rootPath = "/home/salepakos/Documents/dev/"
local homePath = "/home/salepakos"


M.new_tab = function(window,pane)
  local projects = {}

  local success, stdout, stderr = wezterm.run_child_process({
    fd,
    "-td",
    ".",
    homePath,
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
      action = wezterm.action_callback(function(win,pane, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          win:perform_action(
            act.SpawnCommandInNewTab({ label = id,  cwd = label }),
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
M.just_cd = function(window,pane)
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
      action = wezterm.action_callback(function(win,pane, id, label)
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.time.call_after(0.1, function()
            pane:send_text('cd ' .. label .. '\r')
          end)
          -- win:perform_action(
          --   act.SpawnCommandInNewTab({ label = id,  cwd = label }),
          --   pane
          -- )
        end
      end),
      fuzzy = true,
      title = "Select project",
      choices = projects,
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


