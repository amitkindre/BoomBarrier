import QtQuick 2.7
//import QtQuick.Window 2.0
import QtQuick.Controls 1.4
//import QtQuick.Controls 2.0
//import "comp"
//import "loginScript.js"  as LoginEngine
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Components")

//    Item {
//          Timer {
//              id: connectTimer
//              interval: 500; running: false; repeat: true
//              onTriggered: {

//                   if(tclient.getConnectStatus()){
//                       //connetIndicator.state = "connected";
//                       //console.log("Connected");
//                   }
//                   else{
//                       connetIndicator.state = "outofreach";
//                       console.log("Out Of Reach");
//                   }
//              }
//          }
//      }


    function loginCheck() {loginEngine.loginCheck()}

    MyMenuBar{
        id: mainMenu
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        state: "noback"


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
        anchors.horizontalCenter: parent.horizontalCenter

        visible: false
    }


    LoginPage {
        id: loginPage
        y: 240
        height: 0
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        visible: false

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

    MessageDialog {
         id: messageDialog
         title: "Logout"
         text: "Confirm Logout?"

         onAccepted: {
             console.log("Logout")
             if(tclient.logoutuser())
             {
                 //Logut Sucess
                loginPage.visible = true
                controlPage.visible = false
                mainMenu.state = "noback"

                 connetIndicator.state = "disconnected"
             }
         }
         Component.onCompleted: visible = false
    }

    MapPage {
        id: mapPage
        anchors.fill: parent

     }


}



