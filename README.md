![license: MIT]( https://img.shields.io/badge/license-MIT-green.svg?style=flat-square)
![twitter: @andrinbertschi](https://img.shields.io/badge/twitter-andrinbertschi-yellow.svg?style=flat-square) 

# sailfish-headless extension 

This is the DBus based headless-keyboard extension for SailfishOS. 
If features a DBus service to enable applications to insert any text into a
currently focused widget on the phone screen.


## Changelog

- See [Changelog](https://github.com/abertschi/sailfish-headless-keyboard-dbus/blob/master/installation-app/rpm/headless-keyboard.changes.in)


## Installation
- See [Release Section](https://github.com/abertschi/sailfish-headless-keyboard-dbus/releases)

## API
- Bus service: ch.abertschi.keyboard.headless
- Bus type: Session Bus
- Bus if_name: ch.abertschi.keyboard.headless.Server
- Bus path: /

## Signals

### send_text
Insert text at cursor position.

- in_signature: s
- out_signature: -

### send_key_return
Enter a newline.

- in_signature: -
- out_signature: -

### send_key_del
Remove a character at cursor position.

- in_signature: -
- out_signature: -

### send_key_arrow
Change cursor.

- in_signature: s
  - ['up', 'down', 'right', 'left']

- out_signature: -


### exit
Kill the service 

- in_signature: -
- out_signature: -

### send_enable_debug
Enable debug mode

- in_signature: b
  - True if enable
- out_signature: -

## Slots

### receive_clipboard_changed
Clipboard was changed

- in_signature: s
- out_signature: -

  
## Projects that use headless-keybard
- [sailfish-wlan-keyboard](https://github.com/abertschi/sailfish-wlan-keyboard):
 Use your computer keyboard to type on your phone.
