![license: MIT]( https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)
![twitter: @andrinbertschi](https://img.shields.io/badge/twitter-andrinbertschi-yellow.svg?style=flat-square) 

# sailfish-headless-keyboard-layout

The headless keyboard layout provides an alternative keyboard layout for
sailfish os. It aims to enable applications to insert any text into a
currently focused widget on the screen.

## Installation
- This project is still in development

# API

This is the reference document for the headless-keyboard layout.
This api describes the available functionality to control the keyboard layout.

If the keyboard layout is running,
it listens for text set to the system clipboard.
Commands in JSON format can be set to the clipboard
in order to access certain keyboard functionality.
The clipboard is cleared after a valid keyboard command was executed.

## Clipboard
In order to execute certain keyboard functionality,
the clipboard can contain one or more commands to execute
in the provided order. The clipboard shall contain the JSON
format listed below.

### One single command
```json
{ /*  command 1  */ }
```

### Multiple commands
```json
{
  cmds: [
    { /*  command 1  */ },
    { /*  command 2  */ },
    { /*  command 3  */ }
  ]
}
```

## Commands
The following commands are supported by the keyboard.

### Command 'set_label'
> Set a label shown in the statusbar of the keyboard layout.

```json
{
  "cmd": "set_label",
  "arg": "any text you want to use as label"
}
```

### Command 'insert_text'
> Insert text into currently focused widget

```json
{
  "cmd": "insert_text",
  "arg": "any text ..."
}
```

### Command 'key_backspace'
> Removes last character in currently focused widget.

```json
{
  "cmd": "key_backspace"
}
```

### Command 'key_return'
> Fires return key on currently focused widget

```json
{
  "cmd": "key_return"
}
```

## Projects that use headless-wlan-keyboard
- [sailfish-wlan-keyboard](https://github.com/abertschi/sailfish-wlan-keyboard):
 Use your computer keyboard to type on your phone.
