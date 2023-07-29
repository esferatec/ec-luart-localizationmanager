local json = require("json")
local sys = require("sys")
local lm = require("ecluart.localizationmanager")

-- Defines a JSON localization manager.
local jsonlocalizationmanager = {}

-- Defines the json localization object.
local JsonLocalization = Object(lm.BaseLocalization())

-- Overrides the base localization constructor.
function JsonLocalization:constructor(source, language)
  super(self).constructor(self, source, language)
end

-- Loads the localization dictionary from a json file.
-- load(source: string) -> none
function JsonLocalization:load()
  if not self.source or self.source == "" then
    return {}
  end

  if type(self.source) ~= "string" then
    return {}
  end

  local file = sys.File(self.source)

  if not file.exists then
    file:close()
    return {}
  end

  file:open("read", "utf8")

  local content = file:read()

  file:close()

  self.dictionary = json.decode(content) or {}
end

-- Initializes a new json localization instance.
-- JsonLocalization(source: string, language?: string) -> object
function jsonlocalizationmanager.JsonLocalization(source, language)
  assert(lm.isString(source), lm.ERRORMESSAGE.notstring .. "source")
  return JsonLocalization(source, language)
end

return jsonlocalizationmanager
