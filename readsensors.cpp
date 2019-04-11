#include "readsensors.h"

readSensors::readSensors(QObject *parent) : QObject(parent)
{
    sensorAcc = new QSensor("QAccelerometer");
    sensorAcc->start();
    sensorGyro = new QSensor("QAccelerometerFilter");
    sensorGyro->start();
}

QList<qreal> readSensors::readAccelerometer()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorAcc->reading()->property("x").value<qreal>());
    temp.append(sensorAcc->reading()->property("y").value<qreal>());
    temp.append(sensorAcc->reading()->property("z").value<qreal>());
    return temp;
}

QList<qreal> readSensors::readGyro()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorGyro->reading()->property("x").value<qreal>());
    temp.append(sensorAcc->reading()->property("z").value<qreal>());
    temp.append(sensorAcc->reading()->property("y").value<qreal>());
    return temp;
}

QList<qreal> readSensors::readMagnetometer()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorAcc->reading()->property("x").value<qreal>());
    temp.append(sensorAcc->reading()->property("y").value<qreal>());
    temp.append(sensorAcc->reading()->property("z").value<qreal>());
    return temp;
}
