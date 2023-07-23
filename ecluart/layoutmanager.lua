-- !! this module ist under construction !! --

-- Represents the base module for all layout managers.
local layoutmanager = {}

-- Defines specific error massages.
layoutmanager.ERRORMESSAGE = {}
layoutmanager.ERRORMESSAGE.notvalidparent = "Not valid parent widget."
layoutmanager.ERRORMESSAGE.notvalidchild = "Not valid child widget."
layoutmanager.ERRORMESSAGE.notnumberornil = "Parameter type must be number or nil: "
layoutmanager.ERRORMESSAGE.nottableornil = "Parameter type must be table or nil: "

-- Checks if the parent widget is valid.
-- isvalidparent(name: string) -> boolean
function layoutmanager.isvalidparent(name)
  name = tostring(name)

  -- w = widgets
  local w = { "Window", "Groupbox", "TabItem" }

  -- v = value
  for _, v in pairs(w) do
    if string.find(name, v) ~= nil then return true end
  end

  return false
end

-- Checks if the child widget is valid.
-- isvalidchild(name: string) -> boolean
function layoutmanager.isvalidchild(name)
  name = tostring(name)

  -- w = widget
  local w = { "Button", "Calendar", "Checkbox", "Edit", "Entry", "Groupbox", "Label", "List", "Radiobutton" } -- other widgets must be added

  -- v = value
  for _, v in pairs(w) do
    if string.find(name, v) ~= nil then return true end
  end

  return false
end

-- Checks if the funtion paramter is valid.
-- isnumberornil(name: any) -> boolean
function layoutmanager.isnumberornil(name)
  return type(name) == "number" or type(name) == "nil"
end

-- Checks if the funtion paramter is valid.
-- istableornil(name: any) -> boolean
function layoutmanager.istableornil(name)
  return type(name) == "table" or type(name) == "nil"
end

-- Defines the base layout prototype.
local BaseLayout = {
  children = {},
  parent = 0,
  parentwidth = 0,
  parentheight = 0
}
BaseLayout.__index = BaseLayout

-- Positions all child widgets.
-- apply() -> none
function BaseLayout:apply()
  -- c = child
  for _, c in pairs(self.children) do
    c.widget.x = c.positionx
    c.widget.y = c.positiony
    c.widget.width = c.width
    c.widget.height = c.height
  end
end

-- Hides all child widgets.
-- hide() -> none
function BaseLayout:hide()
  -- c = child
  for _, c in pairs(self.children) do
    c.widget.visible = false
  end
end

-- Shows all child widgets.
-- show() -> none
function BaseLayout:show()
  -- c = child
  for _, c in pairs(self.children) do
    c.widget.visible = true
  end
end

-- Changes a property for all child widgets.
-- change(key: string, value: any) -> none
function BaseLayout:change(key, value)
  -- validates parameter types
  if type(key) ~= "string" then
    return
  end

  -- c = child
  for _, c in pairs(self.children) do
    c.widget[key] = value
  end
end

-- Resets the parent widget.
-- reset() -> none
function BaseLayout:reset()
  self.parent.width = self.parentwidth
  self.parent.height = self.parentheight
end

-- Initializes a new base layout class.
-- BaseLayout() -> table
function layoutmanager.BaseLayout()
  return setmetatable({}, BaseLayout)
end

return layoutmanager
