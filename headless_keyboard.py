#!/usr/bin/env python
# -*- coding: utf-8 -*-

import gi.repository.GObject as gobject

import dbus
import dbus.service
import dbus.mainloop.glib

class HeadlessKeyboardServer(dbus.service.Object):

    # --------------------------
    # methods
    # --------------------------

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='s', out_signature='')
    def send_text(self, text):
        print ("Inserting text %s" % (text))
        self.receive_text(text)

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='', out_signature='')
    def exit(self):
        mainloop.quit()
        pass

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='', out_signature='')
    def send_key_return(self):
        self.receive_key_return()

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='', out_signature='')
    def send_key_del(self):
        self.receive_key_del()

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='s', out_signature='')
    def send_key_arrow(self, direction):
        allowed = ['up', 'down', 'right', 'left']
        if not direction in allowed:
            print ("Unknown arrow direction %s" % (direction))
            return
        self.receive_key_arrow(direction)

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='s', out_signature='')
    def send_keyboard_label(self, label):
        self.receive_keyboard_label(label)
        pass

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='b', out_signature='')
    def send_enable_debug(self, enable):
        self.receive_enable_debug(enable)

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='', out_signature='')
    def send_enable_keyboard(self):
        self.receive_enable_keyboard()

    # --------------------------
    # signals
    # --------------------------

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_text(self, text):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_key_return(self):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_key_del(self):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_key_arrow(self, direction):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_keyboard_label(self, text):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_enable_debug(self, enable):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_enable_keyboard(self):
        pass

if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    session_bus = dbus.SessionBus()
    # Bus name
    name = dbus.service.BusName("ch.abertschi.keyboard.headless", session_bus)
    # Object name or path
    server = HeadlessKeyboardServer(session_bus, '/')

    mainloop = gobject.MainLoop()
    print("Running example service.")
    mainloop.run()
    pass
