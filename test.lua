local ui = require("ui")
local json = require("json")
local lm = require("ecluart.jsonlocalization")
local tml = require("ecluart.tablelocalization")

-- create a simple Window

local jlm = lm.JsonLocalization("de.json")
--local jlm2 = tml.TableLocalization("de.lua")

local win = ui.Window("Label.constructor() sample", 320, 200)

-- create a Label on this window, with "LuaRT" as text, at the x position 130, and y position 80
local label = ui.Label(win, "LuaRT", 130, 80)

jlm:add(label, "save")
 jlm:translate()
--jlm2:add(label, "name")
--jlm2:translate()

local button = ui.Button(win, "LuaRT", 130, 150)



function button:onClick()
 jlm:translate()
end

win:show()


-- update the user interface until the user closes the Window
repeat
	ui.update()
until not win.visible