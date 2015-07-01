-- Programmer	:	EOF
-- File			:	hooks.lua
-- Date			:	2015.06.30
-- E-mail		:	jasonleaster@gmail.com

-- Chapter 23 of << Programming in Lua >>

-- Demonstration for "Hooks"



function trace(event, line)
	local s = debug.getinfo(2).short_src
	print(s .. ":" .. line)
end

debug.sethook(trace, "l")

function hello()
	print("hello world")
	return 100
end

hello()