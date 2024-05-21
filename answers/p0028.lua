#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local num 		= 1001
local sum		= 1

-- LOGIC
count.num 	= 1
count.size 	= 1
while (count.size < num) do	

	count.spiral = 1
	while (count.spiral <= 4) do				
		count.num 		= count.num + (count.size + 1)
		
		sum 			= sum + count.num
		count.spiral 	= count.spiral + 1		
	end

	count.size 	= count.size + 2
end


-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")