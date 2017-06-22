import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    id: item1
    Rectangle{
        id: rectangle
        height: 20
        width: 640
        anchors.fill: parent
        //radius: 25
        border.color: "#b6aeae"

        color: "gray"
        border.width: 1

    }
    states: [
        State {
            name: "connected"

            PropertyChanges {
                target: rectangle
                color: "#c018c82c"
                border.width: 1
                border.color: "#b6aeae"
            }
        },
        State {
            name: "disconnected"
            PropertyChanges {
                target: rectangle
                color: "#c0c81818"
                border.color: "#cdc4c4"
                border.width: 1
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"
            PropertyAnimation { target: rectangle ; property: "color"; duration: 500 }
        }
    ]
}
