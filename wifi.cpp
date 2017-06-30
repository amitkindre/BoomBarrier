 #include "wifi.h"
#include <QDebug>
#include <QNetworkSession>

Wifi::Wifi(QObject *parent) : QObject(parent)
{

}

void Wifi::serchSSID()
{

    qDebug() << "Searching";
    mgr = new QNetworkConfigurationManager(this);
    QNetworkConfiguration cfg;
    mgr->allConfigurations().clear();
    mgr->updateConfigurations();

    connect(mgr,SIGNAL(updateCompleted()),this,SLOT(updateCompleted()));

    return;
}

void Wifi::updateCompleted()
{
    qDebug() << "Search Complete";
    QNetworkConfiguration cfg;



    for(int i=0; i < mgr->allConfigurations().count(); i++)
    {
        if(mgr->allConfigurations().at(i).bearerType() == QNetworkConfiguration::BearerWLAN)
            if(mgr->allConfigurations().at(i).name() == "TDC")
            {

                cfg = mgr->allConfigurations().at(i);
                qDebug() << cfg.name();
                qDebug() << mgr->allConfigurations().at(i).name();
            }
    }

    auto session = new QNetworkSession(cfg,this);
    session->open();





//        QList<QNetworkConfiguration> nwkCnfList = nwkMgr.allConfigurations();
//        for(const QNetworkConfiguration &ncnf : nwkCnfList)
//        {
//            qDebug() << ncnf.name() << ncnf.bearerType();
//            if (ncnf.bearerType() == QNetworkConfiguration::BearerWLAN)
//            {
//               // would like to detect WiFi here
//               qDebug() << "WiFi:" << ncnf.name();
//            }
//        }


    return;
}
