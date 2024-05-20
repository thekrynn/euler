#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local fib		= 1
local fib_last	= 1
local sum 		= 0
local max		= 4000000

-- LOGIC
while (fib <= max) do
	if (fib % 2 == 0) then
		sum = sum + fib
	end
	
	fib 		= fib + fib_last
	fib_last	= fib - fib_last
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")