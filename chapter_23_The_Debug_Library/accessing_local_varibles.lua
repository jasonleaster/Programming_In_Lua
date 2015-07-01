--[[---------------------------------------------------
Programmer	:	EOF
File		:	accessing_local_varibles.lua
Date		:	2015.06.29
E-mail		:	jasonleaster@gmail.com

Chapter 23 of << Programming in Lua >>
Demonstration for "Accessing local varibles"

------------------------------------------------------]]

--[[
At the point where @getlocal is called, @c is already out
of scope, while @name and @value are not yet in the scope
]]

function foo(a, b)
	
	local x
	do local c = a - b end

	--[[
		the other @a which is different from 
	    that parameter of this function]]
	local a = 1 

	while true do
		local name, value = debug.getlocal(1, a)
		if not name then break end
		print(name, value)
		a = a + 1
	end
end

foo(10, 20)


--[[
You could do comparison between that code with this piece of code.

function foo(a, b)
	
	local x
	do local c = a - b end
	local a = 1 

	local name, value -- we define @name and @value before we call @debug.getlocal

	while true do
		name, value = debug.getlocal(1, a)
		if not name then break end
		print(name, value)
		a = a + 1
	end
end

foo(10, 20)
--]]