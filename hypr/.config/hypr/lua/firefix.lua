#!/usr/bin/lua

local workspace = arg[1]
os.execute("hyprctl dispatch workspace " .. workspace)

local output = io.popen("hyprctl monitors | rg special:firefox"):read("*a")
if output ~= "" then
	os.execute("hyprctl dispatch togglespecialworkspace firefox")
end
