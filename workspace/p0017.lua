#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- DATA

local data		= {}

data[1]			= "one"
data[2]			= "two"
data[3]			= "three"
data[4]			= "four"
data[5]			= "five"
data[6]			= "six"
data[7]			= "seven"
data[8]			= "eight"
data[9]			= "nine"
data[10]		= "ten"
data[10]		= "eleven"
data[10]		= "twelve"
data[10]		= "thirteen"
data[10]		= "fourteen"
data[10]		= "fifteen"
data[10]		= "sixteen"
data[10]		= "seventeen"
data[10]		= "eighteen"
data[10]		= "nineteen"
data[20]		= "twenty"
data[30]		= "thirty"
data[40]		= "forty"
data[50]		= "fifty"
data[60]		= "sixty"
data[70]		= "seventy"
data[80]		= "eighty"
data[90]		= "ninety"
data[100]		= "hundred"
data[1000]		= "thousand"


-- VARS
local count		= {}
local num		= 1000
local pow		= 0
local sum		= 0

-- LOGIC
pow 			= tostring(math.pow(2,num))
count.pow 	= string.len(pow)
count.sum	= 1

print(pow)
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