-- Programmer	:	EOF
-- File			:	profile.lua
-- Date			:	2015.07.01
-- E-mail		:	jasonleaster@gmail.com

-- Chapter 23 of << Programming in Lua >>

-- Demonstration for "Profile"

local Counters = {}
local Names = {}

local function hook()
	f = debug.getinfo(2, "f").func

	if Counters[f] = nil then  -- first time 'f' is called ?
		Counters[f] = 1
		Names[f] = debug.getinfo(2, "Sn")
	else -- only increment the counter
		Counters[f] = Counters[f] + 1
	end
end


local f = assert(localfile(arg[1]))
debug.sethook(hook, "c") -- turn on the hook for calls
f()	-- run the main program
debug.sethook() -- turn off the hook


function getname(func)
	local n = Names[func]
	if n.what == "C" then
		return n.name
	end

	local lc = string.format("[%s]:%s", n.short_src, n.linedefined)

	if n.namewhat ~= "" then
		return string.format("%s (%s)", lc, n.name)
	else
		return lc
	end
end

for func, count in paris(Counters) do
	print(getname(func), count)
end

