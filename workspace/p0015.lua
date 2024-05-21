#!/opt/luajit/bin/luajit

-- SOCKET + TIME
local cjson 	= require ("cjson")
local socket 	= require ("socket")
local dtu_s		= socket.gettime() * 1000

-- VARS
local count		= 1

-- LOGIC

-- ANSWER + TIME
local dtu_e 	= math.floor( ((socket.gettime() * 1000) - dtu_s) * 1000) / 1000
local answer	= nil

print (answer)
print (dtu_e.."ms")

1x1
r(1) 	2(1) = 2

2x2		2(1 + 2) = 6
r2 (1)		
r1 (1x1: 2)		

3x3		2(1 + 3 + 6) = 20
r3 (1)
r2 (3)
r1 (2x2: 6 = [3x3]r2(3) + 2 + 1)

4x4		2(1 + 4 + 10 + 20) = 70
r4 (1)
r3 (4)
r2 (10 = [4x4]r3(4) + 3 + 2 + 1)
r1 (3x3: 20)

5x5
r5 (1)
r4 (5)
r3 (15 = [5x5]r4(5) + [4x4]r3(4) + [3x3]r2(3) + [2x2]r1(2) + 1)
r2 (35 = [5x5]r3(15) + [4x4]r2(10) + [3x3]r1(6) + [2x2]r0(3) + 1)
r1 (4x4: 70)

6x6
r6 (1)
r5 (6)
r4 (15 = [6x6]r5(6) + [5x5]r4(4) + [4x4]r3(4) + [3x3]r2(3) + [2x2]r1(2) + 1)
r3 (35 = [6x6]r4(15) + [5x5]r3(4) + [4x4]r2(10) + [3x3]r1(6) + [2x2]r0(3) + 1)
r2 (35 = [6x6]r3(15) + [5x5]r2(4) + [4x4]r1(10) + [3x3]r0(6) + 1)
r1 (5x5: )