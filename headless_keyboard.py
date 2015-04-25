import gi.repository.GObject as gobject

import dbus
import dbus.service
import dbus.mainloop.glib

class HeadlessKeyboardServer(dbus.service.Object):

    @dbus.service.method("harbour.headlesskeyboard.Server", in_signature='s', out_signature='')
    def send_text(self, text):
        print ("Inserting text %s" % (text))
        self.receive_text(text)

    @dbus.service.method("harbour.headlesskeyboard.Server", in_signature='', out_signature='')
    def exit(self):
        mainloop.quit()

     @dbus.service.method("harbour.headlesskeyboard.Server", in_signature='', out_signature='')
     def send_key_return(self):
         self.receive_key_return()

     @dbus.service.method("harbour.headlesskeyboard.Server", in_signature='', out_signature='')
     def send_key_del(self):
         self.receive_key_del()

     @dbus.service.method("harbour.headlesskeyboard.Server", in_signature='s', out_signature='')
     def send_key_arrow(self, direction):
         allowed = ['up', 'down', 'right', 'left']
         if not direction in allowed:
            print ("Unknown arrow direction %s" % (direction))
            return
         self.receive_key_arrow(direction)

     @dbus.service.signal("harbour.headlesskeyboard.Server")
     def receive_text(text):
         pass

     @dbus.service.signal("harbour.headlesskeyboard.Server")
     def receive_key_return():
         pass

     @dbus.service.signal("harbour.headlesskeyboard.Server")
     def receive_key_del():
         pass

     @dbus.service.signal("harbour.headlesskeyboard.Server")
     def receive_key_arrow(direction):
         pass

if __name__ == '__main__':
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)

    session_bus = dbus.SessionBus()
    # Bus name
    name = dbus.service.BusName("harbour.headlesskeyboard.Service", session_bus)
    # Object name or path
    server = HeadlessKeyboardServer(session_bus, '/')

    mainloop = gobject.MainLoop()
    print "Running example service."
    print usage
    mainloop.run()
