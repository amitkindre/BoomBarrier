#ifndef WIFI_H
#define WIFI_H

#include <QObject>
#include <QNetworkConfiguration>
#include <QNetworkConfigurationManager>
#include <QDebug>

class Wifi : public QObject
{
    Q_OBJECT
public:
    explicit Wifi(QObject *parent = 0);
    void serchSSID();

signals:


public slots:
    void updateCompleted();

private:
    QNetworkConfigurationManager *mgr;

};


#endif // WIFI_H
