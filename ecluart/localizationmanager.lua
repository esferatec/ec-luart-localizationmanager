-- Represents the base module for all localization managers.
local localizationmanager = {}

-- Defines specific error massages.
localizationmanager.ERRORMESSAGE = {
  notvalidchild = "Parameter is not a valid child widget: ",
  notstring = "Parameter type must be a string: "
}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
function localizationmanager.isValidChild(parameter)
  local childType = type(parameter)
  local validTypes = { "Label", "Button", "Checkbox", "Radiobutton", "Groupbox", "MenuItem", "TabItem" }

  for _, validType in ipairs(validTypes) do
    if string.find(childType, validType) then return true end
  end

  return false
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
function localizationmanager.isString(parameter)
  return type(parameter) == "string"
end

-- Defines the base localization object.
local BaseLocalization = Object({})

-- Creates the base localization constructor.
function BaseLocalization:constructor(source, language)
  self.source = source
  self.language = language or ""
  self.children = {}
  self.dictionary = {}
end

-- Adds a widget and key.
-- add(widget: object, key: string) -> none
function BaseLocalization:add(widget, key)
  assert(localizationmanager.isValidChild(widget), localizationmanager.ERRORMESSAGE.notvalidchild .. "child")
  assert(localizationmanager.isString(key), localizationmanager.ERRORMESSAGE.notstring .. "key")

  local newChild = {}
  newChild.widget = widget
  newChild.key = key

  table.insert(self.children, newChild)
end

-- Sets the language.
-- setLanguage(language: string) -> none
function BaseLocalization:setLanguage(language)
  assert(localizationmanager.isString(language), localizationmanager.ERRORMESSAGE.notstring .. "language")
  self.language = language
end

-- Gets the language.
-- getLanguage() -> string
function BaseLocalization:getLanguage()
  return self.language
end

-- Sets the source file path.
-- setSource(source: string) -> none
function BaseLocalization:setSource(source)
  assert(localizationmanager.isString(source), localizationmanager.ERRORMESSAGE.notstring .. "source")
  self.source = source
end

-- Gets the source file path.
-- getSource() -> string
function BaseLocalization:getSource()
  return self.source
end

-- Sets the current locale.
-- setLocale() -> none
function BaseLocalization:setLocale()
  if not os.setlocale(self.language, "all") then
    self.language = os.setlocale("", "all")
  end
end

-- Gets the current locale.
-- getLocale() -> string
function BaseLocalization:getLocale()
  return os.setlocale(nil)
end

-- Loads the locilization dictionary.
-- load() -> none
function BaseLocalization:load()
  -- Must be implied and overwritten in each localization manager.
end

-- Sets the translated text for each widget.
-- apply() -> none
function BaseLocalization:apply()
  if next(self.dictionary) == nil then
    return
  end

  for _, child in ipairs(self.children) do
    local translatedText = self.dictionary[child.key]
    if translatedText then child.widget.text = translatedText end
  end
end

-- Clears the localization dictionary.
-- clear() -> none
function BaseLocalization:clear()
  self.dictionary = {}
end

-- Initializes a new base localization instance.
-- BaseLocalization() -> object
function localizationmanager.BaseLocalization()
  return BaseLocalization()
end

return localizationmanager
