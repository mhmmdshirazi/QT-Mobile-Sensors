#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include "readsensors.h"
#include "readgps.h"
int main(int argc, char *argv[])
{
    // QT Auto Generate code
    QApplication app(argc, argv);
    QQuickView viewer;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);

    viewer.setTitle(QStringLiteral("QML F1 Legends"));
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.show();

    // Define an object of readSensors Class
    readSensors *phoneSensors = new readSensors();
    readGps *phoneGps = new readGps();
    // Introduce phoneSensors object to QML Engine
    viewer.engine()->rootContext()->setContextProperty("sensors",phoneSensors);
    viewer.engine()->rootContext()->setContextProperty("gps",phoneGps);

    return app.exec();
}
