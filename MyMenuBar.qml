import QtQuick 2.0
import QtQuick.Controls 2.1

Rectangle{
    id: tag_menuBar
    width: 640
    height: 75
    Rectangle {
        id: rectangle
        width: 40
        height: 75
        color: "#2869ce"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        MouseArea {
            id: backButton
            width: 40
            height: 40

            //text: qsTr("Button")
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5

            onClicked: {
                messageDialog.visible = true
            }


            Image {
                id: backImage
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                source: "back.png"
            }
        }

        MouseArea{
            id: menuButton
            x: -4
            y: 2
            width: 40
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            //text: qsTr("Button")
            onClicked: {
                sideBar.visible = !sideBar.visible
            }


            Image {
                id: menuImage
                anchors.fill: parent
                source: "menu.png"
            }
        }
    }
    states: [
        State {
            name: "noback"

            PropertyChanges {
                target: backButton
                visible: false
            }
        },
        State {
            name: "nomenu"
            PropertyChanges {
                target: backButton
                visible: true
            }

            PropertyChanges {
                target: menuButton
                visible: false
            }
        },
        State {
            name: "allbutton"
        }
    ]

}
