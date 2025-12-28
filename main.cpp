#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "passwordgenerator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    PasswordGenerator passwordGenerator;

    engine.rootContext()->setContextProperty(
        "passwordGenerator",
        &passwordGenerator
        );

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
        );

    engine.loadFromModule("Qrypt", "Main");

    return app.exec();
}
