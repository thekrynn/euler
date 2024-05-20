#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local triplet	= {}
local square	= {}
local sqrt		= {}
local bool		= false
local count		= 2
local dist		= 1
local sum		= 0
local prod 		= 1
local num		= 1000

-- LOGIC
while (bool == false) do
	count = 2
	while (count < (num / 2) and bool == false) do

		-- s, s+d, x
		square.add	= math.pow((count + dist),2) + math.pow((count),2)
		sqrt.add		= math.pow(square.add,0.5)
		if (sqrt.add == math.floor(sqrt.add)) then
			if ((2 * count) + dist + sqrt.add == num) then
				prod = count * (count + dist) * sqrt.add				
				bool = true				
			end
		end
		
		count = count + 1
	end
	dist = dist + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= prod

print (answer)
print (dtu_e.."ms")
