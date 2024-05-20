#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count 	= 0
local num		= 999 * 999
local pair 		= false

-- LOGIC
while (pair == false) do

	-- PALINDROME
	if (num == tonumber(string.reverse(num))) then
		count = 100
		while (count < 1000 and pair == false) do
			if (num % count == 0) then 
				if (num / count < 1000) then
					pair = true					
				end
			end
			count = count + 1
		end
	end
	num = num - 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= num + 1

print (answer)
print (dtu_e.."ms")