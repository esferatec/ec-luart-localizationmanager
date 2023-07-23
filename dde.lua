local json = require "json"

-- Lua array (integer only indexed table)
local array = { name = "Name", save = "Speichern" }

-- prints the JSON representation of the array value
-- should output [1,2,3,"Hello !"]

print(json.encode(array))