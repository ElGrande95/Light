import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {

    width: 600
    height: 800
    visible: true
    title: qsTr("Application")


    StackView {
        id: stack
        initialItem: "/window1.qml"
        anchors.fill: parent
        focus: true

        pushEnter: Transition {
            PropertyAnimation{
                property: "x"
                from: 600
                to: 0
                duration: 700
            }
        }

        pushExit: Transition {
            PropertyAnimation{
                property: "x"
                to: -600
                duration: 700
            }
        }

        popEnter: Transition {
            PropertyAnimation{
                property: "x"
                from: -600
                to: 0

                duration: 700
            }
        }

        popExit: Transition {
            PropertyAnimation{
                property: "x"
                from:0
                to: 600
                duration: 700
            }
        }

    }
}

