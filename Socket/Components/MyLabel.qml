import QtQuick 2.15

Rectangle {

    property string myText

    height: username.height
    width: username.width
    color: "transparent"
    property int pixelSize: 23

    Text {
        id: username
        text: myText
        font.pixelSize: pixelSize
    }
}
