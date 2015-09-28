import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + 2 * Theme.paddingLarge

        VerticalScrollDecorator {}

        RemorsePopup { id: remorse }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge * 1.2

            anchors {
                rightMargin: Theme.paddingLarge
                leftMargin: Theme.paddingLarge
                left: parent.left
                right: parent.right
            }

            PageHeader {
                id: header
                height: Theme.paddingLarge * 2
                title: qsTr("Headless Keyboard")
            }

            Label {
                anchors {
                    right: parent.right
                    rightMargin: Theme.paddingLarge
                }
                color: Theme.highlightColor
                font {
                    pixelSize: Theme.fontSizeSmall
                    family: Theme.fontFamilyHeading
                }
                text: root.version
            }

            Label {
                width: parent.width
                text: qsTr("Keyboard Extension that aims to enable applications to insert any text into focused widgets.")
                wrapMode: Text.Wrap
            }

//            Separator {
//                width:parent.width;
//                color: Theme.highlightColor
//            }

//            Label {
//                width: parent.width
//                text: qsTr("Restart your keyboard to activate this extension. If <i>Sailfish Utilities</i> are installed, go to <b>Settings</b> / <b>Utilities</b> / <b>Restart keyboard</b>, otherwise just restart your phone.")
//                wrapMode: Text.Wrap
//            }

            Separator {
                id: seperator
                width:parent.width;
                color: Theme.highlightColor
            }
            Label {
                width: parent.width
                text: qsTr("This is just an icon for easier deinstallation. You dont need to launch this app to use the keyboard.")
                wrapMode: Text.Wrap
            }

            Separator {
                width:parent.width;
                color: Theme.highlightColor
            }

            Label {
                width: parent.width
                text: qsTr("After a system update, this app may need to be reinstalled in order to continue working.")
                wrapMode: Text.Wrap
            }

            Separator {
                width:parent.width;
                color: Theme.highlightColor
            }

            Label {
                width: parent.width
                text: qsTr("This is Free and OpenSource Software that respects your privacy. Dig into the code on <a href='https://github.com/abertschi/sailfish-headless-keyboard-layout'>Github </a>.")
                wrapMode: Text.Wrap
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        remorse.execute("Browsing source code ", function() { Qt.openUrlExternally("https://github.com/abertschi/sailfish-headless-keyboard-layout"); } )
                    }
                }
            }

            Separator {
                width:parent.width;
                color: Theme.highlightColor
            }

            Label {
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("This app is powered by your donation. If you like my app, buy me a coffee.")
                wrapMode: Text.Wrap
            }

            Button {
                text: qsTr("Donate")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VYXMGXRV7QPW2");
                }
            }

            Label {
                width: parent.width
                text: "Andrin Bertschi"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                color: Theme.highlightColor
                height: Theme.paddingSmall
                font {
                    pixelSize: Theme.fontSizeSmall
                    family: Theme.fontFamilyHeading
                }
            }
            Label {
                width: parent.width
                text: "sailfish@abertschi.ch"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                color: Theme.highlightColor
                height: Theme.paddingSmall
                font {
                    pixelSize: Theme.fontSizeSmall
                    family: Theme.fontFamilyHeading
                }
            }
            Label {
                width: parent.width
                text: "twitter: @andrinbertschi"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                color: Theme.highlightColor
                height: Theme.paddingSmall
                font {
                    pixelSize: Theme.fontSizeSmall
                    family: Theme.fontFamilyHeading
                }
            }
        }
    }
}


