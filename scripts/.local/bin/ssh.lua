#!/usr/bin/lua

local selected = ""
if arg[1] then
	selected = arg[1]
else
	selected = io.popen([[rg '^Host\s+(\S+).*' -r '$1' -o -N $HOME/.ssh/config | fzf]]):read("*a")
end

if selected == "" then
	return
end

-- os.execute("tmux new-window -d -n " .. selected .. " ssh " .. selected)
-- os.execute("tmux new-window -n aaa ping google.com")
local tmux_command = string.format("tmux new-window -n \"%s\" 'ssh %s' ; tmux select-window -t \"%s\"", selected, selected, selected)
os.execute(tmux_command)
