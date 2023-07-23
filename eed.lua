local json = require "json"

-- Lua array (integer only indexed table)
local array = { 1, 2, 3, "Hello !" }

-- prints the JSON representation of the array value
-- should output [1,2,3,"Hello !"]

print(json.encode(array))

local m = json.decode("[1,2,3,\"Hello !\"]")

print(m[4])