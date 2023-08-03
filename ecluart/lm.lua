-- Defines a localization management module.
local lm = {}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local childType = type(parameter)
  local validTypes = { "Label", "Button", "Checkbox", "Radiobutton", "Groupbox", "MenuItem", "TabItem" }

  for _, validType in ipairs(validTypes) do
    if string.find(childType, validType) then return true end
  end

  return false
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
function LocalizationManager:constructor(dictionary, language)
  local _dictionary = {}
  local _language = ""

  function self:set_language(value)
    if not isString(value) then
      _language = _language ~= "" and _language or os.setlocale("")
      return
    end

    _language = value ~= "" and value or os.setlocale("")
  end

  function self:get_language()
    return _language
  end

  function self:set_dictionary(value)
    if not isTable(value) then
      _dictionary = next(_dictionary) == nil and {} or _dictionary
      return
    end

    _dictionary = value
  end

  function self:get_dictionary()
    return _dictionary
  end

  self.language = language
  self.dictionary = dictionary

  self._children = {}
end

-- Adds a widget and localization key.
-- add(widget: object, key: string) -> none
function LocalizationManager:add(widget, key)
  if not isValidChild(widget) then
    return
  end

  if not isString(key) then
    return
  end

  local newChild = {}
  newChild.widget = widget
  newChild.key = key

  table.insert(self._children, newChild)
end

-- Sets the translated text for each widget.
-- apply() -> none
function LocalizationManager:apply()
  if next(self.dictionary) == nil then
    return
  end

  for _, child in ipairs(self._children) do
    local translatedText = self.dictionary[child.key]
    if translatedText then child.widget.text = translatedText end
  end
end

-- Sets the current locale.
-- setlocale() -> none
function LocalizationManager:setlocale()
  if not os.setlocale(self.language, "all") then
    self.language = os.setlocale("", "all")
  end
end

-- Gets the current locale.
-- getlocale() -> string
function LocalizationManager:getlocale()
  return os.setlocale(nil)
end

-- Initializes a new localization manager instance.
-- LocalizationManager(dictionary: table, language?: string) -> object
function lm.LocalizationManager(dictionary, language)
  return LocalizationManager(dictionary, language)
end

return lm
