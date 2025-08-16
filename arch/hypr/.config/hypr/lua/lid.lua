#!/usr/bin/lua
local mode = tonumber(arg[1])

local command = "hyprctl monitors all | rg Monitor | wc -l"
local output = io.popen(command):read("*a")
local monitor_count = tonumber(output)
print(monitor_count)

if mode == 0 then
	-- Close lid
	if monitor_count > 1 then
		os.execute('hyprctl keyword monitor "eDP-1, disable"')
	end
	if monitor_count == 1 then
		os.execute(" systemctl suspend && hyprlock")
	end
elseif mode == 1 then
	-- Open the lid
	if monitor_count > 1 then
		os.execute('hyprctl keyword monitor "eDP-1, enable"')
		os.execute('hyprctl keyword monitor "eDP-1, 1680x1050"')
	end

	command = "hyprctl monitors | rg Monitor | wc -l"
	local monitor_on = io.popen(command):read("*a")
	if tonumber(monitor_on) == 0 then
		os.execute('hyprctl keyword monitor "eDP-1, enable"')
		os.execute('hyprctl keyword monitor "eDP-1, 1680x1050"')
	end
end
