// The MIT License (MIT)
//
// Copyright (c) 2015 Andrin Bertschi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import org.nemomobile.dbus 2.0
import com.meego.maliitquick 1.0
import com.jolla.keyboard 1.0
import "../"

Item {
    property var db: null
    property bool enableDebug: getSetting("enable_debug", false)

    DBusInterface {
        id: dbusServer
        service: 'ch.abertschi.keyboard.headless'
        iface: 'ch.abertschi.keyboard.headless.Server'
        path: "/"
        signalsEnabled: true

        function receive_key_return() {
            debug("receive_key_return")
            MInputMethodQuick.sendKey(Qt.Key_Return, 0, "", Maliit.KeyClick)
        }

        function receive_key_del() {
            debug("receive_key_del")
            MInputMethodQuick.sendKey(Qt.Key_Backspace, 0, "\b", Maliit.KeyClick)
        }

        function receive_key_arrow(direction) {
            debug("receive_key_arrow: " + direction)

            switch(direction) {
            case "up":
                MInputMethodQuick.sendKey(Qt.Key_Up, 0, "", Maliit.KeyClick)
                break
            case "down":
                MInputMethodQuick.sendKey(Qt.Key_Down, 0, "", Maliit.KeyClick)
                break
            case "left":
                MInputMethodQuick.sendKey(Qt.Key_Left, 0, "", Maliit.KeyClick)
                break
            case "right":
                MInputMethodQuick.sendKey(Qt.Key_Right, 0, "", Maliit.KeyClick)
                break;
            default:
                break;
            }
        }
        function receive_text(text) {
            debug("receive_text " + text)
            MInputMethodQuick.sendCommit(text)
        }

        function receive_enable_debug(enable) {
            var key = "enable_debug"
            if (enable) {
                saveSetting(key, 1)
                enableDebug = true
            }else {
                saveSetting(key, 0)
                enableDebug = false
            }
        }
    }

    Connections {
        target: Clipboard
        onTextChanged: {
            if (Clipboard.hasText) {
                dbusServer.call("send_clipboard_set", [Clipboard.text]);
            }
        }
    }

    //debugging
    // Timer {
    //     id: timer
    //     running: true
    //     repeat: true
    //     interval: 1000
    //     onTriggered: {
    //         debug('timer triggered')
    //         enableDebug = false

    //         //MInputMethodQuick.sendCommit(".")
    //     }
    //     Component.onCompleted: timer.start()
    // }

    function debug(msg) {
        if (enableDebug) {
            console.log(msg)
            MInputMethodQuick.sendCommit('\rdebug: ' + msg + '\r')
        }
    }

    function openDB() {
        if (db !== null) return;
        db = LocalStorage.openDatabaseSync("headless-keyboard-dbus", "0.1", "headless keyboard layout", 100000);
        try {
            db.transaction(function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS settings(key TEXT UNIQUE, value TEXT)');
                var table = tx.executeSql("SELECT * FROM settings");
            });
        } catch (err) {
            MInputMethodQuick.sendCommit(err)
            return err;
        };
    }

    function saveSetting(key, value) {
        openDB();
        db.transaction(function(tx) {
            tx.executeSql('INSERT OR REPLACE INTO settings VALUES(?, ?)', [key, value]);
        });
    }

    function getSetting(key, defvalue) {
        openDB();
        var res = null;
        db.transaction(function(tx) {
            var rs = tx.executeSql('SELECT value FROM settings WHERE key=?;', [key]);
            if (rs.rows.length) {
                res = rs.rows.item(0).value
            }
        });
        return ((typeof(res) == 'undefined') || (res === null)) ? defvalue : res;
    }
}