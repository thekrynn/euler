#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local str		= {}
local sum		= {}
local bool		= {}
local count		= 1
local pointer	= 1
local len		= 13
local prod		= 1
local char 		= nil

-- DATA
local file = io.open("../data/p0008.data", "rb") 
local data = file:read "*a" 
file:close()    

-- LOGIC
str.full	= data
str.max		= nil
str.cur		= nil
sum.max		= 0

while (pointer < 1000 - len) do
	str.cur 		= string.sub(str.full, pointer, pointer + len - 1)
	count 		= 1
	sum.cur		= 0
	bool.zero	= false
	while (count <= len and bool.zero == false) do
		char = string.sub(str.cur,count,count)
		if (char == "0") then 
			sum.cur 		= 0
			bool.zero 	= true
		elseif (char ~= "1") then
			sum.cur = sum.cur + string.sub(str.cur,count,count)		
		end
		count = count + 1
	end	
	if (sum.cur > sum.max) then 
		str.max = str.cur
		sum.max = sum.cur		
	end	
	pointer = pointer + 1
end

count = 1
while (count <= len) do
	prod = prod * string.sub(str.max,count,count)	
	count = count + 1
end	

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= prod

print (answer)
print (dtu_e.."ms")