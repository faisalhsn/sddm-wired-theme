import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Qqc
import SddmComponents
import QtMultimedia

Rectangle {
    color: "black"
    width: Window.width
    height: Window.height

    AnimatedImage {
        anchors.fill: parent
        source: "bg.gif"
        fillMode: Image.PreserveAspectCrop
    }

    MediaPlayer {
        id: bgMusic
        source: "bg_music.mp3"
	audioOutput: AudioOutput {}
        autoPlay: true
        loops: MediaPlayer.Infinite
    }

    MediaPlayer {
        id: loginSound
        source: "login.wav"
        audioOutput: AudioOutput {}

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
                    sddm.login(username.text, password.text, 0)
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
                    sddm.login(username.text, password.text, 0)
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
                onClicked: sddm.login(username.text, password.text, 0)
            }
        }
    }
    Component.onCompleted: {
        loginSound.play()
        if (username.text == "") {
            username.focus = true
        } else {
            password.focus = true
        }
    }
}
