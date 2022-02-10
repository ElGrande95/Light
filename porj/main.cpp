#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "mymodel.h"
#include "serverconnect.h"

#include <QThread>
#include <QEvent>
#include <exception>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType <MyModel> ("Core", 1, 0, "MyModel");
    qmlRegisterType <ServerConnect> ("Core", 1, 0, "ItemServerConnect");

    qmlRegisterAnonymousType <MyModel> ("Core", 1);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

}
