import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {

    width: 600
    height: 250
    visible: true
    title: qsTr("User")


    StackView {
        id: stack
        initialItem: "/LogIn.qml"
        anchors.fill: parent
        focus: true

        pushEnter: pushEnter
        pushExit: pushExit
        popEnter: popEnter
        popExit: popExit

        Transition {
            id: pushEnter

            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 700
            }

        }

        Transition {
            id: pushExit

            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 700
            }
        }

        Transition {
            id: popEnter

            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 700
            }
        }

        Transition {
            id: popExit
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 700
            }
        }

        Keys.onPressed: {
            if ( event.key === Qt.Key_Escape )  {
                if(stack.busy === false && !(stack.depth === 0)) {
                    stack.pop()
                }

                event.accepted = true
            }
        }
    }
}
