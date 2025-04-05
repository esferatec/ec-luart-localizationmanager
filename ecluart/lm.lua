-- Defines a localization management module.
local lm = {} -- version 2025.04

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
local function isString(parameter)
  return type(parameter) == "string"
end

-- Checks if the parameter is a table type.
-- isTable(parameter: any) -> boolean
local function isTable(parameter)
  return type(parameter) == "table"
end

-- Defines the localization manager object.
local LocalizationManager = Object({})

-- Creates the localization manager constructor.
function LocalizationManager:constructor()
  local _dictionary = {}
  local _language = os.setlocale("")

  function self:set_dictionary(value)
    if not isTable(value) then
      value = {}
    end

    _dictionary = value
  end

  function self:get_dictionary()
    return _dictionary
  end

  function self:set_language(value)
    if not isString(value) or value == "" then
      value = os.setlocale("")
    end

    _language = value
  end

  function self:get_language()
    return _language
  end

  self.children = {}
end

-- Adds a widget, property and localization key.
-- add(widget: object, property: string, key: string) -> none
function LocalizationManager:add(widget, property, key)
  if not isValidChild(widget) then return end
  if not isString(property) then return end
  if not isString(key) then return end

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
    if translatedText then
      child.widget[child.property] = translatedText
    end
  end

  os.setlocale(self.language, "all")
end

-- Gets the translated text for a key.
-- translate(key: string) -> string
function LocalizationManager:translate(key)
  if not isString(key) then return "" end
  return self.dictionary[key] or ""
end

-- Initializes a new localization manager instance.
-- LocalizationManager() -> object
function lm.LocalizationManager()
  return LocalizationManager()
end

return lm
