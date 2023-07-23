local io = require("io")
local json = require("json")
local ui = require("ui")
local lm = require("ecluart.localizationmanager")

local jsonlocalizationmanager = {}

local function loadfile(filename)
  print(filename)
  local file = io.open(filename, "r")
  print(file)

  if file then
    print("a")
    local contents = file:read("a")
    print(contents)
    file:close()
    return json.decode(contents)
  else
    print("b")
    return nil
  end
end

-- Defines the metatable.
local JsonLocalization = lm.BaseLocalization()
JsonLocalization.__index = JsonLocalization

-- Sets the translated text for each widget.
-- translate() -> none
function JsonLocalization:translate()
  -- dic = dictionary
  local dic = loadfile(self.source)

  -- c = child
  for _, c in ipairs(self.children) do
    c.widget.text = dic[c.key]
  end
end

-- Initializes a new json localizer instance.
-- JsonLocalization(source: string, language?: string) -> table
function jsonlocalizationmanager.JsonLocalization(source, language)
  -- validates parameter types
  assert(lm.isstring(source), lm.ERRORMESSAGE.notstring .. "source")

  -- new localizer
  local nl = setmetatable({}, JsonLocalization)
  nl.children = {}
  nl.language = language or ""
  nl.source = source

  return nl
end

return jsonlocalizationmanager
