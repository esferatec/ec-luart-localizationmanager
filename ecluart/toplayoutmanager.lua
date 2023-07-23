local lm = require("ecluart.layoutmanager")

-- Arranges child widgets into a single row on the top border.
-- Default direction is "left" and default alignment is "top".
local toplayoutmanager = {}

-- Defines specific constants.
toplayoutmanager.DIRECTION = { Left = 1, Right = 2 }
toplayoutmanager.ALIGNMENT = { Top = 1, Bottom = 2, Center = 3 }

-- Defines the metatable.
local TopLayout = lm.BaseLayout()
TopLayout.__index = TopLayout

-- Adds a child widget.
-- add(child: table, alignment?[Top, Bottom, Center]: number) -> none
function TopLayout:add(child, alignment)
  -- validates parameter types
  assert(lm.isvalidchild(child), lm.ERRORMESSAGE.notvalidchild)
  assert(lm.isnumberornil(alignment), lm.ERRORMESSAGE.notnumberornil .. "alignment")

  -- validates parameter values
  if alignment == nil then alignment = toplayoutmanager.ALIGNMENT.Top end
  if alignment > 3 then alignment = toplayoutmanager.ALIGNMENT.Top end

  -- nw = new widget
  local nw = {}
  nw.widget = child
  nw.width = child.width
  nw.height = (child.height > self.height) and self.height or child.height
  nw.positionx = self.nextx
  nw.positiony = self.nexty
  nw.alignment = alignment

  -- overwrites current values if direction is "right"
  if self.direction == toplayoutmanager.DIRECTION.Right then
    nw.positionx = self.nextx - nw.width
  end

  -- overwrites current values if alignemt is "bottom"
  if nw.alignment == toplayoutmanager.ALIGNMENT.Bottom then
    nw.positiony = self.nexty + self.height - nw.height
  end

  -- overwrites current values if alignemt is "center"
  if nw.alignment == toplayoutmanager.ALIGNMENT.Center then
    nw.positiony = self.nexty + (self.height * 0.5) - (nw.height * 0.5)
  end

  -- sets current values for the next widget
  if self.direction == toplayoutmanager.DIRECTION.Right then
    self.nextx = self.nextx - nw.width - self.gap
  else
    self.nextx = self.nextx + nw.width + self.gap
  end

  table.insert(self.children, nw)
end

-- Updates all child widgets.
-- update() -> none
function TopLayout:update()
  -- wd = width difference
  local wd = 0

  -- overwrites default values if direction is "right"
  if self.direction == toplayoutmanager.DIRECTION.Right then
    wd = self.parent.width - self.parentwidth
  end

  -- c = child
  for _, c in pairs(self.children) do
    c.widget.x = c.positionx + wd
    c.widget.y = c.positiony
  end
end

-- Initializes a new top layout instance.
-- TopLayout(parent: table, direction?[Left, Right]: number, gap?: number, margin?{left, right, top, bottom}: table, height: number) -> table
function toplayoutmanager.TopLayout(parent, direction, gap, margin, height)
  -- validates parameter types
  assert(lm.isvalidparent(parent), lm.ERRORMESSAGE.notvalidparent)
  assert(lm.isnumberornil(direction), lm.ERRORMESSAGE.notnumberornil .. "direction")
  assert(lm.isnumberornil(gap), lm.ERRORMESSAGE.notnumberornil .. "gap")
  assert(lm.istableornil(margin), lm.ERRORMESSAGE.notnumberornil .. "margin")
  assert(lm.isnumberornil(height), lm.ERRORMESSAGE.notnumberornil .. "height")

  -- validates parameter values
  if direction == nil then direction = toplayoutmanager.DIRECTION.Left end
  if direction > 2 then direction = toplayoutmanager.DIRECTION.Left end
  if margin == nil then margin = { 0, 0, 0, 0 } end

  -- nl = new layout
  local nl = setmetatable({}, TopLayout)
  nl.parent = parent
  nl.parentwidth = parent.width
  nl.parentheight = parent.height
  nl.children = {}
  nl.direction = direction
  nl.gap = gap or 0
  nl.marginleft = margin[1] or 0
  nl.marginright = margin[2] or 0
  nl.margintop = margin[3] or 0
  nl.marginbottom = margin[4] or 0
  nl.height = height or (nl.parentheight - nl.marginbottom - nl.margintop)
  nl.startx = 0 + nl.marginleft
  nl.starty = 0 + nl.margintop
  nl.endx = nl.parentwidth - nl.marginright
  nl.endy = nl.height + nl.margintop
  nl.nextx = nl.startx
  nl.nexty = nl.starty

  -- overwrites default values if direction is "right"
  if nl.direction == toplayoutmanager.DIRECTION.Right then
    nl.nextx = nl.endx
  end

  return nl
end

return toplayoutmanager
