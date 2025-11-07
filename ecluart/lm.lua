-- Defines a localization management module.
local lm = {} -- version 2025.11

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  return not table.concat(invalidTypes, ","):find(type(parameter))
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isStringType(parameter)
  return type(parameter) == "string"
end

-- Checks if the parameter is a nil type.
-- isNilType(parameter: any) -> boolean
local function isNilType(parameter)
  return type(parameter) == "nil"
end

-- Defines the localization manager object.
local LocalizationManager = Object({})

-- Creates the localization manager constructor.
function LocalizationManager:constructor()
  self.dictionary = {}
  self.language = os.setlocale("")
  self.children = {}
end

-- Adds a widget, property and localization key.
-- add(widget: object, property: string, key: string) -> none
function LocalizationManager:add(widget, property, key)
  if not isValidChild(widget) then return end
  if not isStringType(property) then return end
  if not isStringType(key) then return end

  local newChild = {
    widget = widget,
    property = property,
    key = key
  }

  table.insert(self.children, newChild)
end

-- Sets the translated text for each widget.
-- apply() -> none
function LocalizationManager:apply()
  for _, child in ipairs(self.children) do
    local translatedText = self.dictionary[child.key]

    if not isNilType(translatedText) then
      child.widget[child.property] = translatedText
    end
  end

  os.setlocale(self.language, "all")
end

-- Gets the translated text for a key.
-- translate(key: string) -> string
function LocalizationManager:translate(key)
  if not isStringType(key) then return "" end
  return self.dictionary[key] or ""
end

-- Initializes a new localization manager instance.
-- LocalizationManager() -> object
function lm.LocalizationManager()
  return LocalizationManager()
end

return lm
