#ifndef READSENSORS_H
#define READSENSORS_H

#include <QObject>
#include <QtSensors/QtSensors>
#include <QList>
#include <QDebug>

////////
/// \brief The readSensors class
///
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
    Q_INVOKABLE QList <qreal> readCompass();
    Q_INVOKABLE QList <qreal> readTilt();

private:
    QSensor *sensorAcc;
    QSensor *sensorGyro;
    QSensor *sensorMag;
    QSensor *sensorTilt;
    QSensor *sensorCompass;


};

#endif // READSENSORS_H
