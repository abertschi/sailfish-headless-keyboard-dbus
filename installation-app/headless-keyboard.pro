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


keyboard.files += ../custom_headless_keyboard.qml
keyboard.files += ../§custom_headless_keyboard.conf
keyboard.path = /usr/share/maliit/plugins/com/jolla/layouts

INSTALLS += keyboard

