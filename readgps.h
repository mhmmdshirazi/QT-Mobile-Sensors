#ifndef READGPS_H
#define READGPS_H

#include <QObject>
#include <QGeoCoordinate>
#include <QGeoPositionInfoSource>
#include <QDebug>
#include <QList>

/////////////
///\brief Read gps data
///
class readGps : public QObject{
    Q_OBJECT
public:
    explicit readGps(QObject *parent = nullptr);
    QGeoPositionInfoSource *source;
    Q_INVOKABLE QList <qreal> captureGpsData();
    QGeoPositionInfo positionInfo;
private slots:
    void positionUpdated(const QGeoPositionInfo &info);
};

#endif // READGPS_H
