#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local num		= 1000
local pow		= 0
local sum		= 0

-- LOGIC
pow 			= tostring(math.pow(2,num))
count.pow 	= string.len(pow)
count.sum	= 1

print(split())
print(math.floor(math.pow(2,num) / math.pow(10,301)))
os.exit()

while (count.sum <= count.pow) do	
	sum = sum + string.sub(pow,count.sum,count.sum)
	count.sum = count.sum + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")