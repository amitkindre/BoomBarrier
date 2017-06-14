import QtQuick 2.7
//import QtQuick.Window 2.0
import QtQuick.Controls 1.4
//import QtQuick.Controls 2.0
//import "comp"
//import "loginScript.js"  as LoginEngine


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Components")

    function loginCheck() {loginEngine.loginCheck()}
    MyMenuBar{
        id: mainMenu
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
    }


    ControlPage {
        id: controlPage
        x: 195
        y: 115
        //x: 112
        // y: 97
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
    }

    /*

    SideBar{
        id: sideBar
        anchors.fill: parent
        visible: false
    }
*/

    LoginPage {
        id: loginPage
        x: 320
        y: 240
        //x: 320
        // y: 240
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
    }
}


