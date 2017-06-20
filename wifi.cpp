#include "wifi.h"
#include <QDebug>
#include <QNetworkConfiguration>
#include <QNetworkConfigurationManager>

Wifi::Wifi(QObject *parent) : QObject(parent)
{

}

void Wifi::serchSSID()
{

    qDebug() << "Search Complete";


}
