#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- DATA
local file = io.open("../data/p0013.data", "rb") 
local json = file:read "*a" 
local data = cjson.decode(json).data
file:close()    

-- VARS
local count		= 1
local num		= 100
local sum		= 0
local limit		= math.pow(10,10)

while (count <= num) do
	sum = sum + data[count]	
	count = count + 1
end

while (sum > limit) do
	sum = sum / 10
end

-- LOGIC

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= math.floor(sum)

print (answer)
print (dtu_e.."ms")