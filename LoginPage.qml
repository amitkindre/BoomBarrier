import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item {
    id: loginpage
    ColumnLayout {
        id: columnLayout
        width: 640
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        TextField {
            id: textField1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("User Name")
        }

        TextField {
            id: textField2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("Password")
        }

        TextField {
            id: textField3
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("SSID")
        }

        Rectangle {
            id: loginRect
            width: 200
            height: 60
            color: "#2869ce"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MouseArea {
                id: loginButton
                height: 60
                anchors.fill: parent
                onClicked: {
                    focus = true
                    loginPage.visible = false
                    controlPage.visible = true
                    tclient.connect();

                    //textField.getText();
                    tclient.logintoserver(textField1.text,textField2.text);
                    connectTimer.running = true;
                }
            }

            Label {
                id: label
                height: 60
                text: qsTr("Login")
                font.letterSpacing: 0
                padding: 2
                font.bold: true
                font.pointSize: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
            }
        }
    }
}
