import QtQuick 2.15
Rectangle {

    property string myButtonText
    property var handleOnClicked: handleOnClicked_BaseButton

    id: addUser
    width: 150; height: 50
    color: "red"
    border.color: "Black"
    border.width: 3
    radius: 5

    Text {
        text: myButtonText
        anchors.centerIn: parent
        color: "Black"
        font.pixelSize: 20
    }

    MouseArea {
        anchors.fill: parent

        onClicked: handleOnClicked()
        onPressed: addUser.border.color = "grey"
        onReleased: addUser.border.color = "Black"
    }

    function handleOnClicked_BaseButton() {

    }
}
