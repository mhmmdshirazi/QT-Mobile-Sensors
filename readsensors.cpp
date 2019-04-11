#include "readsensors.h"

readSensors::readSensors(QObject *parent) : QObject(parent)
{
    sensor = new QSensor("QAccelerometer");
    sensor->start();
}

QList<qreal> readSensors::readAccelerometer()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensor->reading()->property("x").value<qreal>());
    temp.append(sensor->reading()->property("y").value<qreal>());
    temp.append(sensor->reading()->property("z").value<qreal>());
    return temp;
}
