#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "MiddleMan.h"
#include "CorpoListingModel.h"
#include "CompanyListingModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MiddleMan* m_middleMan = new MiddleMan(&app);
    qmlRegisterSingletonInstance("com.HeartBook.MiddleMan", 1, 0, "MiddleMan", m_middleMan);
    CorpoListingModel* m_corpoListingModel = new CorpoListingModel(&app);
    qmlRegisterSingletonInstance("com.HeartBook.CorpoListingModel", 1, 0, "CorpoListingModel", m_corpoListingModel);
    CompanyListingModel* m_companyListingModel = new CompanyListingModel(&app);
    qmlRegisterSingletonInstance("com.HeartBook.CompanyListingModel", 1, 0, "CompanyListingModel", m_companyListingModel);


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
