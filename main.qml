import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
Window {
    id: window
    visible: true
    title: qsTr("Sensors")

    //////// Set a timer to measure data
    Timer {
        interval: 16
        running: true
        repeat: true

        property double tiltXFiltered: 0
        property double tiltYFiltered: 0

        onTriggered: {
            var acc = sensors.readAccelerometer()
            var gyro = sensors.readGyro()
            var mag = sensors.readMagnetometer()
            var compass = sensors.readCompass()
            var tilt = sensors.readTilt()
            if (chooseSensor.currentText == "Accelerometer") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(acc[0]).arg(acc[1]).arg(acc[2])
            } else if (chooseSensor.currentText == "Gyroscope") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(gyro[0]).arg(gyro[1]).arg(gyro[2])
            } else if (chooseSensor.currentText == "Magnetometer") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(mag[0]).arg(mag[1]).arg(mag[2])
            } else if (chooseSensor.currentText == "Compass") {
                sensorInd.text = qsTr("Val: %1 , %2").arg(compass[0]).arg(Math.sin(90))
            } else if (chooseSensor.currentText == "Tilt") {
                sensorInd.text = qsTr("X: %1 \nY: %2").arg(tilt[0]).arg(tilt[1])
            }

            /// move the bubble
            if (tilt[0] > 45) {
                tilt[0] = 45
            }
            if (tilt[0] < -45) {
                tilt[0] = -45
            }
            if (tilt[1] > 45) {
                tilt[1] = 45
            }
            if (tilt[1] < -45) {
                tilt[1] = -45
            }

            tiltXFiltered = 0.9 * tiltXFiltered + 0.1 * tilt[1]
            tiltYFiltered = 0.9 * tiltYFiltered + 0.1 * tilt[0]

            bubble.x = -bubble.width/2 + area.width/2 - tiltXFiltered * 2
            bubble.y = -bubble.width/2 + area.width/2 - tiltYFiltered * 2

            /// move the compass

            compassInd.x = Math.sin(Math.PI + compass[0]*(Math.PI/180)) * (area.width/2 - compassInd.height/2) + area.width/2 - compassInd.width/2
            compassInd.y = Math.cos(Math.PI + compass[0]*(Math.PI/180)) * (area.width/2 - compassInd.height/2) + area.width/2 - compassInd.height/2
            compassInd.rotation = -compass[0] - 180

            north.x = Math.sin(Math.PI + compass[0]*(Math.PI/180)) * (area.width/2 + compassInd.height/2) + area.width/2 - north.width/2
            north.y = Math.cos(Math.PI + compass[0]*(Math.PI/180)) * (area.width/2 + compassInd.height/2) + area.width/2 - north.height/2
            north.rotation = -compass[0] - 180
        }
    }

    Text {
        id: element
        x: 363
        width: 24
        height: 37
        text: qsTr("top")
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
    }

    Text {
        id: element1
        x: 176
        y: 630
        width: 24
        height: 37
        text: qsTr("Buttom")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        font.pixelSize: 12
    }

    Text {
        id: sensorInd
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 100
        font.pixelSize: 12
    }

    ComboBox {
        id: chooseSensor
        x: 118
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin: 70
        anchors.top: parent.top
        anchors.topMargin: 32
        textRole: "key"
        model: ListModel{
            ListElement { key:"Accelerometer"; value : 1}
            ListElement { key:"Gyroscope"; value : 2}
            ListElement { key :"Magnetometer"; value :3}
            ListElement { key: "Compass"}
            ListElement { key: "Tilt"}
        }
    }

    Rectangle{
        id: area
        x: 138
        y: 373
        width: 250
        height: 250
        color: "#000000"
        radius: width/2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter

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
            id: compassInd
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
        }
    }





}



/*##^## Designer {
    D{i:0;autoSize:true;height:667;width:375}D{i:1;anchors_y:19}D{i:3;anchors_x:30;anchors_y:48}
D{i:5;anchors_x:118}
}
 ##^##*/
