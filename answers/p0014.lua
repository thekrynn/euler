#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local chain		= {}
local longest	= 0
local cur		= 0
local num		= 1000000

-- LOGIC
count.num 	= num - 1
max.num		= 0
max.chain	= 0
while (count.num > 1) do
	cur = count.num
	if (chain[cur] ~= false) then
			
		count.chain = 0
		while (cur > 1) do
			if (cur % 2 == 0) then -- even
				cur = cur / 2
				chain[cur] = false
				count.chain = count.chain + 1			
			else -- odd
				cur = 3 * cur + 1
				chain[cur] = false
				count.chain = count.chain + 1							
			end			
		end
	end
	if (count.chain > max.chain) then
		max.chain = count.chain
		longest = count.num
	end
	count.num = count.num - 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= longest

print (answer)
print (dtu_e.."ms")