#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local sum		= {}
local factor 	= {}
local bool 		= {}
local num		= 500
local pair		= 0

-- LOGIC
sum.tri 		= 3
count.tri	= 3
count.index	= 0
while (count.index <= num) do
	sum.tri = sum.tri + count.tri
	bool.tri = false
	
	-- FACTORS
	factor 				= {}
	factor[1] 			= true
	factor[sum.tri]	= true
	bool.factor			= false
	count.index			= 2

	count.num = 2	
	while (bool.factor == false) do
		if (sum.tri % count.num == 0) then			
			pair = sum.tri / count.num			

			if (factor[count.num] == true) then 				
				bool.factor = true
			else
				factor[count.num] = true
				count.index = count.index + 1				
			end

			if (factor[pair] == true) then 				
				bool.factor = true
			else				
				factor[pair] = true
				count.index = count.index + 1
			end					
		end			
		count.num = count.num + 1
	end

	count.tri = count.tri + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum.tri

print (answer)
print (dtu_e.."ms")