#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= 1
local max		= 100
local sum		= 0
local sumsq		= 0
local sqsum		= 0

-- LOGIC
while (count <= max) do
	sum = sum + count
	sumsq = sumsq + (count * count) 
	count = count + 1
end
sqsum = sum * sum 

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sqsum - sumsq

print (answer)
print (dtu_e.."ms")