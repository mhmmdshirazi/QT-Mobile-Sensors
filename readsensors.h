#ifndef READSENSORS_H
#define READSENSORS_H

#include <QObject>
#include <QtSensors/QtSensors>
#include <QList>
#include <QDebug>

class readSensors : public QObject
{
    Q_OBJECT
public:
    explicit readSensors(QObject *parent = nullptr);
    ////// read Sensors
    /// Accelerometer
    Q_INVOKABLE QList <qreal> readAccelerometer();
private:
    QSensor *sensor;
};

#endif // READSENSORS_H
