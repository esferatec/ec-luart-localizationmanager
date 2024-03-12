# ec-luart-localizationmanager

The project is a localization management module written in Lua. It defines a LocalizationManager object that handles localization of widgets in LuaRT desktop applications.

[![Lua 5.4.6](https://badgen.net/badge/Lua/5.4.6/yellow)](https://github.com/lua/lua)
[![LuaRT 1.7.0](https://badgen.net/badge/LuaRT/1.7.0/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

## Features

The project provides a modular and flexible way to manage localization in desktop applications. It allows easy addition of widgets and their corresponding localization keys, as well as applying translations text. Several localization managers can be used in one application.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "lm.lua" file into this folder.

```text
[application]
|
|----ecluart
|   |
|   |----lm.lua
|   |----...
|
|----app.wlua
```

## Usage

The localization manager (lm) can be loaded using the function *require()*:

```lua
local lm = require("ecluart.lm") 
```

## Constructor

```Lua
 LocalizationManager() -> object
```

The code above initializes a new instance of the localization manager. It returns the newly created object.

## Property - dictionary

```Lua
LocalizationManager.dictionary (table)
```

The dictionary property is expected to be a table containing the localization data.

## Property - language

```Lua
LocalizationManager.language (string)
```

the language property is an string specifying the desired language.

## Method - add

```Lua
LocalizationManager:add(widget: object, property: string, key: string) -> none
```

This function adds a widget and its corresponding localization key to the LocalizationManager object. It takes three parameters: widget (an object representing the widget), property (a string representing the property of the widget to be localized), and key (a string representing the localization key). It first checks if the widget is a valid child object, and if property and key are strings. If any of these conditions are not met, the function returns early. Otherwise, it creates a new table and assigns the widget, property, and key to its respective properties. Finally, it inserts the table into the children table of the LocalizationManager object.

## Method - apply

```Lua
LocalizationManager:apply(dictionary: table, language?: string) -> none
```

This function sets the translated text for each widget in the LocalizationManager object. It iterates over each child object in the children table. It retrieves the translated text for the child's key from the dictionary table and assigns it to the corresponding property of the child's widget.

## Method - translate

```Lua
LocalizationManager:translate(key: string) -> string
```

This function retrieves the translated text for a given key from the LocalizationManager object. It takes one parameter: key (a string representing the localization key). If the key is not a string, the function returns an empty string. Otherwise, it retrieves the translated text for the key from the dictionary table. If the translated text is not found, it returns an empty string; otherwise, it returns the translated text.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
