import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12

import Core 1.0

Item {
    property var nModel
    property var nServer

    focus: true
    Keys.forwardTo: [idSlider]

    Rectangle{
        anchors.fill: parent

        color: "lightgrey"

        Rectangle {
            y: 50
            anchors.horizontalCenter: parent.horizontalCenter

            height: 100
            width: 100
            radius: 50; smooth: true
            border.color: "black"

            property color pry_color: nModel.color

            color:  Qt.rgba(pry_color.r * idSlider.value / 100,
                            pry_color.g * idSlider.value / 100,
                            pry_color.b * idSlider.value / 100,
                            pry_color.a)
        }

        Slider {
            id: idSlider
            y: 180

            focus: true

            anchors.horizontalCenter: parent.horizontalCenter

            value: nModel.intensity

            from: 0; to: 100;

            height: 50
            width: 300

            Keys.onLeftPressed: {

                if (value > 0) {
                    nModel.intensity --;
                }
            }

            Keys.onRightPressed: {
                if (value < 100) {
                    nModel.intensity ++;
                }
            }

    }

    }


    Text {
        id: text
        text: nServer.value
        y: 280
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
    }

    Keys.onEscapePressed: {
        stack.pop()
    }

}
