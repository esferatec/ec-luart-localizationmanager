local json = require("json")
local io = require("io")
local lm = require("ecluart.localizationmanager")

local tablelocalizationmanager = {}

-- Defines the metatable.
local TableLocalization = lm.BaseLocalization()
TableLocalization.__index = TableLocalization

function TableLocalization:translate()

 local dic = dofile("de.lua")

    for _, c in pairs(self.children) do
        c.widget.text = dic[c.key]
      end
end

-- Initializes a new json localizer instance.
function tablelocalizationmanager.TableLocalization()
  -- new localizer
  local nl = setmetatable({}, TableLocalization)
  nl.children = {}
  nl.language = "de-DE"
  nl.source = ""
  
  return nl
end

return tablelocalizationmanager
