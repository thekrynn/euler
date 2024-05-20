#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local factors	= {}
local count 	= {}
local max		= {}
local remain	= 0
local prod		= 1

-- LOGIC
count.num	= 2
max.num 		= 20
while (count.num < max.num) do
	
	max.factors 	= #factors
	count.factors	= 1	
	remain 			= count.num
	while (count.factors <=max.factors and remain > 1) do
		if (remain % factors[count.factors] == 0) then
			remain = remain / factors[count.factors]
		end
		count.factors = count.factors + 1		
	end
	if (remain > 1) then
		factors[count.factors] = remain
		prod = prod * remain
	end

	count.num = count.num + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= prod

print (answer)
print (dtu_e.."ms")