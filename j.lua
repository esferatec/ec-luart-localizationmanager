-- use the json binary module
-- must be in the same folder as this Lua script
-- or in the 'modules' folder of your LuaRT installation path
local json = require "json"

-- Lua array (integer only indexed table)
local array = { 1, 2, 3, "Hello !" }

-- prints the JSON representation of the array value
-- should output [1,2,3,"Hello !"]

print(json.encode(array))