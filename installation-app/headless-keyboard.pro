TARGET = headless-keyboard

CONFIG += sailfishapp

SOURCES += src/headless-keyboard.cpp

OTHER_FILES += qml/headless-keyboard.qml \
    qml/Cover.qml \
    qml/About.qml \
    rpm/headless-keyboard.changes.in \
    rpm/headless-keyboard.spec \
    rpm/headless-keyboard.yaml \
    translations/*.ts \
    headless-keyboard.big.png \
    headless-keyboard.desktop \
    ../custom_headless_keyboard.qml \
    ../§custom_headless_keyboard.conf \
    ../headless-keyboard.service \
    ../headless_keyboard.py


# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/headless-keyboard-de.ts

#QMAKE_INSTALL_FILE = install -m 6755 -p -o root -g root
QMAKE_INSTALL_PROGRAM = install -m 6755 -p -o root -g root

keyboard.files += ../custom_headless_keyboard.qml
keyboard.files += ../§custom_headless_keyboard.conf
keyboard.path = /usr/share/maliit/plugins/com/jolla/layouts

# dbus service
service.files += ../headless-keyboard.service
service.path = /usr/share/dbus-1/services/


unix {
    dbus_server.path = /usr/bin/
    dbus_server.files += ../headless_keyboard.py
    INSTALLS += dbus_server
}



INSTALLS += keyboard
INSTALLS += service

