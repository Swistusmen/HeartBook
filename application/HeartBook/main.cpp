#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "MiddleMan.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MiddleMan* m_middleMan = new MiddleMan(&app);
    qmlRegisterSingletonInstance("com.HeartBook.MiddleMan", 1, 0, "MiddleMan", m_middleMan);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("HeartBook", "Main");

    return app.exec();
}
