#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>
#include "tcpclient.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* contextp = engine.rootContext();

    TcpClient tClient;
    //tClient.connect();
    contextp->setContextProperty("tclient",&tClient);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));




    return app.exec();
}
