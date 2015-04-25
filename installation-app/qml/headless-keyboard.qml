import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow
{
    id: root
    property string version: "v0.1"
    initialPage: Component { About { } }
    cover: Qt.resolvedUrl("Cover.qml")
}


