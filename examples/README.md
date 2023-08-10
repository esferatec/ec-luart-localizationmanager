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
  lomLabel:setlocale() -- Set the locale for the label localization manager
  etyName.text = 99.99 -- Set the text of the name entry field to "99.99"
end

winMain:show() -- Show the main window

repeat
  ui.update() -- Update the UI
until not winMain.visible -- Repeat until the main window is not visible anymore
```

# Explanation

The provided code is written in Lua and demonstrates the usage of the "ui" and "ecluart.lm" modules for creating a registration form with localized labels and menu items. Let's go through the code and understand its functionality.

First, the necessary modules are imported using the require function:

```Lua
local ui = require("ui")
local lm = require("ecluart.lm")
```
Next, two dictionaries are created: dic_label for labels and dic_menu for menu items. These dictionaries store the translations for different keys in different languages.

The main window is created using the ui.Window function:

```Lua
local winMain = ui.Window("RegistrationForm", "fixed", 400, 400)
```

The window is given a title of "RegistrationForm" and a fixed size of 400x400 pixels.

A menu is added to the main window using the ui.Menu function:

```Lua
winMain.menu = ui.Menu("File", "Edit")
```

The menu is created with two options: "File" and "Edit".

A submenu is created for the "File" option using the ui.Menu function:

```Lua
winMain.menu.items[1].submenu = mnuFile
```

A localization manager is created for labels and menu items using the lm.LocalizationManager function:

```Lua
local lomLabel = lm.LocalizationManager(dic_label, "German_Germany")
local lomMenu = lm.LocalizationManager(dic_menu, "German_Germany")
```

The localization manager is initialized with the respective dictionaries and the desired language and region.

Various UI elements such as entry fields, labels, and a combobox are created using the provided functions from the "ui" module.

The labels and menu items are added to the localization manager using the add method:

```Lua
lomLabel:add(lblName, "text", "name")
lomLabel:add(lblPassword, "text", "password")
lomLabel:add(lblAge, "text", "age")
lomLabel:add(lblEmail, "text", "email")
lomLabel:add(lblCountry, "text", "country")
```
The add method takes the UI element, the property to be localized, and the key from the dictionary.

Similarly, the menu items are added to the localization manager:

```Lua
lomMenu:add(winMain.menu.items[1], "text", "file")
lomMenu:add(winMain.menu.items[2], "text", "edit")
lomMenu:add(mnuFile.items[1], "text", "new")
lomMenu:add(mnuFile.items[2], "text", "save")
lomMenu:add(mnuFile.items[3], "text", "exit")
```

An event handler is defined for the "Apply Localization" button using the onClick method:

```Lua
function btnApply:onClick()
  lomLabel:apply()
  lomMenu:apply()
  lomLabel:setlocale()
  etyName.text = 99.99
end
```
When the button is clicked, the localized labels and menu items are applied, the locale is set, and the text of the name entry field is set to "99.99".

Finally, the main window is shown using the show method:

```Lua
winMain:show()
```
The UI is updated in a loop until the main window is no longer visible:

```Lua
repeat
  ui.update()
until not winMain.visible
```

This code demonstrates how to create a registration form with localized labels and menu items using Lua and the provided modules.
