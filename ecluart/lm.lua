-- Defines a localization management module.
local lm = {}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local childType = type(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  for _, invalidType in ipairs(invalidTypes) do
    if string.find(childType, invalidType) then return false end
  end

  return true
end

-- Checks if the parameter is a table type.
-- isTable(parameter: any) -> boolean
local function isTable(parameter)
  return type(parameter) == "table"
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isString(parameter)
  return type(parameter) == "string"
end

-- Defines the localization manager object.
local LocalizationManager = Object({})

-- Creates the localization manager constructor.
function LocalizationManager:constructor()
  local _dictionary = {}
  local _language = ""

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

  local newChild = {}
  newChild.widget = widget
  newChild.property = property
  newChild.key = key

  table.insert(self.children, newChild)
end

-- Sets the translated text for each widget.
-- apply(dictionary: table, language?: string) -> none
function LocalizationManager:apply(dictionary, language)
  self.dictionary = dictionary
  self.language = language

  if next(self.dictionary) == nil then return end

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

  local translatedText = self.dictionary[key]
  if not translatedText then return "" end

  return translatedText
end

-- Initializes a new localization manager instance.
-- LocalizationManager() -> object
function lm.LocalizationManager()
  return LocalizationManager(33333)
end

return lm
