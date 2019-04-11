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
            if (chooseSensor.currentText == "Accelerometer") {
                accelerometerInd.text = qsTr("Accelerometer x: %1 \nAccelerometer y: %2 \nAccelerometer z: %3").arg(acc[0]).arg(acc[1]).arg(acc[2])
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
        id: accelerometerInd
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
        anchors.top: parent.top
        anchors.topMargin: 32
        model: ListModel{
            ListElement { text:"Accelerometer"; key :"Accelerometer"; value : 1}
            ListElement { text:"Gyroscope";key :"Gyroscope"; value : 2}
            ListElement { text:"Magnetometer";key :"Magnetometer"; value :3}
        }
    }

}











/*##^## Designer {
    D{i:0;autoSize:true;height:667;width:375}D{i:1;anchors_y:19}D{i:3;anchors_x:30;anchors_y:48}
}
 ##^##*/
