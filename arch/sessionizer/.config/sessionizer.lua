#!/usr/bin/lua

local selected = ""
if arg[1] then
	selected = arg[1]
else
	selected = io.popen("find /home/salepakos/Documents/dev -mindepth 1 -maxdepth 2 -type d | fzf"):read("*a")
end

if selected == "" then
	return
end
selected = string.gsub(selected, "\n", "")

local tmux_running = io.popen("pgrep tmux"):read("*a")
local running = tmux_running ~= ""

local selected_name = io.popen("basename " .. selected .. " | tr . _"):read("*a")
local tmux = os.getenv("TMUX")
selected_name = string.gsub(selected_name, "\n", "")

if not tmux and not running then
	os.execute("tmux new-session -s " .. selected_name .. " -c " .. selected)
	return
end

local has_session = os.execute("tmux has-session -t=" .. selected_name .. "2> /dev/null")
if not has_session then
	os.execute("tmux new-session -ds " .. selected_name .. " -c " .. selected)
end

if not tmux then
	os.execute("tmux attach -t " .. selected_name)
else
	os.execute("tmux switch-client -t " .. selected_name)
end
