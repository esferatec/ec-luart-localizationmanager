local lm = require("ecluart.localizationmanager")

local tablelocalizationmanager = {}

-- Loads the dictionary from the table file.
-- loadDictionary(sourcefile: string) -> table
local function loadDictionary(sourcefile)
  local file = dofile(sourcefile)

  if file == nil or type(file) ~= "table" then
    return {}
  end

  return file or {}
end

-- Defines the metatable.
local TableLocalization = lm.BaseLocalization()
TableLocalization.__index = TableLocalization

-- Initializes a new table localizer instance.
-- TableLocalization(source: string, language?: string) -> table
function tablelocalizationmanager.TableLocalization(source, language)
  assert(lm.isString(source), lm.ERRORMESSAGE.notstring .. "source")

  local newLocalization = setmetatable({}, TableLocalization)
  newLocalization.children = {}
  newLocalization.language = language or ""
  newLocalization.source = source
  newLocalization.dictionary = loadDictionary

  return newLocalization
end

return tablelocalizationmanager
