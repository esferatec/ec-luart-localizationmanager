local lm = require("ecluart.localizationmanager")
local json = require("json")

local jsonlocalizationmanager = {}

-- Loads the dictionary from the json file.
-- loadDictionary(sourcefile: string) -> table
local function loadDictionary(sourcefile)
  local file = io.open(sourcefile, "r")

  if file == nil or type(file) ~= "table" then
    return {}
  end

  local contents = file:read("a")
  file:close()
  return json.decode(contents) or {}
end

-- Defines the metatable.
local JsonLocalization = lm.BaseLocalization()
JsonLocalization.__index = JsonLocalization

-- Initializes a new json localizer instance.
-- JsonLocalization(source: string, language?: string) -> table
function jsonlocalizationmanager.JsonLocalization(source, language)
  assert(lm.isString(source), lm.ERRORMESSAGE.notstring .. "source")

  local newLocalization = setmetatable({}, JsonLocalization)
  newLocalization.children = {}
  newLocalization.language = language or ""
  newLocalization.source = source
  newLocalization.dictionary = loadDictionary

  return newLocalization
end

return jsonlocalizationmanager
