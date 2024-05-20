#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local prime		= {}
local factors	= {}
local count		= {}
local max		= {}
local bool 		= {}
local num		= 600851475143
local remain	= num

-- LOGIC
count.num = 3 -- ignore even
while (remain > 1) do
		
	-- PRIME CHECK
	count.prime	= 1
	max.prime 	= #prime
	bool.prime	= true
	while (count.prime <= max.prime and bool.prime == true) do
		if (count.num % prime[count.prime] == 0) then 
			bool.prime = false
		end
		count.prime = count.prime + 1
	end
	if (bool.prime == true) then
		max.prime = max.prime + 1
		prime[max.prime] = count.num		
		bool.divide = true
	else
		bool.divide = false
	end

	-- DIVIDE
	max.factors	= #factors
	while (bool.divide == true) do
		if (remain % count.num == 0) then					
			remain = remain / count.num
			if (factors[(max.factors + 1)] ~= count.num) then
				factors[(max.factors + 1)] = count.num
				max.factors = max.factors + 1				
			end
		else 
			bool.divide = false
		end
	end

	count.num = count.num + 2 -- ignore even
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= factors[max.factors]

print (answer)
print (dtu_e.."ms")