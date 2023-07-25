local lm = require("ecluart.localizationmanager")

local tablelocalizationmanager = {}

-- Defines the metatable.
local TableLocalization = lm.BaseLocalization()
TableLocalization.__index = TableLocalization

-- Loads the dictionary from the table file.
-- loadSourceFile() -> string
local function loadDictionary(sourcefile)
  return dofile(sourcefile)
end

-- Sets the translated text for each widget.
-- translate() -> none
function TableLocalization:translate()
  if self.source == "" then
    return
  end

  local dictionary = loadDictionary(self.source)

  if type(dictionary) ~= "table" then
    return
  end

  for _, child in ipairs(self.children) do
    local translatedText = dictionary[child.key]
    if translatedText then child.widget.text = translatedText end
  end
end

-- Initializes a new table localizer instance.
-- TableLocalization(source: string, language?: string) -> table
function tablelocalizationmanager.TableLocalization(source, language)
  assert(lm.isString(source), lm.ERRORMESSAGE.notstring .. "source")

  local newLocalization = setmetatable({}, TableLocalization)
  newLocalization.children = {}
  newLocalization.language = language or ""
  newLocalization.source = source

  return newLocalization
end

return tablelocalizationmanager
