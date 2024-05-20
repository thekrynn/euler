#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count 	= 1
local sum 		= 0
local mult		= 0
local max		= 1000
local max_3		= math.floor(max / 3)
local max_5		= (max / 5) - 1

-- LOGIC
while (count <= max_3) do
	mult 	= 3 * count
	sum 	= sum + mult
	count = count + 1
end

count = 1

while (count <= max_5) do
	mult	= 5 * count
	if (mult % 3 ~= 0) then 
		sum = sum + (5 * count)
	end
	count = count + 1
end

-- ANSWER + TIME
local dtu_e		= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")