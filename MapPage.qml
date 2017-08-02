import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    id: item1
    property int i
    property int j
    GridView {
        id: gridtView
        width: parent.width/1.2
        height: parent.height/2
        anchors.verticalCenter: parent.verticalCenter

        contentHeight: 40
        contentWidth: 40

        anchors.horizontalCenter: parent.horizontalCenter
        cellHeight: 50
        cellWidth: 50
        snapMode: GridView.SnapToRow

        delegate: Item {
            x: 5
            width: 80
            height: 40

            Rectangle {
                width: 40
                height: 40
                color: colorCode
                opacity: btn.pressed ?  0.5 : 1
                Text {
                    id: name
                    anchors.centerIn: parent
                    text: number
                }
                MouseArea{
                    id: btn
                    anchors.fill: parent

                }
            }

        }
        model: ListModel {
             id: listModel
        }
    }

    Button {
        id: button1
        y: 366
        text: qsTr("Button")
        anchors.bottom: button2.top
        anchors.bottomMargin: 10
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            for(j=0;j<50;j++){
                i++
                addElement(1,i.toString())
            }
        }
    }
    Button {
        id: button2
        x: 270
        y: 412
        text: qsTr("Button")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        onClicked: {
            i++
            addElement(0,i.toString())
        }
    }

    function addElement(x,valx){
        if(x)
            listModel.append({"colorCode":"green", "number" : valx})
        else
            listModel.append({"colorCode":"red", "number" : valx})
    }
}

