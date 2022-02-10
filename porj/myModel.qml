import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
import QtQml.Models 2.15


    ListModel {

        id: nameModel

        ListElement {name: "dimmable light";    sour: "/imgs/imgs/bulb.png";        color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "on/off";            sour: "/imgs/imgs/light-bulb.png";  color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "color light";       sour: "/imgs/imgs/idea.png";        color: "red";           turnOn: true;     intensity:50}
        ListElement {name: "dimmable light";    sour: "/imgs/imgs/bulb.png";        color: "yellow";        turnOn: true;     intensity:70}
        ListElement {name: "on/off";            sour: "/imgs/imgs/light-bulb.png";  color: "yellow";        turnOn: true;     intensity:100}
        ListElement {name: "color light";       sour: "/imgs/imgs/idea.png";        color: "blue";          turnOn: true;     intensity:100}
        ListElement {name: "dimmable light";    sour: "/imgs/imgs/bulb.png";        color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "on/off";            sour: "/imgs/imgs/light-bulb.png";  color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "dimmable light";    sour: "/imgs/imgs/bulb.png";        color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "on/off";            sour: "/imgs/imgs/light-bulb.png";  color: "yellow";        turnOn: true;     intensity:100}
        ListElement {name: "color light";       sour: "/imgs/imgs/idea.png";        color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "color light";       sour: "/imgs/imgs/idea.png";        color: "yellow";        turnOn: true;     intensity:40}
        ListElement {name: "dimmable light";    sour: "/imgs/imgs/bulb.png";        color: "yellow";        turnOn: true;     intensity:80}
        ListElement {name: "on/off";            sour: "/imgs/imgs/light-bulb.png";  color: "yellow";        turnOn: false;    intensity:100}
        ListElement {name: "color light";       sour: "/imgs/imgs/idea.png";        color: "yellow";        turnOn: false;    intensity:100}

    }


