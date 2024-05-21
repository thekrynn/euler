#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= {}
local lex		= ""
local digits	= {"0","1","2","3","4","5","6","7","8","9"}
local facto		= 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
local index		= 0
local num		= 1000000

-- LOGIC
count.index		= 1
count.max		= 10
while (#lex < 10) do
	facto 	= facto / count.max
	index	= math.ceil(num / facto)
	num		= num - (facto * (index - 1)) 		

	lex = lex..digits[index]
	table.remove(digits,index)

	count.index 	= count.index + 1	
	count.max 		= count.max - 1		
end

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= lex

print (answer)
print (dtu_e.."ms")