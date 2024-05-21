#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local pow		= {}
local num		= 100
local sum		= 0
local arr		= {}

-- LOGIC
arr[1] 			= 1
count.facto		= 2
while (count.facto <= num) do

	count.arr = 1
	max.arr = #arr
	while (count.arr <= max.arr) do
		arr[count.arr] = arr[count.arr] * count.facto
		count.arr = count.arr + 1
	end

	count.arr = 1
	while (arr[count.arr] ~= nil) do	
		
		pow.hun = math.floor(arr[count.arr] / 100)				
		if (pow.hun >= 1) then 
			if (arr[(count.arr + 1)] == nil) then
				arr[(count.arr + 1)] = 0
			end
			if (arr[(count.arr + 2)] == nil) then				
				arr[(count.arr + 2)] = 0
			end
			arr[(count.arr + 2)] = arr[(count.arr + 2)] + pow.hun
			arr[count.arr] = arr[count.arr] - (pow.hun * 100)
		end			
		
		pow.ten = math.floor(arr[count.arr] / 10) 
		if (pow.ten >= 1) then 
			if (arr[(count.arr + 1)] == nil) then
				arr[(count.arr + 1)] = 0
			end
			arr[(count.arr + 1)] = arr[(count.arr + 1)] + pow.ten
			arr[count.arr] = arr[count.arr] - (pow.ten * 10)
		end			
		count.arr = count.arr + 1
	end

	count.facto = count.facto + 1
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