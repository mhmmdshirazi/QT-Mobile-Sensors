import QtQuick 2.0
import QtQuick.Controls 2.5
import QtCharts 2.3
Page {
    property alias seriesData1: series1
    property alias seriesData2: series2
    property alias seriesData3: series3
    property alias timeAxis: axisX
    property alias valAxis: axisY
    background: Rectangle{
                color:"transparent"
    }
    //![1]
    ChartView {
        title: "Display Sensor data"
        anchors.fill: parent
        legend.visible: true
        antialiasing: true

       ValueAxis {
            id: axisX
            min: 0
            max: 10
            tickCount: 5

        }

        ValueAxis {
            id: axisY
        }

        SplineSeries {
            id: series1
            axisX: axisX
            axisY: axisY
            //Legend: "salam"
        }
        SplineSeries {
            id: series2
            axisX: axisX
            axisY: axisY
        }
        SplineSeries {
            id: series3
            axisX: axisX
            axisY: axisY
        }


    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
