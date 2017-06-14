#ifndef WIFI_H
#define WIFI_H

#include <QObject>

class Wifi : public QObject
{
    Q_OBJECT
public:
    explicit Wifi(QObject *parent = 0);

signals:


public slots:
    void serchSSID();

private:


};


#endif // WIFI_H
