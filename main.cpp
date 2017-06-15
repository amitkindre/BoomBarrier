#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>

#include <QNetworkConfiguration>
#include <QNetworkConfigurationManager>

#include "tcpclient.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* contextp = engine.rootContext();


    QNetworkConfiguration cfg;
    QNetworkConfigurationManager ncm;
    QList<QNetworkConfiguration> nc = ncm.allConfigurations();


    qDebug() << "Config";
    for (int i=0;i < nc.length();i++)
    //for (auto &x : nc)
    {
        //if (x.bearerType() == QNetworkConfiguration::BearerWLAN)

        //{
            qDebug() << x.name();

            //x.Discovered
        //}
    }


    TcpClient tClient;
    //tClient.connect();
    contextp->setContextProperty("tclient",&tClient);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));




    return app.exec();
}
