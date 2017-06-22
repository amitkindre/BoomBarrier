import QtQuick 2.7
//import QtQuick.Window 2.0
import QtQuick.Controls 1.4
//import QtQuick.Controls 2.0
//import "comp"
//import "loginScript.js"  as LoginEngine
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Components")

    Item {
          Timer {
              id: connectTimer
              interval: 3000; running: false; repeat: true
              onTriggered: {

                   if(tclient.getConnectStatus()){
                       connetIndicator.state = "connected";
                       console.log("Connected");
                   }
                   else{
                       connetIndicator.state = "disconnected";
                       console.log("disConnected");
                   }
              }
          }
      }


    function loginCheck() {loginEngine.loginCheck()}
    MyMenuBar{
        id: mainMenu
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0


    }


    ConnetIndicator {
        id: connetIndicator
        height: 10
        width: 640
        anchors.top: mainMenu.bottom
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    ControlPage {
        id: controlPage
        x: 195
        y: 115
        //x: 112
        // y: 97
        anchors.horizontalCenter: parent.horizontalCenter

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
        y: 240
        height: 0
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        visible: true

    }


    SideBar {
        id: sideBar
        z:1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        visible: false
        anchors.right: parent.right
        anchors.top: mainMenu.bottom
    }



}



