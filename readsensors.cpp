#include "readsensors.h"

readSensors::readSensors(QObject *parent) : QObject(parent)
{
    sensorAcc = new QSensor("QAccelerometer");
    sensorAcc->start();
    sensorGyro = new QSensor("QGyroscope");
    sensorGyro->start();
    sensorMag = new QSensor("QMagnetometer");
    sensorMag->start();
    sensorCompass = new QSensor("QCompass");
    sensorCompass->start();
    sensorTilt = new QSensor("QTiltSensor");
    sensorTilt->start();

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
    temp.append(sensorGyro->reading()->property("z").value<qreal>());
    temp.append(sensorGyro->reading()->property("y").value<qreal>());
    return temp;
}

QList<qreal> readSensors::readMagnetometer()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorMag->reading()->property("x").value<qreal>());
    temp.append(sensorMag->reading()->property("y").value<qreal>());
    temp.append(sensorMag->reading()->property("z").value<qreal>());
    return temp;
}

QList<qreal> readSensors::readCompass()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorCompass->reading()->property("azimuth").value<qreal>());
    return temp;
}

QList<qreal> readSensors::readTilt()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(sensorTilt->reading()->property("xRotation").value<qreal>());
    temp.append(sensorTilt->reading()->property("yRotation").value<qreal>());
    return temp;
}




