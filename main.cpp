#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "readsensors.h"
int main(int argc, char *argv[])
{
    // QT Auto Generate code
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    // Define an object of readSensors Class
    readSensors *phoneSensors = new readSensors();
    // Introduce phoneSensors object to QML Engine
    engine.rootContext()->setContextProperty("sensors",phoneSensors);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
