#!/usr/bin/lua

local a = arg[1]
local mode = tonumber(a)

local function dunst(message)
	os.execute('dunstify -u low "' .. message .. '"')
end

local command = "echo 1beer | sudo -S systemctl is-active --quiet 'bluetooth'"
local output = os.execute(command)
if mode == 1 then
	--bluetooth open
	if output then
		dunst("Bluetooth is already running.")
		os.execute("/usr/bin/bluetui")
	else
		local success = os.execute("sudo systemctl start bluetooth")
		if success then
			dunst("Bluetooth started successfully.")
			os.execute("/usr/bin/bluetui")
		else
			dunst("Bluetooth failed to start.")
		end
	end
elseif mode == 0 then
	-- bluetooth close
	if output then
		os.execute("echo 1beer | sudo -S systemctl stop bluetooth")
		dunst("Bluetooth stopped")
	end
end
