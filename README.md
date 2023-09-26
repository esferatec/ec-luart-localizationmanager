# ec-luart-localizationmanager

The project is a localization management module written in Lua. It defines a LocalizationManager object that handles localization of widgets in LuaRT desktop applications.

![example](/readme.png)

[![Lua 5.4.6](https://badgen.net/badge/Lua/5.4.6/yellow)](https://github.com/lua/lua)
[![LuaRT 1.5.2](https://badgen.net/badge/LuaRT/1.5.2/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

## Features

The project provides a modular and flexible way to manage localization in desktop applications. It allows for easy addition of widgets and their corresponding localization keys, as well as applying translations to the widgets. The localization manager can be customized by providing a dictionary table with translations and a language string. Several localization managers can be used in one application.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "lm.lua" file into this folder.

```text
[programm]
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
local lm = require("eclua.lm") 
```

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
