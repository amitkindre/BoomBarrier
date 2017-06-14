import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 200
    Rectangle {
        id: tag_sideBar
        width: 200
        color: "#2190b5"

        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 75

        Column {
            id: column
            spacing: 15
            anchors.fill: parent

            Rectangle {
                id: rectangle5
                height: 4
                anchors.left: parent.left
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffffff"
                    }

                    GradientStop {
                        position: 1
                        color: "#0e82a3"
                    }
                }
                anchors.rightMargin: 0
                anchors.right: parent.right
                anchors.leftMargin: 0
            }

            Text {
                id: text1
                height: 30
                text: qsTr("Text")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                font.pixelSize: 12
            }

            Rectangle {
                id: rectangle2
                height: 4
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffffff"
                    }

                    GradientStop {
                        position: 1
                        color: "#0e82a3"
                    }
                }
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            Text {
                id: text2
                height: 30
                text: qsTr("Text")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.rightMargin: 5
                anchors.right: parent.right
                anchors.leftMargin: 5
                font.pixelSize: 12
            }

            Rectangle {
                id: rectangle3
                height: 4
                anchors.left: parent.left
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffffff"
                    }

                    GradientStop {
                        position: 1
                        color: "#0e82a3"
                    }
                }
                anchors.rightMargin: 0
                anchors.right: parent.right
                anchors.leftMargin: 0
            }

            Text {
                id: text3
                height: 30
                text: qsTr("Text")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.rightMargin: 5
                anchors.right: parent.right
                anchors.leftMargin: 5
                font.pixelSize: 12
            }

            Rectangle {
                id: rectangle4
                height: 4
                anchors.left: parent.left
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#ffffff"
                    }

                    GradientStop {
                        position: 1
                        color: "#0e82a3"
                    }
                }
                anchors.rightMargin: 0
                anchors.right: parent.right
                anchors.leftMargin: 0
            }



        }
    }

}
