local ui = require("ui")
local lm = require("ecluart.lm")

local dic_label = {
  ["name"] = "Name:",
  ["age"] = "Alter:",
  ["country"] = "Land:",
  ["email"] = "E-Mail:",
  ["password"] = "Passwort:"
}

local dic_menu = {
  ["file"] = "Datei",
  ["exit"] = "Beenden",
  ["edit"] = "Bearbeiten",
  ["new"] = "Neu",
  ["save"] = "Speichern"
}

--#region main window
local winMain = ui.Window("RegistrationForm", "fixed", 400, 400)
winMain.menu = ui.Menu("File", "Edit")
local mnuFile =  ui.Menu("New", "Save", "Exit")
winMain.menu.items[1].submenu = mnuFile

local lomLabel = lm.LocalizationManager(dic_label, "German_Germany")
local lomMenu = lm.LocalizationManager(dic_menu, "German_Germany")

local etyName = ui.Entry(winMain, "", 100, 20, 180)
local etyPassword = ui.Entry(winMain, "", 100, 52, 180)
local etyAge = ui.Entry(winMain, "", 100, 84, 40)
local etyEmail = ui.Entry(winMain, "", 100, 116, 180)
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80)

local lblName = ui.Label(winMain, "Name:", 10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153)

lblName.textalign = "left"
lblPassword.textalign = "left"
lblAge.textalign = "left"
lblEmail.textalign = "left"
lblCountry.textalign = "left"

local btnApply = ui.Button(winMain, "Apply Localization", 10, 210, 380)
--#endregion main window

lomLabel:add(lblName, "text", "name")
lomLabel:add(lblPassword, "text", "password")
lomLabel:add(lblAge, "text", "age")
lomLabel:add(lblEmail, "text", "email")
lomLabel:add(lblCountry, "text", "country")

lomMenu:add(winMain.menu.items[1], "text", "file")
lomMenu:add(winMain.menu.items[2], "text", "edit")
lomMenu:add(mnuFile.items[1], "text", "new")
lomMenu:add(mnuFile.items[2], "text", "save")
lomMenu:add(mnuFile.items[3], "text", "exit")

function btnApply:onClick()
  lomLabel:apply()
  lomMenu:apply()
  os.setlocale(lomLabel.language, "all")
  etyName.text = 99.99
end

winMain:show()

repeat
  ui.update()
until not winMain.visible
