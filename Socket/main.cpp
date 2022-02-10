#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "socketconnect.h"
#include "login.h"
#include "logindatabase.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType <SocketConnect> ("Socket", 1, 0, "ItemSocketConnect");
    qmlRegisterType <LogIn> ("LogIn", 1, 0, "ItemLogIn");
    qmlRegisterType <LogInDatabase> ("LogInDatabase", 1, 0, "ItemDatabase");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
