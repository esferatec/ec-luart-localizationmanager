local ui = require "ui"

-- create a simple Window
local win = ui.Window("Groupbox.text sample", 320, 300)

-- add a Groupbox...
local groupbox = ui.Groupbox(win, "LuaRT", 50, 50)

-- ...and a Labeled Entry
local label = ui.Label(win, "Enter a new Groupbox.text : ", 32)
ui.Entry(win, groupbox.text, label.x + label.width + 6, 12).onSelect = function (self)
	groupbox.text = self.text
end

win:show()

-- update the user interface until the user closes the Window
repeat
	ui.update()
until not win.visible