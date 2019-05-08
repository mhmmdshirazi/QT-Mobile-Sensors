#include "readgps.h"

readGps::readGps(QObject *parent)
{
    source = QGeoPositionInfoSource::createDefaultSource(this);
    if (source) {
        connect(source, SIGNAL(positionUpdated(QGeoPositionInfo)),
                this, SLOT(positionUpdated(QGeoPositionInfo)));
        source->startUpdates();
    }

}

QList<qreal> readGps::captureGpsData()
{
    QList <qreal> temp;
    temp.clear();
    temp.append(positionInfo.coordinate().altitude());
    temp.append(positionInfo.coordinate().latitude());
    temp.append(positionInfo.coordinate().longitude());
    temp.append(positionInfo.attribute(QGeoPositionInfo::HorizontalAccuracy));
    temp.append(static_cast<int>(positionInfo.attribute(QGeoPositionInfo::GroundSpeed)*3.75));
    return temp;
}

void readGps::positionUpdated(const QGeoPositionInfo &info)
{
    positionInfo = info;
    qDebug() << info;
    qDebug() <<"alt"<< info.coordinate().altitude();
    qDebug() <<"lat"<< info.coordinate().latitude();
    qDebug() <<"long"<< info.coordinate().longitude();
}
