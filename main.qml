import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtCharts 2.0
Item {
    id: window

    visible: true
    //////// Set a timer to measure data
    Timer {
        interval: 50
        running: true
        repeat: true

        property double tiltXFiltered: 0
        property double tiltYFiltered: 0
        property int second: 0
        property int minute: 0
        property double _mSec: 0
        onTriggered: {
            _mSec += 0.050
            var acc = sensors.readAccelerometer()
            var gyro = sensors.readGyro()
            var mag = sensors.readMagnetometer()
            var compass = sensors.readCompass()
            var tilt = sensors.readTilt()
            var gpsData = gps.captureGpsData()
            if (chooseSensor.currentText == "GPS"){
                sensorInd.text = qsTr("Altitude: %1 \nLatitude: %2 \nLongitude: %3 \nHorizontal Accuracy: %4 \nGround Speed %5").
                arg(gpsData[0]).arg(gpsData[1]).arg(gpsData[2]).arg(gpsData[3]).arg(gpsData[4])
            }
            else if (chooseSensor.currentText == "Accelerometer") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(acc[0]).arg(acc[1]).arg(acc[2])
                if (mPlot.focus) {
                    mPlot.seriesData1.append(_mSec,acc[0])
                    mPlot.seriesData2.append(_mSec,acc[1])
                    mPlot.seriesData3.append(_mSec,acc[2])
                    mPlot.seriesData1.name = "X"
                    mPlot.seriesData2.name = "Y"
                    mPlot.seriesData3.name = "Z"
                    if(_mSec > 2) {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = _mSec - 2

                        mPlot.seriesData1.removePoints(0,mPlot.seriesData1.count - 40)
                        mPlot.seriesData2.removePoints(0,mPlot.seriesData2.count - 40)
                        mPlot.seriesData3.removePoints(0,mPlot.seriesData3.count - 40)

                    } else {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = 0
                    }
                    var maxVal = -1000
                    var minVal = 1000

                    for (var i = 0 ; i < mPlot.seriesData1.count ; i++) {
                        if(mPlot.seriesData1.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData1.at(i).y < minVal) {
                            minVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y < minVal) {
                            minVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData3.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y < minVal) {
                            minVal =  mPlot.seriesData3.at(i).y
                        }

                    }

                    mPlot.valAxis.max = maxVal
                    mPlot.valAxis.min = minVal
                }
            } else if (chooseSensor.currentText == "Gyroscope") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(gyro[0]).arg(gyro[1]).arg(gyro[2])
                if (mPlot.focus) {
                    mPlot.seriesData1.append(_mSec,gyro[0])
                    mPlot.seriesData2.append(_mSec,gyro[1])
                    mPlot.seriesData3.append(_mSec,gyro[2])

                    mPlot.seriesData1.name = "X"
                    mPlot.seriesData2.name = "Y"
                    mPlot.seriesData3.name = "Z"
                    if(_mSec > 2) {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = _mSec - 2

                        mPlot.seriesData1.removePoints(0,mPlot.seriesData1.count - 40)
                        mPlot.seriesData2.removePoints(0,mPlot.seriesData2.count - 40)
                        mPlot.seriesData3.removePoints(0,mPlot.seriesData3.count - 40)

                    } else {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = 0
                    }
                    var maxVal = -1000
                    var minVal = 1000

                    for (var i = 0 ; i < mPlot.seriesData1.count ; i++) {
                        if(mPlot.seriesData1.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData1.at(i).y < minVal) {
                            minVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y < minVal) {
                            minVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData3.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y < minVal) {
                            minVal =  mPlot.seriesData3.at(i).y
                        }

                    }

                    mPlot.valAxis.max = maxVal
                    mPlot.valAxis.min = minVal

                }
            } else if (chooseSensor.currentText == "Magnetometer") {
                sensorInd.text = qsTr("X: %1 \nY: %2 \nZ: %3").arg(mag[0]).arg(mag[1]).arg(mag[2])
                if (mPlot.focus) {
                    mPlot.seriesData1.append(_mSec,mag[0])
                    mPlot.seriesData2.append(_mSec,mag[1])
                    mPlot.seriesData3.append(_mSec,mag[2])
                    mPlot.seriesData1.name = "X"
                    mPlot.seriesData2.name = "Y"
                    mPlot.seriesData3.name = "Z"
                    if(_mSec > 2) {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = _mSec - 2

                        mPlot.seriesData1.removePoints(0,mPlot.seriesData1.count - 40)
                        mPlot.seriesData2.removePoints(0,mPlot.seriesData2.count - 40)
                        mPlot.seriesData3.removePoints(0,mPlot.seriesData3.count - 40)

                    } else {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = 0
                    }
                    var maxVal = -1000
                    var minVal = 1000

                    for (var i = 0 ; i < mPlot.seriesData1.count ; i++) {
                        if(mPlot.seriesData1.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData1.at(i).y < minVal) {
                            minVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y < minVal) {
                            minVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData3.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y < minVal) {
                            minVal =  mPlot.seriesData3.at(i).y
                        }

                    }

                    mPlot.valAxis.max = maxVal
                    mPlot.valAxis.min = minVal
                }
            } else if (chooseSensor.currentText == "Compass") {
                sensorInd.text = qsTr("Val: %1 , %2").arg(compass[0]).arg(Math.sin(90))
                if (mPlot.focus) {
                    mPlot.seriesData1.append(_mSec,compass[0])
                    //  console.log(mPlot.seriesData1.at(10).y , mPlot.valAxis.max , mPlot.seriesData1.at(10).y > mPlot.valAxis.max)
                    var maxVal = -1000
                    var minVal = 1000

                    for (var i = 0 ; i < mPlot.seriesData1.count ; i++) {
                        if(mPlot.seriesData1.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData1.at(i).y < minVal) {
                            minVal =  mPlot.seriesData1.at(i).y
                        }

                    }

                    mPlot.valAxis.max = maxVal
                    mPlot.valAxis.min = minVal

                    mPlot.seriesData1.name = "Value"
                    mPlot.seriesData2.name = ""
                    mPlot.seriesData2.name = ""
                    if(_mSec > 2) {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = _mSec - 2
                        mPlot.seriesData1.removePoints(0,mPlot.seriesData1.count - 40)
                        mPlot.seriesData2.removePoints(0,mPlot.seriesData2.count - 40)
                        mPlot.seriesData3.removePoints(0,mPlot.seriesData3.count - 40)

                    } else {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = 0
                    }

                }
            } else if (chooseSensor.currentText == "Tilt") {
                sensorInd.text = qsTr("X: %1 \nY: %2").arg(tilt[0]).arg(tilt[1])
                if (mPlot.focus) {
                    mPlot.seriesData1.append(_mSec,tilt[0])
                    mPlot.seriesData2.append(_mSec,tilt[1])
                    mPlot.seriesData1.name = "X"
                    mPlot.seriesData2.name = "Y"
                    if(_mSec > 2) {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = _mSec - 2

                        mPlot.seriesData1.removePoints(0,mPlot.seriesData1.count - 40)
                        mPlot.seriesData2.removePoints(0,mPlot.seriesData2.count - 40)
                        mPlot.seriesData3.removePoints(0,mPlot.seriesData3.count - 40)

                    } else {
                        mPlot.timeAxis.max = _mSec
                        mPlot.timeAxis.min = 0
                    }
                    var maxVal = -1000
                    var minVal = 1000

                    for (var i = 0 ; i < mPlot.seriesData1.count ; i++) {
                        if(mPlot.seriesData1.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData1.at(i).y < minVal) {
                            minVal =  mPlot.seriesData1.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData2.at(i).y < minVal) {
                            minVal =  mPlot.seriesData2.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y > maxVal) {
                            maxVal =  mPlot.seriesData3.at(i).y
                        }
                        if(mPlot.seriesData3.at(i).y < minVal) {
                            minVal =  mPlot.seriesData3.at(i).y
                        }

                    }

                    mPlot.valAxis.max = maxVal
                    mPlot.valAxis.min = minVal
                }
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
            if(mCompass.focus) {
                mCompass.bubbleX = -mCompass.bubbleWidth/2 + mCompass.areaWidth/2 - tiltXFiltered * 2
                mCompass.bubbleY = -mCompass.bubbleWidth/2 + mCompass.areaWidth/2 - tiltYFiltered * 2


                /// move the mmCompass
                mCompass.compassIndNX = Math.sin(Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndWidth/2
                mCompass.compassIndNY = Math.cos(Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndHeight/2
                mCompass.compassIndNR = -compass[0] - 180

                mCompass.compassIndSX = Math.sin(compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndWidth/2
                mCompass.compassIndSY = Math.cos(compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndHeight/2
                mCompass.compassIndSR = -compass[0]

                mCompass.compassIndWX = Math.sin(Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndWidth/2
                mCompass.compassIndWY = Math.cos(Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndHeight/2
                mCompass.compassIndWR = -compass[0] - 90

                mCompass.compassIndEX = Math.sin(Math.PI/2 + Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndWidth/2
                mCompass.compassIndEY = Math.cos(Math.PI/2 + Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 - mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassIndHeight/2
                mCompass.compassIndER = -compass[0] - 270

                mCompass.northX = Math.sin(Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordWidth/2
                mCompass.northY = Math.cos(Math.PI + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordHeight/2
                mCompass.northR = -compass[0] - 180

                mCompass.southX = Math.sin(compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordWidth/2
                mCompass.southY = Math.cos(compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordHeight/2
                mCompass.southR = -compass[0]

                mCompass.eastX = Math.sin(Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordWidth/2
                mCompass.eastY = Math.cos(Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordHeight/2
                mCompass.eastR = -compass[0] - 270

                mCompass.westX = Math.sin(Math.PI + Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordWidth/2
                mCompass.westY = Math.cos(Math.PI + Math.PI/2 + compass[0]*(Math.PI/180)) * (mCompass.areaWidth/2 + mCompass.compassIndHeight/2) + mCompass.areaWidth/2 - mCompass.compassWordHeight/2
                mCompass.westR = -compass[0] - 90
            }
        }
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
        antialiasing: true
        z: 1
        scale: 0.9
        clip: false
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
            ListElement { key: "GPS"}
        }
    }

    TabBar {
        anchors.bottom: parent.bottom
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        id: pageChooser
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Compass")
        }
        TabButton {
            text: qsTr("Charts")
        }
        TabButton {
            text: qsTr("Map")
        }
    }
    SwipeView {
        id: swipeView
        width: parent.width
        antialiasing: true
        anchors.topMargin: 200
        anchors.bottomMargin: 67
        visible: true
        spacing: 0
        wheelEnabled: false
        hoverEnabled: false
        currentIndex: pageChooser.currentIndex

        anchors.rightMargin: 0
        anchors.leftMargin: 0
        opacity: 1
        anchors.fill: parent
        onCurrentIndexChanged: {
            if(currentIndex==2){
                fullScreen.visible=true
            }else{
                fullScreen.visible=false
            }
            anchors.topMargin = 200
        }

        Compass {
            id: mCompass
        }
        Plot {
            id: mPlot
        }
        Map {
            id: mMap
        }
    }
    Button{
        visible: false
        id: fullScreen
        text: "Full Screen"
        anchors.bottom: swipeView.top
        anchors.right: parent.right
        onClicked: {
            swipeView.anchors.topMargin = 0
        }
    }

}
