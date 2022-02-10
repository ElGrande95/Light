import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import LogInDatabase 1.0
import "Components"

Page{

    ItemDatabase {
        id: myDatabase
    }

    Rectangle{
        id: topItem
        anchors.fill: parent
        color: "lightblue"
        Keys.forwardTo: [topItem, myUsernameEdit, myPasswordEdit]

        Image {
            x:60
            source: "/imgs/Images/addUser.png"
            scale: 2.4
            smooth: true
            anchors.verticalCenter: parent.verticalCenter
        }


        Text {
            x: 190; y: 20
            text: "Username:"
            font.pixelSize: 23
        }

        Text {
            x: 190; y: 70
            text: "Password:"
            font.pixelSize: 23
        }

        MyTextEdit{
            id: myUsernameEdit
            focusTextEdit: true
            x: 320; y: 20
            setPriority: keyPriority
            onMyTextChanged: message.text = ""
        }
        MyTextEdit{
            id: myPasswordEdit
            x: 320; y: 70
            setPriority: keyPriority
        }

        MyButton {
            x:190; y:120
            width: 185
            myButtonText: qsTr("Add")
            handleOnClicked: add_member
        }

        MyButton {
            x:385; y:120
            width: 185
            myButtonText: qsTr("Delete")
            handleOnClicked: delete_member
        }

        Text {
            id: message
            x: 350; y: 180
            font.pixelSize: 20
        }

        Keys.onPressed: {
            if ( event.key === Qt.Key_Return )  {
                add_member()
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


    function add_member() {
        if(myDatabase.insertInBase(myUsernameEdit.myText, myPasswordEdit.myText))
            message.text = "User added!"
        else
            message.text = "Username exist!"
    }

    function delete_member() {

        var indicator = myDatabase.deleteInBase(myUsernameEdit.myText);

        if(indicator === 2)
            message.text = "User deleted!"
        else  if(indicator === 1)
            message.text = "Username not exist!"
        else
            message.text = "Can not delete yourself!"

    }

    function keyPriority() {
        return [topItem, myUsernameEdit, myPasswordEdit]

    }

}
