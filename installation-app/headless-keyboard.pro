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
    ../headless-keyboard.service \
    ../headless_keyboard.py \
    ../HeadlessKeyboard.qml


# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/headless-keyboard-de.ts

#QMAKE_INSTALL_FILE = install -m 6755 -p -o root -g root
QMAKE_INSTALL_PROGRAM = install -m 6755 -p -o root -g root

keyboard.files += ../HeadlessKeyboard.qml
keyboard.files += ../KeyboardBase.patch
keyboard.path = /usr/share/maliit/plugins/com/jolla/custom_headless

# dbus service
service.files += ../headless-keyboard.service
service.path = /usr/share/dbus-1/services/

dbus_server.path = /usr/bin/
dbus_server.files += ../headless_keyboard.py

INSTALLS += dbus_server
INSTALLS += keyboard
INSTALLS += service

unix {
    # get rid of mac osx DS_Store files
    system(find $$PWD -name ".DS_Store" -depth -exec rm {} \;)
}


