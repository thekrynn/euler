#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local bool		= {}
local num		= 1000
local dec		= 0

-- LOGIC
count.num 	= 1
while (count.num < num) do
	bool.rep	= true
	max.iter	= 5
	count.iter 	= 1
	while (count.iter <= max.iter and bool.rep == true) do
		dec = (math.pow(10,count.iter) / count.num) - 1 / count.num
		if (string.len(dec) >= 15) then
			if (count.iter == max.iter) then
				print ("1 / "..count.num.. " | "..dec)
			end
		else 
			bool.rep = false
		end

		count.iter = count.iter + 1		
	end
	count.num = count.num + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= nil

print (answer)
print (dtu_e.."ms")