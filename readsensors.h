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
    Q_INVOKABLE QList <qreal> readGyro();
    Q_INVOKABLE QList <qreal> readMagnetometer();

private:
    QSensor *sensorAcc;
    QSensor *sensorGyro;
    QSensor *sensorMag;
    QSensor *sensorTilt;
    QSensor *sensorCompass;
    QSensor *sensorAmbient;

};

#endif // READSENSORS_H
