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

    Q_INVOKABLE bool connect();
    Q_INVOKABLE void closegate();
    Q_INVOKABLE void opengate();
    Q_INVOKABLE void brightness(int);
    Q_INVOKABLE bool logintoserver(QString,QString);
    Q_INVOKABLE bool getConnectStatus();
    Q_INVOKABLE void logoutuser();

signals:

public slots:


private:
    QTcpSocket *socket;
    bool findString(std::string, std::string);
};

#endif // TCPCLIENT_H
