local localizationmanager = {}

-- Defines specific error massages.
localizationmanager.ERRORMESSAGE = {
  notvalidchild = "Parameter is not a valid child widget: ",
  notstring = "Parameter type must be a string: "
}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
function localizationmanager.isValidChild(parameter)
  local widgetType = type(parameter)
  local validWidgets = { "Label", "Button", "Checkbox", "Radiobutton", "Groupbox", "MenuItem", "TabItem" }

  for _, validWidget in pairs(validWidgets) do
    if string.find(widgetType, validWidget) then return true end
  end

  return false
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
function localizationmanager.isString(parameter)
  return type(parameter) == "string"
end

-- Defines the base localization prototype.
local BaseLocalization = {
  children = {},
  language = "",
  source = ""
}
BaseLocalization.__index = BaseLocalization

-- Adds a child widget and key.
-- add(child: table, key: string) -> none
function BaseLocalization:add(child, key)
  assert(localizationmanager.isValidChild(child), localizationmanager.ERRORMESSAGE.notvalidchild .. "child")
  assert(localizationmanager.isString(key), localizationmanager.ERRORMESSAGE.notstring .. "key")

  local newWidget = {}
  newWidget.widget = child
  newWidget.key = key

  table.insert(self.children, newWidget)
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

-- Sets the current locale for the application.
-- setLocale() -> none
function BaseLocalization:setLocale()
  if not os.setlocale(self.language, "all") then
    self.language = os.setlocale("", "all")
  end
end

-- Gets the current locale of the application.
-- getLocale() -> string
function BaseLocalization:getLocale()
  return os.setlocale(nil)
end

-- Initializes a new base localization class.
-- BaseLocalization() -> table
function localizationmanager.BaseLocalization()
  return setmetatable({}, BaseLocalization)
end

return localizationmanager
