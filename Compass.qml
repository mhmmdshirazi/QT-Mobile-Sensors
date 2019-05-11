import QtQuick 2.0
import QtQuick.Controls 2.5

Page {
    // make alias to use in main.qml
    background: Rectangle{
        color:"transparent"
    }
    property alias bubbleX: bubble.x
    property alias bubbleY: bubble.y
    property alias bubbleWidth: bubble.width

    property alias areaWidth: area.width

    property alias compassIndWidth: compassIndE.width
    property alias compassIndHeight: compassIndE.height

    property alias compassWordHeight: north.height
    property alias compassWordWidth: north.width

    property alias compassIndEX: compassIndE.x
    property alias compassIndEY: compassIndE.y
    property alias compassIndER: compassIndE.rotation
    property alias eastX: east.x
    property alias eastY: east.y
    property alias eastR: east.rotation

    property alias compassIndWX: compassIndW.x
    property alias compassIndWY: compassIndW.y
    property alias compassIndWR: compassIndW.rotation
    property alias westX: west.x
    property alias westY: west.y
    property alias westR: west.rotation

    property alias compassIndSX: compassIndS.x
    property alias compassIndSY: compassIndS.y
    property alias compassIndSR: compassIndS.rotation
    property alias southX: south.x
    property alias southY: south.y
    property alias southR: south.rotation

    property alias compassIndNX: compassIndN.x
    property alias compassIndNY: compassIndN.y
    property alias compassIndNR: compassIndN.rotation
    property alias northX: north.x
    property alias northY: north.y
    property alias northR: north.rotation

    Rectangle{
        id: area
        width: 250
        height: 250
        color: "#000000"
        radius: width/2
        border.color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Rectangle{
            id: bubble
            x : 0 + parent.width/2 - width/2
            y : 0 + parent.width/2 - width/2
            width: 40
            height: 40
            color: "#FFFFFF"
            radius: width/2
        }
        Rectangle {
            id: compassIndN
            x: parent.width/2
            y: 0
            rotation: 0
            width: 5
            height: 35
            color: "#f40b0b"
        }
        Rectangle {
            id: compassIndS
            x: parent.width/2
            y: 0
            rotation: 0
            width: 5
            height: 35
            color: "#f40b0b"
        }
        Rectangle {
            id: compassIndW
            x: parent.width/2
            y: 0
            rotation: 0
            width: 5
            height: 35
            color: "#f40b0b"
        }
        Rectangle {
            id: compassIndE
            x: parent.width/2
            y: 0
            rotation: 0
            width: 5
            height: 35
            color: "#f40b0b"
        }
        Text {
            id: north
            text: qsTr("N")
            color: "#A0A0A0"
        }
        Text {
            id: south
            text: qsTr("S")
            color: "#A0A0A0"
        }
        Text {
            id: west
            text: qsTr("W")
            color: "#A0A0A0"
        }
        Text {
            id: east
            text: qsTr("E")
            color: "#A0A0A0"
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
