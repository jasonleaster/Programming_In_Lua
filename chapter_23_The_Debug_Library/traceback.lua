--[[---------------------------------------------------
Programmer	:	EOF
File		:	traceback.lua
Date		:	2015.06.29
E-mail		:	jasonleaster@gmail.com

Chapter 23 of << Programming in Lua >>
Demonstration for "Introsoective Facilities"

------------------------------------------------------]]

--[[

	The main introspective function in the debug library is the 
@debug.getinfo function. Its first parameter may be a function
or a stack level.


		Parameter of function @debug.getinfo

'n'	:	selects @name 		(a reasonable name for the function)
				@namewhat	(what the previous field means. "global", "local", "method", "field", or "")

'f'	:	selects @func  		(the function itself)

'S'	:	selects @source		(where the function was defined. A file or a string ?),
				@short_src	(a short version of source), 
				@what		(what this function is. "Lua", "C" or "main"),
				@linedefined(the first line of the source where the function was defined),
				@lastlinedefined (the last line of the source where the function was defined)

'l'	:	selects @currentline

'L'	:	selects @activelines(a table representing the set of active lines of the function)

'u'	:	selects @nup 		(number of upvalues of that function)
--]]

function traceback()
	for level = 1, math.huge do

		local info = debug.getinfo(level, "Sl")

		if not info then break end

		if info.what == "C" then 
			print(level, "C Function")
		else -- a lua function
			print(string.format("[%s]: %d", info.short_src, info.currentline))
		end
	end
end

----------- Code below there used for testing ----------------
function hello()
	print("hello world")
	traceback()
end

hello()