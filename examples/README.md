# Example

```Lua
local ui = require("ui") -- Import the "ui" module
local lm = require("ecluart.lm") -- Import the "ecluart.lm" module

local dic_label = { -- Create a dictionary for labels
  ["name"] = "Name:", -- Key: "name", Value: "Name:"
  ["age"] = "Alter:", -- Key: "age", Value: "Alter:"
  ["country"] = "Land:", -- Key: "country", Value: "Land:"
  ["email"] = "E-Mail:", -- Key: "email", Value: "E-Mail:"
  ["password"] = "Passwort:" -- Key: "password", Value: "Passwort:"
}

local dic_menu = { -- Create a dictionary for menu items
  ["file"] = "Datei", -- Key: "file", Value: "Datei"
  ["exit"] = "Beenden", -- Key: "exit", Value: "Beenden"
  ["edit"] = "Bearbeiten", -- Key: "edit", Value: "Bearbeiten"
  ["new"] = "Neu", -- Key: "new", Value: "Neu"
  ["save"] = "Speichern" -- Key: "save", Value: "Speichern"
}

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400) -- Create a main window with a fixed size of 400x400
winMain.menu = ui.Menu("File", "Edit") -- Create a menu for the main window with "File" and "Edit" options
local mnuFile =  ui.Menu("New", "Save", "Exit") -- Create a submenu for the "File" option with "New", "Save", and "Exit" options
winMain.menu.items[1].submenu = mnuFile -- Assign the submenu to the first item of the main menu

local lomLabel = lm.LocalizationManager(dic_label, "German_Germany") -- Create a localization manager for labels with the German language and Germany region
local lomMenu = lm.LocalizationManager(dic_menu, "German_Germany") -- Create a localization manager for menu items with the German language and Germany region

local etyName = ui.Entry(winMain, "", 100, 20, 180) -- Create an entry field for the name with a width of 100, positioned at (20, 180)
local etyPassword = ui.Entry(winMain, "", 100, 52, 180) -- Create an entry field for the password with a width of 100, positioned at (52, 180)
local etyAge = ui.Entry(winMain, "", 100, 84, 40) -- Create an entry field for the age with a width of 100, positioned at (84, 40)
local etyEmail = ui.Entry(winMain, "", 100, 116, 180) -- Create an entry field for the email with a width of 100, positioned at (116, 180)
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80) -- Create a combobox for the country with options "Item 1", "Item 2", and "Item 3", positioned at (148, 80)

local lblName = ui.Label(winMain, "Name:", 10, 25) -- Create a label for the name with text "Name:", positioned at (10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57) -- Create a label for the password with text "Password:", positioned at (10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89) -- Create a label for the age with text "Age:", positioned at (10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121) -- Create a label for the email with text "Email:", positioned at (10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153) -- Create a label for the country with text "Country:", positioned at (10, 153)

local btnApply = ui.Button(winMain, "Apply Localization", 10, 210, 380) -- Create a button with the text "Apply Localization", positioned at (10, 210) with a width of 380

lomLabel:add(lblName, "text", "name") -- Add the label for the name to the localization manager with the key "name"
lomLabel:add(lblPassword, "text", "password") -- Add the label for the password to the localization manager with the key "password"
lomLabel:add(lblAge, "text", "age") -- Add the label for the age to the localization manager with the key "age"
lomLabel:add(lblEmail, "text", "email") -- Add the label for the email to the localization manager with the key "email"
lomLabel:add("lblCountry", "text", "country") -- Add the label for the country to the localization manager with the key "country"

lomMenu:add(winMain.menu.items[1], "text", "file") -- Add the first item of the main menu to the localization manager with the key "file"
lomMenu:add(winMain.menu.items[2], "text", "edit") -- Add the second item of the main menu to the localization manager with the key "edit"
lomMenu:add(mnuFile.items[1], "text", "new") -- Add the first item of the submenu to the localization manager with the key "new"
lomMenu:add(mnuFile.items[2], "text", "save") -- Add the second item of the submenu to the localization manager with the key "save"
lomMenu:add(mnuFile.items[3], "text", "exit") -- Add the third item of the submenu to the localization manager with the key "exit"

function btnApply:onClick() -- Define the onClick event handler for the button
  lomLabel:apply() -- Apply the localized labels
  lomMenu:apply() -- Apply the localized menu items
  os.setlocale(lomLabel.language, "all") -- Set the locale for the application
  etyName.text = 99.99 -- Set the text of the name entry field to "99.99"
end

winMain:show() -- Show the main window

repeat
  ui.update() -- Update the UI
until not winMain.visible -- Repeat until the main window is not visible anymore
```
