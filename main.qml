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
                sensorInd.text = qsTr("Val: %1").arg(compass[0])
            } else if (chooseSensor.currentText == "Tilt") {
                sensorInd.text = qsTr("X: %1 \nY: %2").arg(tilt[0]).arg(tilt[1])
            }
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

}













/*##^## Designer {
    D{i:0;autoSize:true;height:667;width:375}D{i:1;anchors_y:19}D{i:3;anchors_x:30;anchors_y:48}
D{i:5;anchors_x:118}
}
 ##^##*/
