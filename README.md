# ec-luart-localizationmanager

The project is a localization management module written in Lua. It defines a LocalizationManager object that handles localization of widgets in LuaRT desktop applications.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

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

Initializes a new localization manager instance.

## Property - dictionary

```Lua
LocalizationManager.dictionary (table)
```

Table containing the localization data.

## Property - language

```Lua
LocalizationManager.language (string)
```

String specifying the desired language.

## Method - add

```Lua
LocalizationManager:add(widget: object, property: string, key: string) -> none
```

Adds a widget, property and localization key.

## Method - apply

```Lua
LocalizationManager:apply() -> none
```

Sets the translated text for each widget.

## Method - translate

```Lua
LocalizationManager:translate(key: string) -> string
```

Gets the translated text for a key.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
