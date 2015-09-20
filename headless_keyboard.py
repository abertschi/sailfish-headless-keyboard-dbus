#!/usr/bin/env python

import gi.repository.GObject as gobject

import dbus
import dbus.service
import dbus.mainloop.glib

class HeadlessKeyboardServer(dbus.service.Object):

    # methods

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='s', out_signature='')
    def send_text(self, text):
        print("keyboardlayout: send_text is called")
        self.receive_text(text) # text.decode('utf-8', 'ignore')

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

    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='b', out_signature='')
    def send_enable_debug(self, enable):
        self.receive_enable_debug(enable)


    # todo: new service for keyboard layout
    @dbus.service.method("ch.abertschi.keyboard.headless.Server", in_signature='s', out_signature='')
    def send_clipboard_set(self, content):
        self.receive_clipboard_changed(content)

    # signals

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_text(self, text):
        print("keyboardlayout: receive_text")
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
    def receive_enable_debug(self, enable):
        pass

    @dbus.service.signal("ch.abertschi.keyboard.headless.Server")
    def receive_clipboard_changed(self, content):
        pass


if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    session_bus = dbus.SessionBus()

    print("launching dbus service ch.abertschi.keyboard.headless")
    name = dbus.service.BusName("ch.abertschi.keyboard.headless", session_bus)
    server = HeadlessKeyboardServer(session_bus, '/')

    print("headless keyboard layout is ready for mainLoop")
    mainloop = gobject.MainLoop()
    mainloop.run()
    pass
