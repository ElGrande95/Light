import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12



Page {

    focus: true

    property var nModel
    Rectangle{

        id: idPom
        property int currentIndex: 0

        Keys.onUpPressed: idSlider.focus = true
        Keys.onDownPressed: myRow.focus = true

        anchors.fill: parent
        property color pry_color: nModel.color

        color: "lightgrey"

        Rectangle {
            y: 50
            anchors.horizontalCenter: parent.horizontalCenter

            height: 100
            width: 100
            radius: 50; smooth: true
            border.color: "black"
            color:  Qt.rgba(idPom.pry_color.r * idSlider.value / 100,
                            idPom.pry_color.g * idSlider.value / 100,
                            idPom.pry_color.b * idSlider.value / 100,
                            idPom.pry_color.a)
        }

        Row {
            id: myRow

            property int currentIndex: nModel.color === "blue" ? 0 : (nModel.color === "red" ? 1 : 2)
            Keys.onLeftPressed: {
                var colors = ["blue", "red", "yellow"]
                if(currentIndex > 0) {
                    currentIndex--;
                    nModel.color = colors[currentIndex]
                }
            }
            Keys.onRightPressed: {
                var colors = ["blue", "red", "yellow"]
                if(currentIndex <2) {
                    currentIndex++;
                    nModel.color = colors[currentIndex]
                }
            }

            height: 100; width: 420
            y: 230
            spacing: 60
            anchors.horizontalCenter: parent.horizontalCenter


            Rectangle{
                id: rect1
                height: 100
                width: 100
                radius: 50; smooth: true
                border.color: myRow.currentIndex==0 ? "lightblue" : "black"
                border.width: 10
                color: "blue"

            }


            Rectangle{

                id: rect2

                height: 100
                width: 100
                radius: 50; smooth: true
                border.color: myRow.currentIndex==1 ? "lightblue" : "black"
                border.width: 10

                color: "red"

            }

            Rectangle{

                id: rect3

                height: 100
                width: 100
                radius: 50; smooth: true
                border.color: myRow.currentIndex==2 ? "lightblue" : "black"
                border.width: 10

                color: "yellow"

            }

        }

        Slider {
            id: idSlider
            y: 180
            anchors.horizontalCenter: parent.horizontalCenter

            focus: true

            value: nModel.intensity

            from: 0; to: 100;

            height: 50
            width: 300

            Keys.onLeftPressed: {

                if (value > 0) {
                    nModel.intensity--;
                }
            }

            Keys.onRightPressed: {
                if (value < 100) {
                    nModel.intensity++;
                }
            }
        }

    }



    Keys.onEscapePressed: {
        stack.pop()
    }
}
