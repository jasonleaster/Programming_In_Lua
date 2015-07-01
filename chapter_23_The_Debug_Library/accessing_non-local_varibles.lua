--[[---------------------------------------------------
Programmer	:	EOF
File		:	accessing_non-local_varibles.lua
Date		:	2015.06.29
E-mail		:	jasonleaster@gmail.com

Chapter 23 of << Programming in Lua >>
Demonstration for "Accessing non-local varibles"

------------------------------------------------------]]

-- API:
-- 	@getfenv([f])
--
-- 	return the current environment in use by the function. 
-- 	@f can be a Lua function or a number that specifies the 
-- 	funcition at that stack level: Level 1 is the fucntion calling getfenv.
-- 	If the given function is not a Lua function, or if f is 0,
-- 	getfenv returns the global environment. The default for f is 1.

-- @debug.getlocal([thread,], level, local)
--
-- This function returns the same and the value of the local varibles 
-- with index local of the function at level of the stack.(The first 
-- parameter or local varible has index 1, and so on, until the last 
-- active varible). The function returns nil if there is no 
-- local variable with the given index, and raises an error when called
-- with a level out of range(You can call debug.info to check whether the
-- level is valid)


-- When we try to find out a local varible, the second parameter of this 
-- function must be 1 but can not be 0!
function getvarvalue(name, level)
	local value
	local found = false

	-- or operation always return the first operand
	level = (level or 1) + 1

	-- try local variables
	for i = 1, math.huge do

		local n, v = debug.getlocal(level, i)
		if not n then break end
		if n == name then
			value = v
			found = true
		end
	end

	if found then return value end

	-- try non-local varibles
	local func = debug.getinfo(level, "f").func

	for i = 1 , math.huge do
		local n, v = debug.getupvalue(func, i)
		if not n then break end
		if n == name then return v end
	end

	-- not found; get value from the environment
	-- print("getfenv return value :", getfenv(func) , "_G", _G, name)
	return getfenv(func)[name]
end


hello = 100
local world = 200

-- ATTENTION! when we call @getvarvalue, 
-- the first parameter must be a string :)

print(getvarvalue("hello", 0))

-- ERROR!	print(getvarvalue("world", 0))
			print(getvarvalue("world", 1))
