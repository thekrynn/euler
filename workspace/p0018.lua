#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- DATA

-- DATA
local file = io.open("../data/p0018.data", "rb") 
local json = file:read "*a" 
local data = cjson.decode(json).data
file:close()    

-- VARS
local count		= {}
local max		= {}
local sum		= 0

-- LOGIC
max.i		= #data
count.i	= 1
while (count.i <= max.i) do
	max.j 	= #data[count.i]
	count.j 	= 1
	max.row 	= 0
	while (count.j <= max.j) do 
		if (max.row < data[count.i][count.j]) then
			max.row = data[count.i][count.j]
		end
		count.j = count.j + 1
	end

	sum 		= sum + max.row
	print(count.i..", "..max.row..", "..sum)
	
	count.i 	= count.i + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= sum

print (answer)
print (dtu_e.."ms")