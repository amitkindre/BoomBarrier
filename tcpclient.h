#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QString>

#include <QObject>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = 0);

    Q_INVOKABLE void connect();
    Q_INVOKABLE void closegate();
    Q_INVOKABLE void opengate();
    Q_INVOKABLE void brightness(int);
    Q_INVOKABLE void logintoserver(QString,QString);
    Q_INVOKABLE bool getConnectStatus();

signals:

public slots:


private:
    QTcpSocket *socket;

};

#endif // TCPCLIENT_H
