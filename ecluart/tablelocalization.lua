local lm = require("ecluart.localizationmanager")

local tablelocalizationmanager = {}

-- Defines the metatable.
local TableLocalization = lm.BaseLocalization()
TableLocalization.__index = TableLocalization

-- Sets the translated text for each widget.
-- translate() -> none
function TableLocalization:translate()
  -- dic = dictionary
  local dic = dofile(self.source)

  -- c = child
  for _, c in ipairs(self.children) do
    c.widget.text = dic[c.key]
  end
end

-- Initializes a new table localizer instance.
-- TableLocalization(source: string, language?: string) -> table
function tablelocalizationmanager.TableLocalization(source, language)
  -- validates parameter types
  assert(lm.isstring(source), lm.ERRORMESSAGE.notstring .. "source")

  -- new localizer
  local nl = setmetatable({}, TableLocalization)
  nl.children = {}
  nl.language = language or ""
  nl.source = source

  return nl
end

return tablelocalizationmanager
