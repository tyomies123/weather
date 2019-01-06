#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "owe/openweather/weatherapi.h"

// The API key is handed over in private.
#define OWE_API_KEY ""

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Required by OpenWeatherMap module
    QGuiApplication::setOrganizationDomain("edu");
    QGuiApplication::setOrganizationName("lopputyo");
    OpenWeatherModule::registerQmlTypes(engine, "edu.owe");
    OpenWeather::setApiKey(OWE_API_KEY);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
