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
local num		= 2000000
local sum		= 0

-- LOGIC
prime[1]		= 2
sum			= prime[1]
max.prime	= 1
count.num	= 3 -- ignore even
while (prime[max.prime] <= num) do
		
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
		if (prime[max.prime] <= num) then
			sum = sum + prime[max.prime]			
		end
	end

	count.num = count.num + 2 -- ignore even
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")