# LM.LUA

The code is a Lua module for managing localization. It defines a LocalizationManager object that handles the translation of text in different languages.

## Constructor

```Lua
 LocalizationManager() -> object
```

The code above initializes a new instance of the localization manager. It returns the newly created object.

## Method - add

```Lua
LocalizationManager:add(widget: object, property: string, key: string) -> none
```

This function adds a widget and its corresponding localization key to the LocalizationManager object. It takes three parameters: widget (an object representing the widget), property (a string representing the property of the widget to be localized), and key (a string representing the localization key). It first checks if the widget is a valid child object, and if property and key are strings. If any of these conditions are not met, the function returns early. Otherwise, it creates a new table and assigns the widget, property, and key to its respective properties. Finally, it inserts the table into the children table of the LocalizationManager object.

## Method - apply

```Lua
LocalizationManager:apply(dictionary: table, language?: string) -> none
```

This function sets the translated text for each widget in the LocalizationManager object. It defines a function  that takes two parameters: dictionary and language. The dictionary parameter is expected to be a table containing the localization data, while the language parameter is an optional string specifying the desired language. It first checks if the dictionary table is empty. If it is empty, the function returns early. Otherwise, it iterates over each child object in the children table. It retrieves the translated text for the child's key from the dictionary table and assigns it to the corresponding property of the child's widget.

## Method - translate

```Lua
LocalizationManager:translate(key: string) -> string
```

This function retrieves the translated text for a given key from the LocalizationManager object. It takes one parameter: key (a string representing the localization key). If the key is not a string, the function returns an empty string. Otherwise, it retrieves the translated text for the key from the dictionary table. If the translated text is not found, it returns an empty string; otherwise, it returns the translated text.
