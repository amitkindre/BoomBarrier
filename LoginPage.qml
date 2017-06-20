import QtQuick 2.6
//import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQml 2.2


import "loginScript.js"  as LoginEngine

Rectangle{
    id: rectangle1
    property alias operation: textField.text
    property alias textField: textField
    Column {
        id: column1
        x: 41
        y: 57
        width: 210
        height: 350
        spacing: 50
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Column {
            id: column
            width: 200
            height: 350
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            spacing: 20

            TextField {
                id: textField
                height: 50
                font.pixelSize: 15
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5


                placeholderText: qsTr("User Name")
            }

            TextField {
                id: textField1
                height: 50
                font.pixelSize: 15
                inputMask: ""
                echoMode: 2
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                placeholderText: qsTr("Password")

            }

            TextField {
                id: textField2
                height: 50
                font.pixelSize: 15
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 5
                placeholderText: qsTr("SSID")
            }

            Button {
                id: button
                text: qsTr("Button")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                     loginPage.visible = false
                     controlPage.visible = true

                }
            }
        }

        Rectangle {
            id: loginButton
            y: 250
            width: 200
            height: 50
            color: "#2869ce"
            radius: 5
            opacity: 1
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                id: loginButtonArea
                anchors.fill: parent


                onClicked:{
                    focus = true
                    controlPage.visible = true
                    loginPage.visible = false
                    //LoginEngine.loginCheck()
                    tclient.connect();

                    //textField.getText();
                    tclient.logintoserver(textField.text,textField1.text);
                }

            }

            Label {
                id: label
                text: qsTr("Login")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }



}
