local localizationmanager = {}

-- Defines specific error massages.
localizationmanager.ERRORMESSAGE = {}
localizationmanager.ERRORMESSAGE.notvalidchild = "Not valid child widget."
localizationmanager.ERRORMESSAGE.notstring = "Parameter type must be string: "

-- Checks if the paramter is a valid child widget.
-- isvalidchild(name: string) -> boolean
function localizationmanager.isvalidchild(name)
    name = tostring(name)

    -- w = widget
    local w = { "Label", "Button", "Checkbox", "Radiobutton", "Groupbox", "MenuItem", "TabItem" }

    -- v = value
    for _, v in pairs(w) do
        if string.find(name, v) ~= nil then return true end
    end

    return false
end

-- Checks if the paramter is a string type.
-- isstring(name: string) -> boolean
function localizationmanager.isstring(name)
    return type(name) == "string"
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
    -- validates parameter types
    assert(localizationmanager.isvalidchild(child), localizationmanager.ERRORMESSAGE.notvalidchild)
    assert(localizationmanager.isstring(key), localizationmanager.ERRORMESSAGE.notstring .. "key")

    -- nw = new widget
    local nw = {}
    nw.widget = child
    nw.key = key

    table.insert(self.children, nw)
end

-- Initializes a new base localization class.
-- BaseLocalization() -> table
function localizationmanager.BaseLocalization()
    return setmetatable({}, BaseLocalization)
end

return localizationmanager
