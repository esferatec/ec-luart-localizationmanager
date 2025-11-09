-- Defines a localization management module.
local lm = {} -- version 2025.11

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local invalidTypes = {
    ["nil"] = true,
    ["boolean"] = true,
    ["number"] = true,
    ["string"] = true,
    ["userdata"] = true,
    ["function"] = true,
    ["thread"] = true
  }

  return not invalidTypes[type(parameter)]
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

-- Adds a widget, widget property and localization key.
-- add(widget: object, property: string, key: string) -> none
function LocalizationManager:add(widget, property, key)
  if not isValidChild(widget) then return end
  if not isStringType(property) then return end
  if not isStringType(key) then return end
  if property == "" then return end
  if key == "" then return end

  local newChild = {
    widget = widget,
    property = property,
    key = key
  }

  table.insert(self.children, newChild)
end

-- Loads the localization text for each widget.
-- translate() -> none
function LocalizationManager:translate()
  for _, child in ipairs(self.children) do
    local localizationText = self.dictionary[child.key]
    child.widget[child.property] = localizationText
  end

  os.setlocale(self.language, "all")
end

-- Gets the localization text for a key.
-- text(key: string) -> string
function LocalizationManager:text(key)
  if not isStringType(key) then return end
  if key == "" then return end
  return self.dictionary[key] or ""
end

-- Initializes a new localization manager instance.
-- LocalizationManager() -> object
function lm.LocalizationManager()
  return LocalizationManager()
end

return lm
