This is a documentation on how to create a script for the platform. Use F3 to search for the function or session you want: Draw/Platform/UI or specific function.

# GENERAL Classes

The structures Vec2, Vec3, and Vec4 are used on the platform to represent vectors with 2, 3, and 4 components, respectively.

## Vec2

The Vec2 structure has the following properties:

- `x`: X component of the vector
- `y`: Y component of the vector

### Constructors

- `Vec2()`: creates a vector with values (0, 0)
- `Vec2(x, y)`: creates a vector with the values provided for the X and Y components

## Vec3

The Vec3 structure has the following properties:

- `x`: X component of the vector
- `y`: Y component of the vector
- `z`: Z component of the vector

### Constructors

- `Vec3()`: creates a vector with values (0, 0, 0)
- `Vec3(x, y, z)`: creates a vector with the values provided for the X, Y, and Z components

## Vec4

The Vec4 structure has the following properties:

- `x`: X component of the vector
- `y`: Y component of the vector
- `z`: Z component of the vector
- `w`: W component of the vector

### Constructors

- `Vec4()`: creates a vector with values (0, 0, 0, 0)
- `Vec4(x, y, z, w)`: creates a vector with the values provided for the X, Y, Z, and W components

It is possible to perform mathematical operations with the Vec2, Vec3, and Vec4 structures, such as addition, subtraction, multiplication, and division. Furthermore, these structures can be used as arguments in several platform functions.


*Initially, we will start with the initial parameters of the update function.*

# UI Functions

## Function: `Begin()`

Description: The `Begin()` function is used to initiate a window with a title specified by the `title` parameter. Additionally, it is possible to define if the window should initially be opened or closed through the `open` parameter, with `true` for open and `false` for closed. It is important to remember that, when finishing the window, the `End()` function must be called to properly finalize the window.

### Parameters:

- `title`: a pointer to a string that represents the window's title.
- `open`: a boolean value that indicates if the window should be opened or closed.

### Return:

- A boolean value that indicates if the window was successfully initiated.

Example of use:

```lua
 if(menu) then
	menu = ui:Begin("My Window", menu);
	 
	ui:end()
 end
```

In this example, a window with the title "My Window" will be created and initially opened. The code to draw the window should be written inside the conditional block, and the `End()` function must be called at the end to finalize the window correctly.

## Function: `BeginChild()`

Description: The `BeginChild()` function initiates a new drawing space in a window or within another drawing space. This space is delimited by an optional border and has a size specified by a two-dimensional vector.

### Arguments:

- `name`: a pointer to a character that represents the name of the drawing space. It must be unique within the immediate parent.
- `size`: a two-dimensional vector that defines the width and height of the drawing space.
- `border`: a boolean value that defines if the drawing space will have a border or not.

### Return
## Function: `Button()`

The `Button` function is responsible for rendering an interactive button within a window or user interface element.

### Arguments:
-   `name`: A string that represents the text to be displayed inside the button.

### Return:
-   Returns `true` if the button was pressed, otherwise returns `false`.

```lua
if(menu) then
    menu = ui:Begin("My Window", menu);
    if (ui:BeginChild("My Child", Vec2(15, 100), true)) then
        ui:Text("This is my child window"); 
        ui::EndChild();
    end
    if(ui:Button("Click"))then
        ui:Text("Good work!");
    end
    ui:end()
end
```

## Function: `CheckBox()`

The `CheckBox` function is used to create a checkbox component with a label and a boolean state. The state is represented by a checkbox that can be checked or unchecked by the user.

### Parameters:
-   `title`: A constant string representing the label that appears next to the checkbox.
-   `enable`: A boolean value representing the current state of the checkbox. If `true`, the checkbox will be checked. If `false`, the checkbox will be unchecked.

### Return:
-   `true`: If the checkbox is checked.
-   `false`: If the checkbox is unchecked.

```lua
enable = ui:CheckBox("Enable", enable);
if(enable)then
    -- something you need to do if it's enabled
end;
```

## Function: `Text()`

The `Text` function displays text on the screen within the window.

### Arguments:
-   `text`: A pointer to a character string containing the text to be displayed.

### Return:
-   The function does not return any value.

Example:
```lua
ui:Text("Hello world");
```

## Function ``SliderInt()``

The ``SliderInt`` function creates a draggable bar with an integer number.

### Arguments:

-   ``label:`` a pointer to a character string containing the label of the control.
-   ``val:`` an integer containing the current value of the control. This value will be modified by the user.
-   ``min:`` an integer containing the minimum allowed value for the control.
-   ``max:`` an integer containing the maximum allowed value for the control.

### Return:
The function returns the value selected by the user.

Example
```lua
value = ui::SliderInt("Value:", value, 0, 100);
```

## Function ``Separator()``

The ``Separator`` function draws a horizontal line to separate elements.

### Arguments: 
The function does not receive any arguments.

### Return: 
The function does not return any value.

Example:
```lua
ui:Text("Element 1");
ui:Separator();
ui:Text("Element 2");
```

## Function ``NewLine()``

The ``NewLine`` function creates a vertical space between elements.

### Arguments: 
The function does not receive any arguments.

### Return: 
The function does not return any value.

Example:
```lua
ui:Text("Element 1");
ui:NewLine();
ui:Text("Element 2");
```

## Function ``ListBox()``

The `ListBox()` function creates a list of selectable items.

### Arguments:

-   `label`: a pointer to a string containing the label of the control.
-   `list`: a reference to the list object containing the items to be displayed in the list.
-   `index`: an integer index containing the index of the selected item in the list.

### Return: 
The function returns the index of the item selected by the user.

Example:
```lua
	local list = {};
	table.insert(list,"Obj1");
	table.insert(list,"Obj2");
	table.insert(list,"Obj3");
	table.insert(list,"Obj4");
	index = ui:ListBox("List of items", list, index);
```

## Function ``ComboBox()`` 

The `ComboBox()` function creates a drop-down menu with selectable items.

### Arguments:

-   `label`: a pointer to a string containing the label of the control.
-   `list`: a reference to the list object containing the items to be displayed in the menu.
-   `index`: an integer index containing the index of the selected item in the menu.

### Return: 
The function returns the index of the item selected by the user.

Example:
```lua
	local list = {};
	table.insert(list,"Obj1");
	table.insert(list,"Obj2");
	table.insert(list,"Obj3");
	table.insert(list,"Obj4");
	index = ui:ComboBox("List of items", list, index);
```

# Functions ``Draw``


## Function ``DrawCicle``

The ``DrawCircle`` function is responsible for drawing a circle on the platform's graphical interface. 
It takes five parameters:

## Parameters:
-   `center`: an object of the "Vec2" class that represents the center of the circle to be drawn.
-   `radius`: a float value that represents the radius of the circle to be drawn.
-   `numPoints`: an integer value that represents the number of points to be used to draw the circle. The higher the value, the smoother the curvature of the circle.
-   `thickness`: a float value that represents the thickness of the line used to draw the circle.
-   `color`: an object of the "Vec4" class that represents the color used to draw the circle. The color is defined by the RGBA values (red, green, blue, alpha).

This function is useful for drawing circular objects.
Example:

```lua
-- Creates a 2D vector with the position of the circle center
local center = Vec2(100, 100)

-- Defines the radius of the circle
local radius = 50

-- Defines the number of points of the circle
local numPoints = 30

-- Defines the thickness of the circle line
local thickness = 2.0

-- Creates a RGBA vector with the circle color (red)
local color = Vec4(1, 0, 0, 1)

-- Calls the DrawCircle function to draw the circle
draw:DrawCircle(center, radius, numPoints, thickness, color)
```

## Function ``DrawCircleFilled``

The `DrawCircleFilled` function is quite similar to `DrawCircle`, except that the circle is filled instead of being drawn with just a line. It takes the same parameters as the `DrawCircle` function, except for the `thickness` parameter.

## Parameters:
-   `center`: an object of the "Vec2" class that represents the center of the circle to be drawn.
-   `radius`: a float value that represents the radius of the circle to be drawn.
-   `numPoints`: an integer value that represents the number of points to be used to draw the circle. The higher the value, the smoother the curvature of the circle.
-   `color`: an object of the "Vec4" class that represents the color used to fill the circle. The color is defined by the RGBA values (red, green, blue, alpha).

This function is useful for drawing filled circular objects.
Example:

```lua
-- Creates a 2D vector with the position of the circle center
local center = Vec2(100, 100)

-- Defines the radius of the circle
local radius = 50

-- Defines the number of points of the circle
local numPoints = 30

-- Creates a RGBA vector with the circle fill color (blue)
local fillColor = Vec4(0, 0, 1, 1)

-- Calls the DrawCircleFilled function to draw the filled circle
draw:DrawCircleFilled(center, radius, numPoints, fillColor)
```

## Function `DrawCircle3D()`

Draws a circle on the plane at the position of the specified object. The color of the circle can be set using an RGBA vector. Text can be added as an optional parameter.

### Parameters:
- `Obj`: The object that defines the position of the circle on the plane.
- `color`: An RGBA vector that defines the color of the circle.
- `txt`: A text that can be added to the circle.

Example usage:
```lua
local GameOBJ = plataform:GetPlayer();
local color = Vec4(0.5, 0.5, 0.5, 1); -- gray
local txt = "Example text"

draw:DrawCircle3D(GameOBJ, color, txt);
```

## Function `DrawText`:

Draws text at the specified position `pos`, using the specified color `color` and the text to be displayed `text`.

### Parameters:
- `pos` (Vec2): the position where the text will be drawn.
- `text` (const char*): the text to be displayed.
- `color` (Vec4): the color of the text.

Example usage:
```lua
local text = "Hello, world!"
local color = Vec4(1, 1, 1, 1);
draw:DrawTextA(Vec2(100,100), text, color);
```

## Function `DrawButton`

The `DrawButton` function draws a button on the screen, at the position specified by `p`, with the text `text`, the background color `colorButton`, the text color `colorText` and the rounding of the button corners defined by `rounding`.

### Parameters:
- `p`: a 2-dimensional vector (x, y) representing the position of the button on the screen.
- `text`: a string representing the text displayed inside the button.
- `colorButton`: a 4-dimensional vector (r, g, b, a) representing the background color of the button. The values of `r`, `g`, `b`, and `a` range from 0 to 1, where 0 means the color is completely absent and 1 means the color is fully present.
- `colorText`: a 4-dimensional vector (r, g, b, a) representing the color of the text inside the button. The values of `r`, `g`, `b`, and `a` range from 0 to 1, where 0 means the color is completely absent and 1 means the color is fully present.
- `rounding`: a value representing the rounding of the button corners. The higher the value, the more rounded the corners. If the value is 0, the button will have straight corners.

Example usage:
````lua
local pos = Vec2(100.0, 100.0);
local text = "I look like a button!";
local colorButton = Vec4(0.2, 0.4, 0.6, 1.0);
local colorText = Vec4(1.0, 1.0, 1.0, 1.0);
local rounding = 5;
draw:DrawButton(pos, text, colorButton, colorText, rounding)
````
## Function `DrawRect()`

The `DrawRect` function is responsible for drawing a rectangle on the graphical interface of the platform. It receives four parameters:

## Parameters:
- `box`: an object of the "Vec4" class that represents the coordinates of the rectangle to be drawn. The object has the following information: (x, y, width, height), where (x, y) is the initial position of the rectangle, and (width, height) are its dimensions.
- `color`: an object of the "Vec4" class that represents the color used to fill the rectangle. The color is defined by the RGBA values (red, green, blue, alpha).
- `rounding`: a float value that represents the amount of rounding of the rectangle's edges. The higher the value, the more rounded the rectangle will be.
- `thickness`: a float value that represents the thickness of the line used to draw the rectangle's edges.

This function is useful for drawing rectangular objects.
Example:
```lua
-- Creates a 4D vector with the coordinates of the rectangle
local box = Vec4(100, 100, 200, 150)

-- Creates an RGBA vector with the color of the rectangle (green)
local color = Vec4(0, 1, 0, 1)

-- Defines the amount of rounding of the rectangle's edges
local rounding = 10.0

-- Defines the thickness of the rectangle's line
local thickness = 2.0

-- Calls the DrawRect function to draw the rectangle
draw:DrawRect(box, color, rounding, thickness)
```

## Function `DrawRectFilled()`
The `DrawRectFilled` function is responsible for drawing a filled rectangle on the platform's graphical interface. It receives three parameters:

## Parameters:
-   `box`: an object of the "Vec4" class that represents the rectangle to be drawn. The four values of the vector represent respectively the x and y coordinates of the upper-left corner of the rectangle, followed by the x and y coordinates of the lower-right corner of the rectangle.
-   `color`: an object of the "Vec4" class that represents the color used to fill the rectangle. The color is defined by the RGBA values (red, green, blue, alpha).
-   `rounding`: a float value that represents the rounding of the rectangle's corners.

This function is useful for drawing filled rectangular objects.

Example:
```lua
-- Creates a 4D vector with the rectangle's coordinates (upper-left corner, lower-right corner)
local box = Vec4(100, 100, 200, 200)

-- Creates a RGBA vector with the rectangle's color (red)
local color = Vec4(1, 0, 0, 1)

-- Defines the rounding of the rectangle's corners
local rounding = 10

-- Calls the DrawRectFilled function to draw the filled rectangle
draw:DrawRectFilled(box, color, rounding)
```

# Functions ``platform``

The "platform" parameter of the "update" function is an argument that serves to call a series of Lua module-exported functions. These functions can be used to access information about the game and control the behavior of the running script.

The functions included in the "platform" module are:

- "GetHeroList": returns a list of heroes present in the game;
- "GetTurretList": returns a list of turrets present in the game;
- "GetMinionsList": returns a list of minions present in the game;
- "GetPlayer": returns information about the running player;
- "MouseClick": simulates a mouse click at a specific position;
- "GetAsynKeyState": returns the asynchronous state of a specific key;
- "isKeyPress": returns true if the specified key is pressed;
- "isKeyDown": returns true if the specified key is in the "down" state;
- "GetTick": returns the script's runtime;
- "GetListCount": returns the number of elements in a list;
- "ClickOrder": sends a click command to the game;
- "IsForeground": returns true if the game is in the foreground;
- "GetGameTick": returns the current game time;
- "Wait": pauses the script's execution for a certain amount of time;
- "PressVK": simulates pressing a specific key;
- "SetPos": sets the position of a Windows window;
- "SetMousePos": sets the position of the mouse cursor;
- "GetPos": returns the current position of a Windows window;
- "W2S": converts game world coordinates to screen coordinates;
- "PrintToLog": prints a message to the script's log.

Each of these functions can be used to perform different tasks and control the behavior of the running script.

## Function ``GetHeroList``

The function ``GetHeroList`` returns a list of objects of type "MyObj" that represent the objects present in the game.

### Syntax

```lua
GetHeroList()
```

### Return

The function returns a list of objects of type "MyObj", where each object represents a hero present in the game.

### Example usage

```lua
local heroes = plataform:GetHeroList()

for _, hero in pairs(heroes) do
   ui:Text(hero.GetName());
end
```

In this example, the function "GetHeroList" is called and returns a list of "MyObj" objects. Then, a "for" loop is used to iterate over each object in the list and print the name of the hero.



---

## Function ``GetTurretList``

The function ``GetTurretList`` returns a list of objects of type "MyObj" that represent the turrets present in the game.

### Syntax

```lua
function GetTurretList()
```

### Return

The function returns a list of objects of type "MyObj", where each object represents a turret present in the game.

### Example usage

```lua
local turrets = plataform:GetTurretList()

for _, turret in pairs(turrets) do
    ui:Text(turret.GetName());
end
```

## Function ``GetHeroList``

The function "GetHeroList" returns a list of objects of type "MyObj" that represent the heroes present in the match.

### Syntax

```lua
GetHeroList()
```

### Return

The function returns a list of objects of type "MyObj", where each object represents a hero present in the match.

### Usage example

```lua
local heroes = plataform:GetHeroList()

for _, hero in pairs(heroes) do
   ui:Text(hero.GetName());
end
```

In this example, the "GetHeroList" function is called and returns a list of "MyObj" objects. Then, a "for" loop is used to iterate over each object in the list and print the name of the hero.

---

## Function ``GetTurretList``

The function "GetTurretList" returns a list of objects of type "MyObj" that represent the turrets present in the match.

### Syntax

```lua
function GetTurretList()
```

### Return

The function returns a list of objects of type "MyObj", where each object represents a turret present in the match.

### Usage example

```lua
local turrets = plataform:GetTurretList()

for _, turret in pairs(turrets) do
    ui:Text(turret.GetName());
end
```

In this example, the "GetTurretList" function is called using the "plataform" object and returns a list of "MyObj" objects. Then, a "for" loop is used to iterate over each object in the list and print the name of the turret in the interface.

---

## Function ``GetMinionsList``

The function "GetMinionsList" returns a list of objects of type "MyObj" that represent the minions present in the match.

### Syntax

```lua
function GetMinionsList()
```

### Return

The function returns a list of objects of type "MyObj", where each object represents a minion present in the match.

### Usage example

```lua
local minions = plataform:GetMinionsList()

for _, minion in pairs(minions) do
    ui:Text(minion.GetName())
end
```

In this example, the "GetMinionsList" function is called using the "plataform" object and returns a list of "MyObj" objects. Then, a "for" loop is used to iterate over each object in the list and print the name of the minion in the console.

---

## Function ``GetPlayer``

The function "GetPlayer" returns an object of type "MyObj" that represents the running player.

### Syntax

```lua
function GetPlayer()
```

### Return

The function returns an object of type "MyObj" that represents the running player.

### Usage example

```lua
local player = plataform:GetPlayer()

ui:Text(player.GetName()).
```

In this example, the "GetPlayer" function is called using the "plataform" object and returns a "MyObj" object. Then, the name of the player is printed in the interface using the "GetName" property of the "MyObj" object.

## Function ``MouseClick``

The "MouseClick" function clicks the current position of the mouse cursor.

### Syntax

```lua
function MouseClick(leftClick, delay)
```

### Arguments

- `leftClick`: A boolean value indicating whether the left mouse button will be clicked. If it's set to "true", the left button will be clicked. If it's set to "false", the right button will be clicked.

- `delay`: The time in milliseconds that the mouse button will be held down before being released.

### Return

This function does not return anything.

### Usage Example

```lua
-- Click the left mouse button with a 500 millisecond delay
plataform:MouseClick(true, 500)
```

In this example, the "MouseClick" function is called using the "plataform" object with the argument "true", which means that the left mouse button will be clicked. The "500" argument indicates that there will be a 500 millisecond delay before releasing the mouse button.

---
## Function ``GetAsynKeyState``

The "GetAsynKeyState" function returns the asynchronous state of the specified key.

### Syntax

```lua
function GetAsynKeyState(key)
```

### Arguments

- `key`: The numeric value of the key code for which to check the state.

### Return

The return value is a boolean that represents whether the key is pressed or not.

### Usage Example

```lua
-- Check if the "A" key is being pressed
if (plataform:GetAsynKeyState(65)) then
    ui:Text("A is pressed")
end
```

## Function ``isKeyPress``

The "isKeyPress" function checks if the specified key is currently being pressed.

### Syntax

```lua
function isKeyPress(key)
```

### Arguments

- `key`: The numeric value of the key code to check the status for.

### Return

Returns `true` if the specified key is being pressed, otherwise returns `false`.

### Usage Example

```lua
-- Check if the "A" key is being pressed
if plataform:isKeyPress(65) then
    ui:Text("A is pressed")
end
```

In this example, the "isKeyPress" function is called using the "plataform" object with the argument "65", which corresponds to the code for the "A" key. If the "A" key is being pressed, the message "A is pressed" will be printed to the console.

---

## Function ``isKeyDown``

The "isKeyDown" function checks if the specified key is currently being pressed.

### Syntax

```lua
function isKeyDown(key)
```

### Arguments

- `key`: The numeric value of the key code to check the status for.

### Return

Returns `true` if the specified key is being pressed, otherwise returns `false`.

### Usage Example

```lua
-- Check if the "A" key is being pressed
if (plataform:isKeyDown(65)) then
    ui:Text("A was pressed")
end
``` 
___
## Function ``GetTick()`` 
Returns the current system time in milliseconds. 

### Arguments
This function does not take any arguments.

### Return
- `number`: a number representing the current system time in milliseconds.


### Example usage

```lua
local tickSystem = platform:GetTick();
```

---

## Functions ``IsLolForeground()``

Checks if the game window is in the foreground.

### Arguments
This function does not take any arguments.

### Return
- `boolean`: `true` if the game window is in the foreground, `false` otherwise.

## Functions ``GetListCount(list)``

Returns the number of elements in a list.

#### Arguments

- `list` (table): The list to be checked.

#### Return

- `number`: The number of elements in the list.

---

## Functions ``ClickOrder(x, y, order)``

Sends a mouse click to a specific point on the screen.

#### Arguments

- `x` (number): The X coordinate of the point where the click will be sent.
- `y` (number): The Y coordinate of the point where the click will be sent.
- `order` (boolean): The type of click to be sent. It must be one of the following options:
  - `"true"`: left mouse button click.
  - `"false"`: right mouse button click.


#### Return

This function does not return any value.

---

## Functions ``GetGameTick()``

Returns the current game time in milliseconds.

#### Arguments

This function does not receive any arguments.

#### Return

- `number`: A number representing the current game time in milliseconds.

---

## Functions ``Wait(ms)``

Makes the system wait for the desired time in milliseconds.

#### Arguments

- `time` (number): The time in milliseconds that the function should wait before continuing execution.

#### Returns

This function does not return any value.

#### Example usage

```lua
-- Wait for 1 second before continuing execution
plataform:Wait(1000)
```

---

## Functions ``PressVK(key, delay)``

Presses a specified key and waits for a time before releasing it.

#### Arguments

- `vk` (number): The numerical value of the key to be pressed.
- `delay` (number): The time in milliseconds that the function should wait before releasing the key.

#### Returns

This function does not return any value.

#### Example usage

```lua
-- Presses the "A" key and waits for 500ms before releasing it
plataform:PressVK(65, 500)
```

___

## Function `SetPos`

Moves the mouse cursor to a specific 3D position in the game.

### Arguments

- `vec3` (table): a vec3 object containing the X, Y, and Z coordinates of the position to which the mouse cursor will be moved.

### Return value

This function does not return a value.

---

## Function `SetMousePos`

Sets the absolute position of the mouse cursor on the screen.

### Arguments

- `vec2` (table): a vec2 object containing the X and Y coordinates of the absolute position of the mouse cursor.

### Return value

This function does not return a value.

---

## Function `GetPos`

The `GetPos` function returns the current position of the mouse cursor in 2D coordinates.

### Syntax

```lua
function GetPos()
```

### Arguments

This function does not have any arguments.

### Return value

- `Vec2`: a `Vec2` object that contains the current X and Y coordinates of the mouse cursor.

### Example usage

```lua
-- Get the current position of the mouse cursor
local mousePos = plataform:GetPos()

-- Display the position in text
ui:Text(string.format("The current position of the mouse cursor is: %f, %f", mousePos.x, mousePos.y))
```

## Function ``W2S``

Converts a 3D position in the game world to a 2D position on the screen.

#### Arguments

- `position` (Vec3): a table containing the X, Y, and Z values of the 3D position in the game world.

#### Returns

- `Vec2`: a table containing the X and Y values of the 2D position on the screen.

#### Usage Example

```lua
-- Get the position of the local hero
local localHero = platform:GetLocalHero()
local heroPos = localHero:GetPos()

-- Convert the 3D position to a 2D position on the screen
local screenPos = platform:W2S(heroPos)

-- Print the position on the screen
ui:Text(string.format("Hero position on screen: %f, %f", screenPos.x, screenPos.y))
```

---

## Function ``PrintToLog``

The "PrintToLog" function sends a message to the game log.

### Syntax

```lua
function PrintToLog(message)
```

### Arguments

- `message` (string): the message to be sent to the game log.

### Returns

This function does not return any value.

### Usage Example

```lua
-- Send message to the log
platform:PrintToLog("Hello, world!")
```

## Class `GameEntry`

The `GameEntry` class represents an object that contains all the game object's call functions. Below is the documentation for the `GameEntry` object's function == MyObj:

___

## Function `GetTeam`

Returns the current team of the player controlled by the object.

### Syntax

```lua
function GameEntry:GetTeam()
```

### Return value

- `number`: the current player's team number. It can be `100` (blue) or `200` (red).

### Example usage

```lua
-- Check the current player's team
local team = MyObj:GetTeam()
if (team == 100) then
    ui:Text("The player is on the blue team.")
elseif (team == 200) then
    ui:Text("The player is on the red team.")
end
```
___

## Function `GetPosition`

The `GetPosition` function returns the object's three-dimensional position.

#### Syntax

```lua
function GameEntry:GetPosition()
```

#### Return value

- `Vec3`: a `Vec3` object containing the x, y, and z coordinates of the object's three-dimensional position.

#### Example usage

```lua
-- Get the player's position
local playerPosition = MyObj:GetPosition()
```
___

## Function `IsVisible()`

The `IsVisible` function checks if the object is visible on the screen.

#### Arguments

This function does not take any arguments.

#### Return

- `boolean`: `true` if the object is visible, `false` otherwise.

---

## Function `IsTargetable()`

The `IsTargetable` function checks if the object can be set as a target.

#### Arguments

This function does not take any arguments.

#### Return

- `boolean`: `true` if the object can be set as a target, `false` otherwise.

---

## Function `GetTeam()`

Returns the current player's team number.

- Arguments: none
- Return: `number` - the current player's team number. It can be `100` (blue) or `200` (red).

## Function `GetPosition()`

Returns the current 3D position of the player as a 3-component vector.

- Arguments: none
- Return: `Vec3` - the current 3D position of the player.

## Function `GetHP()`

Returns the current HP value of the player.

- Arguments: none
- Return: `number` - the current HP value of the player as a floating-point number.

## Function `GetMaxHP()`

Returns the maximum HP value of the character.

- Arguments: none
- Return: `number` - the maximum HP value of the character as a floating-point number.

## Function `GetDamage()`

Returns the damage value of the character.

- Arguments: none
- Return: `number` - the damage value of the character as a floating-point number.

## Function `GetRange()`

Returns the attack range of the character.

- Arguments: none
- Return: `number` - the attack range of the character as a floating-point number.

## Function `GetArmor()`

Returns the armor value of the character.

- Arguments: none
- Return: `number` - the armor value of the character as a floating-point number.

## Function `GetName()`

Returns the name of the character.

- Arguments: none
- Return: `string` - the name of the character as a string.

## Function `IsAlive()`

Returns a boolean value indicating whether the character is alive.

- Arguments: none
- Return: `boolean` - `true` if the character is alive, `false` otherwise.

## Function `GetLevel()`

Returns the level of the character.

- Arguments: none
- Return: `number` - the level of the character as an integer.

## Function `IsVisible()`

The `IsVisible` function checks if the character is visible on the screen.

- Arguments: none
- Return: `boolean` - `true` if the character is visible, `false` otherwise.

## Function `IsTargetable()`

The `IsTargetable` function checks if the character can be targeted.

- Arguments: none
- Return: `boolean` - `true` if the character can be targeted, `false` otherwise.

## Function `GetTeam()`

Returns the character's current team number.

- Arguments: none
- Return: `number` - the character's current team number. It can be `100` (blue) or `200` (red).

## Function `GetPosition()`

Returns the character's current 3D position as a 3-component vector.

- Arguments: none
- Return: `Vec3` - the character's current 3D position.

## Function ``GetArmorPenetration()``

Returns the character's armor penetration value.

- **Return**: `number` - the character's armor penetration value.

---

## Function ``GetBonusAttack()``

Returns the character's bonus attack value.

- **Return**: `number` - the character's bonus attack value.

---

## Function ``GetAbilityPower()``

Returns the character's ability power value.

- **Return**: `number` - the character's ability power value.

---

## Function ``Initialized()``

Checks if the object was initialized correctly.

- **Return**: `boolean` - `true` if the object was initialized correctly, otherwise `false`.

---

## Function ``GetLethality()``

Returns the character's lethality value.

- **Return**: `number` - the character's lethality value.
___

## Function `DisTo(obj)`

Calculates the distance between the current object and another specified object.

#### Arguments

- `obj` (object): The object from which to get the distance.

#### Returns

- `number`: The distance in game units (float).

#### Example Usage

```lua
local distance = player:DisTo(OtherHero);
```
___

## Function `IsEnemy(obj)`

Checks if an object is an enemy.

#### Arguments

- `obj` (GameEntry): The object to be checked.

#### Returns

- `boolean`: `true` if the object is an enemy, `false` otherwise.

#### Example Usage

```lua
 if( player:IsEnemy(OtherHero) ) then
		-- CODE HERE
 end
```
___

## Function `GetBuffer`

Gets the list of buffers of the class (BufferEntry). This class represents each buffer session.

#### Returns

- List (table) of objects of the class BufferEntry.

___

`Q()`, `W()`, `E()`, `R()`, `F()`, and `D()`: Each of these functions returns an object of the class `Spell` corresponding to the ability associated with the corresponding key.

## Class `Spell`:

The `Spell` class represents a magical ability that a character can use in the game. This class contains the following properties and methods:

## Function ``GetTimer``

Returns the remaining cooldown time of the spell in seconds.

### Return value

-   `timer` (float): The remaining time in seconds until the spell can be used again.

---

## Function ``GetLevel``

The `GetLevel` function of the `Spell` class returns the level of the spell as an integer. It takes no arguments. Here is the detailed documentation:

```
GetLevel()
```

Returns the level of the spell as an integer.

**Return value:**
- `level` (int): The level of the spell.

---

## Function ``GetName``

This function takes no arguments.

**Return value:**
- `str`: Returns the name of the spell as a string. 

---

## Function ``GetDamage``

The `GetDamage` function of the `Spell` class returns the value of the physical damage of the spell as a floating-point number (`float`).

**Return value:**

-   `float`: The value of the physical damage of the spell.

## Class `Spell`:

The `Spell` class represents a magical ability that a character can use in the game. This class contains the following properties and methods:

## Function ``GetTimer``

Returns the remaining cooldown time of the spell in seconds.

### Return

-   `timer` (float): Remaining time in seconds until the spell can be used again.

___

## Function ``GetLevel``

The `GetLevel` function of the `Spell` class returns the level of the spell as an integer number. It takes no arguments. Here is the detailed documentation:

```
GetLevel()
```

Returns the level of the spell as an integer number.

**Return:**
- `level` (int): the level of the spell.

___

## Function ``GetName``

This function takes no arguments.

**Return:**
- `str`: Returns the name of the spell as a string. 
___

## Function ``GetDamage``

The `GetDamage` function of the `Spell` class returns the value of the spell's physical damage as a floating point number (`float`).

**Return:**

-   `float`: The value of the spell's physical damage.

___


## Function ``GetLetter``

The `GetLetter` function of the `Spell` class returns the letter of the spell.

**Return:**

-   `Char`: The letter of the spell.

___

## Function ``Cast``

The `Cast` function of the `Spell` class casts the spell by pressing the key.

**Return:**
The function has no return.

___


## Function `CastTrigger(trigger)`

Checks whether an object is an enemy.

#### Arguments

-   `trigger` (Boolean): Indicates whether to press or release the key.
			  `false` to release and `true` to press.

#### Return:
The function has no return.



## Class `BufferEntry`:

The `BufferEntry` class represents a magic effect that is applied to a character. It can be a buff (positive effect) or a debuff (negative effect). This class contains the following properties and methods:


### `GetName() -> str`

Returns the name of the buffer.

### `GetStart() -> float`

Returns the time at which the buffer started to be applied, in seconds since the start of the game.

### `GetCountAlt() -> float`

Returns the duration of the buffer in seconds.

### `GetCount() -> int`

Returns the accumulated amount of the buffer.

### `GetEnd() -> float`

Returns the time at which the buffer expires, in seconds since the start of the game.
