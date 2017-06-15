import QtQuick 2.0
import QtQuick.Controls 2.1

Rectangle{
    id: rectangle5
    width: 250
    height: 400
    radius: 0

    Column {
        id: column
        height: 250
        anchors.bottomMargin: 0
        anchors.fill: parent
        spacing: 50

        Row {
            id: indicatorRow
            height: 70
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            spacing: 50

            Rectangle {
                id: rectangle2
                width: 50
                height: 50
                color: "#a40d0d"
                radius: 25
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                id: rectangle3
                width: 50
                height: 50
                color: "#1fb71f"
                radius: 25
                anchors.right: parent.right
                anchors.rightMargin: 25
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row {
            id: buttonRow
            height: 132
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            spacing: 10

            Rectangle {
                id: rectangle
                width: 100
                height: 100
                color: "#c91717"
                radius: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        tclient.closegate();
                        controlPage.state = "Close"
                    }
                }

                Text {
                    id: text1
                    width: 40
                    height: 40
                    text: qsTr("Close")
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle1
                width: 100
                height: 100
                color: "#25ca10"
                radius: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        tclient.opengate();
                        controlPage.state = "Open"
                    }
                }

                Text {
                    id: text2
                    width: 40
                    height: 40
                    text: qsTr("Open")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 12
                    anchors.verticalCenter: parent.verticalCenter
                }
                anchors.verticalCenter: parent.verticalCenter
            }
        }


    }

    Dial {
        id: dial
        height: 200
        stepSize: 5
        to: 1024
        anchors.rightMargin: 50
        anchors.leftMargin: 50
        anchors.bottomMargin: 150
        anchors.topMargin: 100
        anchors.fill: parent

        onValueChanged: {
            tclient.brightness(dial.value);
        }
    }


    states: [
        State {
            name: "Open"

            PropertyChanges {
                target: rectangle2
                color: "#50a40d0d"
            }
        },
        State {
            name: "Close"

            PropertyChanges {
                target: rectangle3
                color: "#501fb71f"
            }
        }
    ]

}
