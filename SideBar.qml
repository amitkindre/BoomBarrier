import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Rectangle {
    id: rect1
    width: parent.width/2
    height: parent.height
    color: "#c05f5e60"
    radius: 3


    z: 1
    border.width: 3
    border.color: "#2869ce"

    ListView {
        id: listView
        x: 0
        width: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 20
        maximumFlickVelocity: 2500
        boundsBehavior: Flickable.DragOverBounds
        snapMode: ListView.NoSnap

        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 20
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
            }
        }

        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }




}
