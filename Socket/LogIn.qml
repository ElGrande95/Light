import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import LogIn 1.0
import "Components"

Page {

    id: page1

    ItemLogIn {
        id: login
    }

    Item {

        anchors.fill: parent

        Keys.forwardTo: [topItem, myUsernameEdit, myPasswordEdit]

        Rectangle {
            id: topItem
            anchors.fill: parent
            color: "lightblue"

            Keys.onPressed: {
                if ( event.key === Qt.Key_Return )  {
                    if(login.tryLogIn(myUsernameEdit.myText, myPasswordEdit.myText)
                            && stack.busy === false && stack.depth === 1) {

                        myPasswordEdit.myText = ""
                        stack.push("qrc:/socket.qml", { nUsername: myUsernameEdit.myText})

                    }
                    else {
                        errorLabel.text = "Not matching username and password!"
                    }

                    event.accepted = true
                }
                else if ( event.key === Qt.Key_Tab )  {
                    if(myUsernameEdit.focusTextEdit === true){
                        myUsernameEdit.focusTextEdit = false
                        myPasswordEdit.focusTextEdit = true
                    }
                    else if (myPasswordEdit.focusTextEdit === true){
                        myPasswordEdit.focusTextEdit = false
                        myUsernameEdit.focusTextEdit = true
                    }
                    event.accepted = true
                }
            }
        }

        Image {
            x:40
            source: "/imgs/Images/icons8-login-100.png"
            smooth: true
            anchors.verticalCenter: topItem.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(login.tryLogIn(myUsernameEdit.myText, myPasswordEdit.myText)
                            && stack.busy === false && stack.depth === 1)
                        stack.push("qrc:/socket.qml", { nUsername: myUsernameEdit.myText})
                }
            }
        }

        Text {
            x: 160; y:80
            text: "Username:"
            font.pixelSize: 23
        }

        Text {
            x: 160; y:125
            text: "Password:"
            font.pixelSize: 23
        }

        MyTextEdit{
            id: myUsernameEdit
            x:280; y:80
            focusTextEdit: true
            setPriority: keyPriority

            onMyTextChanged: errorLabel.text = ""
        }

        MyTextEdit{
            id: myPasswordEdit
            x:280; y:125
            setPriority: keyPriority
            password: true
        }

        Text{
            id: errorLabel
            x:280; y:175
            font.pixelSize: 16
        }
    }

    function keyPriority() {
        return [topItem, myUsernameEdit, myPasswordEdit]

    }
}
