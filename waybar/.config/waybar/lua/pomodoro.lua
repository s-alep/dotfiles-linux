#!/bin/lua

local pmdr_cmd= 'pomodorolm'
local check_pmdr_cmd='pgrep -x ' .. pmdr_cmd

local output = os.execute(check_pmdr_cmd)

if output then
	print(output)
else
	os.execute(pmdr_cmd)
end
