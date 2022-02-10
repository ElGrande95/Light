import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Socket 1.0
import "Components"

Page{

    ItemSocketConnect {
        id: socket
    }
    property string nUsername

    Rectangle {
        id: topItem
        anchors.fill: parent
        color: "lightblue"

        Row{
            anchors.fill: parent
            spacing: 7

            Item {

                id: itemName
                width: button1.width + 30
                height: button1.height

                Text {
                    id: name
                    y:7
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Name")
                    font.pixelSize: 20
                }

                ColumnLayout {

                    anchors.top: name.bottom
                    spacing: 4;
                    RadioButton {
                        id: button1
                        text: qsTr("Dimmable light")
                        onClicked: {
                            message.text = ""
                            socket.name("dimmable light")
                        }
                    }
                    RadioButton {
                        id: button2
                        text: qsTr("Color light")
                        onClicked: {
                            message.text = ""
                            socket.name("color light")
                        }
                    }
                    RadioButton {
                        id: button3
                        text: qsTr("On/off")
                        onClicked: {
                            message.text = ""
                            socket.name("on/off")
                        }
                    }
                }
            }

            Item {

                width: button4.width + 30
                height: button4.height

                Text {
                    id: color
                    y:7
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Color")
                    font.pixelSize: 20
                }

                ColumnLayout {
                    y:5

                    anchors.top: color.bottom
                    spacing: 4;
                    RadioButton {
                        id: button4
                        text: qsTr("Red")
                        onClicked: {
                            message.text = ""
                            socket.chooseColor("red")
                        }

                    }
                    RadioButton {
                        id: button5
                        text: qsTr("Blue")
                        onClicked: {
                            message.text = ""
                            socket.chooseColor("blue")
                        }
                    }
                    RadioButton {
                        id: button6
                        text: qsTr("Yellow")
                        onClicked: {
                            message.text = ""
                            socket.chooseColor("yellow")
                        }
                    }
                }
            }

            Item {

                width: button7.width + 30
                height: button7.height

                Text {
                    id: turnOn
                    y:7
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("TurnOn")
                    font.pixelSize: 20
                }

                ColumnLayout {
                    y:5
                    anchors.top: turnOn.bottom
                    spacing: 4;

                    RadioButton {
                        id: button7
                        text: qsTr("On")
                        onClicked: {
                            message.text = ""
                            socket.switchOn(true)
                        }
                    }
                    RadioButton {
                        id: button8
                        text: qsTr("Off")
                        onClicked: {
                            message.text = ""
                            socket.switchOn(false)
                        }
                    }
                }
            }

            Item {
                width: 150; height: 210

                MyButton{
                    id: confirmButton
                    x:10; y: 10
                    myButtonText: qsTr("Confirm")
                    handleOnClicked: handleOnClicked_BaseButton

                    function handleOnClicked_BaseButton() {
                        message.text = "Light changed!"
                        socket.pushOnServer()
                    }
                }


                MyButton{
                    id: addUser
                    x:10; y: 65
                    myButtonText: qsTr("AddUser")


                    handleOnClicked: nUsername === "Admin" ? handleOnClicked_BaseButton : error_not_admin

                    function handleOnClicked_BaseButton() {
                        if(stack.busy === false)
                            stack.push("/NewMember.qml")
                    }
                    function error_not_admin() {
                        message.text = "You are not admin!"
                    }
                }

                MyButton{
                    id: logOut
                    x:10; y:120
                    myButtonText: qsTr("LogOut")
                    handleOnClicked: handleOnClicked_BaseButton

                    function handleOnClicked_BaseButton() {
                        if(stack.busy === false)
                            stack.pop()
                    }
                }

                Text {
                    id: message
                    x:10; y:210
                    font.pixelSize: 20
                }
            }
        }

        Text {
            id: username
            x:20; y:210
            text: "Username: " + nUsername
            font.pixelSize: 20
        }
    }
}
