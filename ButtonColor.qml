import QtQuick 2.0

Rectangle{

    property int height: ht
    property int width: wdt
    property int radius: rds
    property string color: clr
    property string text: txt

    id: buttonColor

    height: buttonColor.ht
    width: buttonColor.wdt

    color: buttonColor.clr

    radius: buttonColor.rds



    Text {
        id: text1
        x: 0
        y: 0
        width: 40
        height: 30
        text: qsTr(buttonColor.txt)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12
    }

}
