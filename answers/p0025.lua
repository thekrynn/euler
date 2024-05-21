#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local max		= {}
local fib		= {}
local num		= 1000

-- LOGIC
fib.prv		= {"1"}
fib.cur		= {"2"}
fib.new		= {"2"}
count.fig	= 3

while (#fib.cur < num) do
	count.fib = 1
	while (fib.cur[count.fib] ~= nil) do
		if (fib.prv[count.fib] == nil) then
			fib.prv[count.fib] = 0
		end
		fib.new[count.fib] = fib.prv[count.fib] + fib.cur[count.fib]
		count.fib = count.fib + 1
	end

	count.fib = 1
	while (fib.new[count.fib] ~= nil) do	
		if (fib.new[count.fib] >= 10) then 
			if (fib.new[(count.fib + 1)] == nil) then
				fib.new[(count.fib + 1)] = 0
			end
			fib.new[(count.fib + 1)] = fib.new[(count.fib + 1)] + 1
			fib.new[count.fib] = fib.new[count.fib] - 10
		end			
		
		fib.prv[count.fib] = fib.cur[count.fib]
		fib.cur[count.fib] = fib.new[count.fib]
		
		count.fib = count.fib + 1		
	end	
	
	count.fig = count.fig + 1	
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= count.fig

print (answer)
print (dtu_e.."ms")