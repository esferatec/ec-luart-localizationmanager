local lm = require("ecluart.localizationmanager")
local json = require("json")

local jsonlocalizationmanager = {}

-- Loads the dictionary from the json file.
-- loadSourceFile() -> string
local function loadDictionary(filename)
  local file = io.open(filename, "r")

  if file then
    local contents = file:read("a")
    file:close()
    return json.decode(contents)
  end

  return nil
end

-- Defines the metatable.
local JsonLocalization = lm.BaseLocalization()
JsonLocalization.__index = JsonLocalization

-- Sets the translated text for each widget.
-- translate() -> none
function JsonLocalization:translate()
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

-- Initializes a new json localizer instance.
-- JsonLocalization(source: string, language?: string) -> table
function jsonlocalizationmanager.JsonLocalization(source, language)
  assert(lm.isString(source), lm.ERRORMESSAGE.notstring .. "source")

  local newLocalization = setmetatable({}, JsonLocalization)
  newLocalization.children = {}
  newLocalization.language = language or ""
  newLocalization.source = source

  return newLocalization
end

return jsonlocalizationmanager
