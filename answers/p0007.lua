#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local prime		= {}
local count		= {}
local max		= {}
local bool		= {}
local num		= 10001

-- LOGIC
prime[1]		= 2
count.num	= 3 -- ignore even
max.prime	= 1
while (max.prime <= num) do
		
	-- PRIMES
	count.prime	= 1
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
	end

	count.num = count.num + 2 -- ignore even
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= prime[num]

print (answer)
print (dtu_e.."ms")