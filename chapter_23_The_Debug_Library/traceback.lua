--[[---------------------------------------------------
Programmer	:	EOF
File		:	traceback.lua
Date		:	2015.06.29
E-mail		:	jasonleaster@gmail.com

------------------------------------------------------]]

--[[

	The main introspective function in the debug library is the 
@debug.getinfo function. Its first parameter may be a function
or a stack level.


		Parameter of function @debug.getinfo

'n'	:	selects @name and @namewhat
'f'	:	selects @func
'S'	:	selects @source, @short_src, @what, @linedefined, and @lastlinedefined
'l'	:	selects @currentline
'L'	:	selects @activelines
'u'	:	selects @nup
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
end

hello()

traceback()