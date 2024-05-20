#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local ffi 		= require("ffi")
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local fib		= {}
local count		= 3
local num		= 1000
local sum		= 0
local len		= 1

-- LOGIC
count 		= 3
fib.cur 	= 1
fib.prev 	= 1
while (fib.cur <= math.pow(10,num - 1)) do
	fib.cur 	= fib.cur + fib.prev
	fib.prev	= fib.cur - fib.prev	

	steamid64 = tostring(ffi.new("uint64_t", fib.cur))
	print(count, fib.cur)
	print(count, steamid64)
	
	count = count + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= count - 1

print (answer)
print (dtu_e.."ms")