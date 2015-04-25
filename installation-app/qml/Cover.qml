import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    Image {
        id: image
        anchors.fill: parent
        anchors.leftMargin: Theme.paddingLarge
        anchors.rightMargin: Theme.paddingLarge
        fillMode: Image.PreserveAspectFit
        opacity: 1
        source: "headless-keyboard.big.png"
    }
}


