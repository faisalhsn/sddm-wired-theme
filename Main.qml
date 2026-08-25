import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15 as Qqc
import SddmComponents 2.0
Rectangle {
    color: "black"
    width: Window.width
    height: Window.height
    Connections {
        target: sddm
    }
    ColumnLayout {
        AnimatedImage{
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 2
            Layout.preferredWidth: 500
            Layout.preferredHeight: 500
            source: "WiredLogin.gif"
        }
        width: parent.width
        height: parent.height
        Qqc.Label {
            Layout.alignment: Qt.AlignCenter
            text: "Ｕｓｅｒ ＩD : "
            color: "#c1b492"
            font.pixelSize: 16
        }
        Qqc.TextField {
            id: username
            Layout.alignment: Qt.AlignCenter
            text: userModel.lastUser
            horizontalAlignment: Text.AlignHCenter
            color: "#c1b492"
            background: Rectangle {
                color: "transparent"
                implicitWidth: 200
                border.color: "#c1b492"
            }
            KeyNavigation.backtab: shutdownBtn; KeyNavigation.tab: password
            Keys.onPressed: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    sddm.login(username.text, password.text, 0) // Use a default session index (0)
                    event.accepted = true
                }
            }
        }
        Qqc.Label {
            Layout.alignment: Qt.AlignCenter
            text: "Ｐａｓｓｗｏｒｄ："
            color: "#c1b492"
            font.pixelSize: 16
        }
        Qqc.TextField {
            id: password
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignCenter
            horizontalAlignment: Text.AlignHCenter
            color: "#c1b492"
            background: Rectangle {
                color: "transparent"
                implicitWidth: 200
                border.color: "#c1b492"
            }

            KeyNavigation.backtab: username; KeyNavigation.tab: null
            Keys.onPressed: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    sddm.login(username.text, password.text, 0) // Use a default session index (0)
                    event.accepted = true
                }
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 14
            Layout.bottomMargin: 50
            width: 100
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "#c1b492"
                radius: 30
            }
            Qqc.Label {
                Layout.alignment: Qt.AlignCenter
                text: "Ｌｏｇｉｎ"
                color: "#c1b492"
                font.pixelSize: 16
            }
            MouseArea {
                anchors.fill: parent
                onClicked: sddm.login(username.text, password.text, 0) // Use a default session index (0)
            }
        }
    }
    Component.onCompleted: {
        if (username.text == "") {
            username.focus = true
        } else {
            password.focus = true
        }
    }
}
