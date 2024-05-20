#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- DATA
local file = io.open("../data/p0011.data", "rb") 
local json = file:read "*a" 
local data = cjson.decode(json).data
file:close()    

-- VARS
local count		= {}
local prod		= {}
local quad		= {}
local num		= 20
local len		= 4

-- LOGIC
prod.max	= 1
count.i		= 1
while (count.i < num) do
	count.j = 1
	while (count.j < num) do

		-- HORIZONAL
		if (count.j <= num - len + 1) then
			count.p 	= 0
			prod.cur 	= 1
			while(count.p < len) do
				quad[(count.p + 1)] = data[count.i][(count.j + count.p)]
				prod.cur = prod.cur * quad[(count.p + 1)]
				count.p = count.p + 1
			end			
			if (prod.cur > prod.max) then 
				prod.max = prod.cur		
			end	
		end

		-- VERTICAL
		if (count.i <= num - len + 1) then
			count.p 	= 0
			prod.cur 	= 1
			while(count.p < len) do
				quad[(count.p + 1)] = data[(count.i + count.p)][count.j]
				prod.cur = prod.cur * quad[(count.p + 1)]
				count.p = count.p + 1
			end		
			if (prod.cur > prod.max) then 
				prod.max = prod.cur		
			end	
		end
		
		-- DIAGONAL
		if (count.i <= num  - len + 1 and count.j <= num  - len + 1) then
			count.p 	= 0
			prod.cur	= 1			
			while(count.p < len) do
				quad[(count.p + 1)] = data[(count.i + count.p)][(count.j + count.p)]
				prod.cur = prod.cur * quad[(count.p + 1)]
				count.p = count.p + 1
			end			
			if (prod.cur > prod.max) then 
				prod.max = prod.cur		
			end	
		end

		
		-- REVERSE DIAGONAL
		if (count.i >= len and count.j <= num - len + 1) then			
			count.p		= 0
			prod.cur	= 1
			while(count.p < len) do
				quad[(count.p + 1)] = data[(count.i - count.p)][(count.j + count.p)]
				prod.cur = prod.cur * quad[(count.p + 1)]
				count.p = count.p + 1
			end				
			if (prod.cur > prod.max) then 
				prod.max = prod.cur		
			end	
		end		

		count.j = count.j + 1
	end
	count.i = count.i + 1
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= prod.max

print (answer)
print (dtu_e.."ms")