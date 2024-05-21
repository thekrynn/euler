#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- DATA

-- VARS
local count		= 1

-- LOGIC
count = 100 * 365


-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= nil

print (answer)
print (dtu_e.."ms")