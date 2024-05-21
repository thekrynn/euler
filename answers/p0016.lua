#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local num		= 1000
local sum		= 0
local arr		= {}

-- LOGIC
arr[1] 			= 1
count.pow		= 1
while (count.pow <= num) do

	count.arr = 1
	max.arr = #arr
	while (count.arr <= max.arr) do
		arr[count.arr] = arr[count.arr] * 2		
		count.arr = count.arr + 1
	end

	count.arr = 1
	max[arr] = #arr
	while (count.arr <= max.arr) do
		if (arr[count.arr] >= 10) then 
			if (arr[(count.arr + 1)] == nil) then
				arr[(count.arr + 1)] = 0
			end
			arr[(count.arr + 1)] = arr[(count.arr + 1)] + 1
			arr[count.arr] = arr[count.arr] - 10
		end
		count.arr = count.arr + 1
	end

	count.pow = count.pow + 1
end

count.arr = 1
max.arr = #arr
while (count.arr <= max.arr) do
	sum = sum + arr[count.arr]
	count.arr = count.arr + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")