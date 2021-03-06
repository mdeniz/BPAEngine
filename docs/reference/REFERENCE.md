# BPAEngine API Reference

This is the API Reference for **Better Plymouth Animations Engine (BPAEngine)**. See the [README](https://github.com/BPAEngine/BPAEngine/blob/master/README.md) for more info.

Follow the links below to see each component of the BPAEngine:

+ [Namespace and Globals](#namespace-and-globals)
  * [Constants](#constants)
  * [Callbacks](#callbacks)

+ [Helpers](#helpers)
  * [Array](#array)
  * [Color](#color)
  * [Debug](#debug)
  * [String](#string)
  * [Window](#window)

+ [Basic](#basic)
  * [Object](#object)
  * [SpriteAnimation](#sprite_animation)
  * [Variator](#variator)
  * [World](#world)

+ [Actions](#actions)
  * [Action](#action)
  * [AnimationAction](#animation_action)
  * [MoveAction](#move_action)
  * [SpawnAction](#spawn_action)

+ [Objects](#objects)
  * [Background](#background)
  * [Box](#box)
  * [BulletedPassword](#bulleted_password)
  * [Dialog](#box)
  * [Dimmer](#box)
  * [MessageScroll](#box)
  * [PasswordDialog](#box)
  * [ProgressBar](#box)
  * [Spawner](#box)
  * [StaticImage](#box)
  * [Text](#box)

********

## Namespace and Globals

Every part of the engine is inside the namespace `BPAE`, there are some global stuff outside the engine like [boolean constants](#constants) and [helpers](#helpers).

### Constants

Plymouth doesn't provide a boolean type, so we define `TRUE` and `FALSE` values as constants (1 and 0 respectively).

Also some constants related to Z levels are defined:

```js
BPAE.TOP_Z = 10000;
BPAE.DIALOG_Z = 1000;
BPAE.BACKGROUND_Z = -10000;
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/00_Header/Z_Constants.script)

### Callbacks

Callbacks for Plymouth hooks are globaly defined, each calls the global defined `WORLD` with the proper method:

```js
Plymouth.SetBootProgressFunction() // Calls global.WORLD.Update(time, progress);
Plymouth.SetRefreshFunction() // Calls global.WORLD.Tick();
Plymouth.SetUpdateStatusFunction() // Calls global.WORLD.UpdateStatus(status);
Plymouth.SetMessageFunction() // Calls global.WORLD.ProcessMessage(message);
Plymouth.SetDisplayQuestionFunction() // Calls global.WORLD.DisplayQuestion(prompt, entry);
Plymouth.SetDisplayPasswordFunction() // Calls global.WORLD.AskPassword(prompt, bullets_size);
Plymouth.SetDisplayNormalFunction() // Calls global.WORLD.DisplayNormal();
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/05_Callbacks/Callbacks.script)

## Helpers

Helpers are just global classes with util methods in it.

[[View Source]](https://github.com/BPAEngine/BPAEngine/tree/master/lib/BPAEngine/01_Helpers)

### Array

Plymouth lacks of an Array class, it only defines a Hash type that can have sequential integer indexes. To manage hashes as arrays we define some basic methods.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script)

---

#### Array.Size

Calculates the length of an array based on sequential integer indexes.

###### Signature

```js
Array.Size(array) => Integer
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Size(my_array); // It returns 3
```
When the indexes are not sequentially added the method will return the longest sequence:
```js
my_array[0] = "a";
my_array[1] = "b";
my_array[8] = "c";
Array.Size(my_array); // It returns 2
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L6-L14)

---

##### Array.Add

Add the element given at the end of the array. Returns the changed array.

###### Signature

```js
Array.Add(array, element) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Add(my_array, 5); // It returns [3, 2, 6, 5]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L16-L20)

---

##### Array.Pop

Removes the element in the first position of the given array. Returns the element removed.

###### Signature

```js
Array.Pop(array) => Element
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Pop(my_array); // It returns 3 and my_array = [2, 6]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L22-L32)

---

##### Array.Push

Add the element given at the first position of the array. Returns the changed array.

###### Signature

```js
Array.Push(array, element) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Push(my_array, 5); // It returns [5, 3, 2, 6]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L34-L43)

---

##### Array.Join

Creates a string using the elements joined by `joint`.

###### Signature

```js
Array.Push(array, joint) => String
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = ["Hi", "my", "friend"];
Array.Push(my_array, ", "); // It returns "Hi, my, friend"
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L45-L53)

---

##### Array.Clear

Clears the passed array leaving it empty. Returns the empty array.

###### Signature

```js
Array.Clear(array) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [4, 6, 7];
Array.Clear(my_array); // It returns []
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### Color

This class holds all related methods for managing colors in BPAEngine.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Color.script)

---

##### Color.FromRGB

Creates the color from the given RGB color components. Returns the color array.

###### Signature

```js
Color.FromRGB(red, green, blue) => Array
```

###### Examples

Some basic colors:
```js
Color.FromRGB(255, 0, 0);     // RED: It returns [1, 0, 0]
Color.FromRGB(0, 255, 0);     // GREEN: It returns [0, 1, 0]
Color.FromRGB(0, 0, 255);     // BLUE: It returns [0, 0, 1]
Color.FromRGB(0, 0, 0);       // BLACK: It returns [0, 0, 0]
Color.FromRGB(255, 255, 255); // WHITE: It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.FromHex

Creates the color from the given hexadecimal string. Returns the color array.

###### Signature

```js
Color.FromHex(hex) => Array
```

###### Examples

Some basic colors:
```js
Color.FromRGB("#FF0000"); // RED: It returns [1, 0, 0]
Color.FromRGB("#00FF00"); // GREEN: It returns [0, 1, 0]
Color.FromRGB("#0000FF"); // BLUE: It returns [0, 0, 1]
Color.FromRGB("#000000"); // BLACK: It returns [0, 0, 0]
Color.FromRGB("#FFFFFF"); // WHITE: It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.Palette

It holds every color in hexadecimal format indexed by tags. Those colors and tags are defined at https://www.w3schools.com/colors/colors_hex.asp

###### Signature

```js
Color.Palette => Hash
Color.Palette[tag] => String
```

###### Examples

Some basic colors:
```js
Color.Palette["Black"] = "#000000";
Color.Palette["Navy"] = "#000080";
Color.Palette["DarkBlue"] = "#00008B";
Color.Palette["MediumBlue"] = "#0000CD";
Color.Palette["Blue"] = "#0000FF";
Color.Palette["DarkGreen"] = "#006400";
Color.Palette["Green"] = "#008000";
Color.Palette["Teal"] = "#008080";
```


[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.FromPalette

Creates the color from the given hexadecimal string `color` at the [Palette](#colorpalette). Returns the color array.

###### Signature

```js
Color.FromPalette(color) => Array
```

###### Examples

Some basic colors:
```js
Color.FromPalette("Red");   // It returns [1, 0, 0]
Color.FromPalette("Lime");  // It returns [0, 1, 0]
Color.FromPalette("Blue");  // It returns [0, 0, 1]
Color.FromPalette("Black"); // It returns [0, 0, 0]
Color.FromPalette("White"); // It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### Debug

Debug is just a global function that provides a way of showing information at the screen. Also it defines a `DEBUG` constant that enables/disables all the calls to Debug.

```js
DEBUG = FALSE; // By default all the debug logs are disabled
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Debug.script)

---

##### Debug

Shows the `text` given in the screen. If no `channel` is provided it just adds the text in the next line of the actual log text. If `channel` is an integer > 0 then the text will appear at `channel * 12` pixels from top.

###### Signatures

```js
Debug(text)
Debug(text, channel)
```

###### Examples

Showing the typical *"Hello World!"* string:
```js
hello = "Hello World!";
Debug(hello);     // It will add "Hello World!" to the end of the actual text shown
Debug(hello, 10); // It will print the text at Y=120
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### String

Plymouth comes with a basic set of methods to manage strings. We have added some helpful methods.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script)

---

#### String.Size

Calculates the length of the `string`.

###### Signature

```js
String.Size(string) => Integer
```

###### Examples

```js
hello = "Hello World!";
String.Size(hello); // It returns 12
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script#L6-L13)

---

#### String.Truncate

Shortens the `string` given to the `max` length passed. If the `string` is longer than `max`  then `...` will be added at the end.

###### Signature

```js
String.Truncate(string, max) => String
```

###### Examples

```js
hello = "Hello World!";
String.Truncate(hello, 20); // "Hello World!"
String.Truncate(hello, 10); // "Hello W..."
String.Truncate(hello, 12); // "Hello World!"
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script#L15-L24)

---

#### String.Bullets

Creates a string with a `number` number of `*`. This is helpful for showing password keystrokes.

###### Signature

```js
String.Bullets(number) => String
```

###### Examples

```js
String.Bullets(5); // "*****"
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script#L26-L34)

---

#### String.SplitByFixedSize

Splits the given `string` into an array in chunks of fixed length (`max`).

###### Signature

```js
String.SplitByFixedSize(string, max) => Array
```

###### Examples

```js
hello = "Hello World!";
String.SplitByFixedSize(hello, 4); // ["Hell", "o Wo", "rld!"]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script#L36-L48)

---

#### String.Multiline

Splits the given `string` in chunks of fixed length (`max`) and joins them into a multiline string (lines are ending with `\n`).

###### Signature

```js
String.Multiline(string, max) => String
```

###### Examples

```js
hello = "Hello World!";
String.Multiline(hello, 4); // "Hell\no Wo\nrld!"
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script#L50-L53)

---

### Window

Plymouth provides a Window class to ask for dimensions. GetWidth and GetHeight won't work properly if there are more than one screen.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Window.script)

---

#### Window.GetMaxWidth

Returns the width in pixels of the bigest screen device.

###### Signature

```js
Window.GetMaxWidth() => Integer
```

###### Examples

```js
Window.GetMaxWidth(); // It returns 800 (for example)
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Window.script#L1-L10)

---

#### Window.GetMaxHeight

Returns the height in pixels of the bigest screen device.

###### Signature

```js
Window.GetMaxHeight() => Integer
```

###### Examples

```js
Window.GetMaxHeight(); // It returns 600 (for example)
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Window.script#L12-L21)

---

## Basic

Here and the [Actions](#actions) we define the core classes for almost everything in the BPAEngine. The most important ones are [World](#world) and [Object](#bpaeobject) because they enable us to abstract of just running code that shows something in a screen to a living POO environment.

### BPAE.Object
This is the base class for every [objects](#objects) that lives in our [World](#world).

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/02_Basic/Object.script)

---

#### new BPAE.Object

Returns a new instance of BPAE.Object based on the `config` hash given.

###### Signature

```js
BPAE.Object(config) => BPAE.Object
```

###### Options

| Key         | Description                                 | Default Value   |
|:-----------:| ------------------------------------------- |:---------------:|
| id          | Id for the object                           | "id_{random}"   |
| x           | Horizontal coordinate                       | 0               |
| y           | Vertical coordinate                         | 0               |
| z           | Deep coordinate, for sorting layers (don't set it to 0) | 1   |
| width       | Horizontal dimension of the object          | 0               |
| height      | Vertical dimension of the object            | 0               |
| dx          | Horizontal displacement for the sprite      | 0               |
| dy          | Vertical displacement for the sprite        | 0               |
| theta       | Starting angle for image rotation in degrees | 0.0            |
| spin        | Image rotation step in degrees / s          | 0               |
| orientation | Angle of movement for x,y coordinates in degrees | 0.0        |
| speed       | Pixels / s that the object will move        | 0.0             |
| opacity     | Opacity applied to the image                | 1.0             |


// Anchors
anchors Named anchors to let align other objects to


###### Examples

```js
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/02_Basic/Object.script#L6-L60)

---
