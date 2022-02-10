import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12

import Core 1.0

Page {

    id: page1
    focus: true

    ItemServerConnect{
        id: myServer
        port: 5455
        host: "192.168.0.215"

    }

    Image {
        id: img
        source: "/imgs/imgs/backround.jpg"
        anchors.fill: parent

        Component {
            id: nameDelegat

            Item{

                x: (img.width - idButton.width) / 2

                Keys.onSpacePressed: {
                    if (lv.currentIndex === index) {


                        var column_number = 0;
                        var q_model_index = lv.model.index(lv.currentIndex, column_number);
                        var role = lv.model.rolsIsOn()
                        var data_changed = lv.model.setData(q_model_index, !(lv.model.data(q_model_index,role)) , role);

                    }
                }

                Keys.onReturnPressed: {

                    if(lv.currentIndex === index && model.name === "dimmable light")
                        stack.push("qrc:/DimmableLight.qml", { nModel: model, nServer: myServer})
                    else if(lv.currentIndex === index && model.name === "color light")
                        stack.push("qrc:/ColorLight.qml", { nModel: model })

                }


                Keys.onDigit1Pressed: {
                    lv.model.insertLight(lv.currentIndex)

                }


                Button {
                    id: idButton
                    scale: lv.currentIndex === index ? 1.2 : 1

                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: idName
                        anchors.horizontalCenter: idButton.horizontalCenter
                        anchors.verticalCenter: rec.verticalCenter

                        text: model.name + "  "
                        color: "White"
                        font.pixelSize: 32
                    }

                    Text {
                        id: idIntensity
                        anchors.right: img2.left
                        anchors.verticalCenter: rec.verticalCenter

                        text: (!model.isOn ? 0 : model.intensity) + "  "
                        color: "White"
                        font.pixelSize: 32
                    }

                    Image {
                        id: img1
                        source: model.src

                        anchors.left: rec.left
                        anchors.verticalCenter: rec.verticalCenter

                        height: idName.height
                        width: sourceSize.width * idName.height / sourceSize.height

                    }

                    Image {
                        id: img2
                        source: "/imgs/imgs/next.png"

                        anchors.right: rec.right
                        anchors.verticalCenter: rec.verticalCenter

                        height: model.name === "on/off" ? 0 : idName.height
                        width: model.name === "on/off" ? 0 : sourceSize.width * idName.height / sourceSize.height

                    }

                    ColorOverlay {
                        id: idColor
                        anchors.fill: img1
                        source: img1
                        property int inten: model.isOn ?  model.intensity : 1
                        property color pry_color: model.isOn ?  model.color : "black"
                        color: Qt.rgba(pry_color.r * inten / 100,
                                       pry_color.g * inten / 100,
                                       pry_color.b * inten / 100,
                                       pry_color.a)

                    }

                    background: Rectangle {

                        id: rec
                        anchors.horizontalCenter: idButton.horizontalCenter

                        height: 55; width: 400
                        color: lv.currentIndex === index ? "white" : "lightblue"
                        opacity: 0.3
                        radius: 20; smooth: true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: lv.currentIndex = index
                        }

                    }
                }
            }
        }

        ListView {
            id: lv

            anchors.fill: parent
            model: myServer.modelData
            delegate: nameDelegat
            clip: true
            focus: true
            spacing: 75
            preferredHighlightBegin: 80
            preferredHighlightEnd: 100
            highlightRangeMode: ListView.StrictlyEnforceRange


        }
    }
}
