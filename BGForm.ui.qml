import QtQuick 2.4

Item {
    width: 400
    height: 400

    Rectangle {
        id: rectangle
        color: "#1a1818"
        clip: true
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            x: -29
            y: -190
            width: 83
            height: 400
            color: "#4c4c4c"
            rotation: 45
            z: 0
        }

        Rectangle {
            id: rectangle2
            x: 72
            y: -333
            width: 20
            height: 1000
            color: "#4c4c4c"
            rotation: 45
            z: 0
        }

        Rectangle {
            id: rectangle3
            x: 152
            y: -300
            width: 20
            height: 1000
            color: "#4c4c4c"
            rotation: 45
            z: 0
        }

        Rectangle {
            id: rectangle4
            x: 211
            y: -232
            width: 20
            height: 1000
            color: "#4c4c4c"
            rotation: 45
            z: 0
        }

        Rectangle {
            id: rectangle5
            x: 326
            y: -139
            width: 20
            height: 1000
            color: "#ffffff"
            rotation: 45
            z: 0
        }
    }
}




/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:192;anchors_y:72}
}
 ##^##*/
