#include "tcpclient.h"
#include <QDebug>

//#define TDCIP "100.101.111.238"
#define TDCIP "192.168.4.1"
#define port 8080

TcpClient::TcpClient(QObject *parent) : QObject(parent)
{

}

void TcpClient::connect()
{
    socket = new QTcpSocket(this);
    socket->connectToHost(TDCIP, port);
    //100.101.111.238

    if(socket->waitForConnected(3000))
        {
            qDebug() << "Connected!";

            // send
            //socket->write("divya\r\n\r\n\r\n\r\n");
            //socket->waitForBytesWritten(1000);
            //socket->waitForReadyRead(3000);
           // qDebug() << "Reading: " << socket->bytesAvailable();

           // qDebug() << socket->readAll();

            //socket->close();
        }
        else
        {
            qDebug() << "Not connected!";
        }

}

void TcpClient::opengate()
{
    //if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    socket->write("GET /O1?\r\n\r\n\r\n\r\n");
    socket->waitForBytesWritten(1000);
//    socket->waitForReadyRead(3000);
//    qDebug() << "Reading: " << socket->bytesAvailable();
//  hw1
    qDebug() << socket->readAll();
//    socket->close();

       qDebug() << "open";
}

void TcpClient::closegate()
{
    //if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    socket->write("GET /C1?\r\n\r\n\r\n\r\n");
    socket->waitForBytesWritten(1000);
//    socket->waitForReadyRead(3000);
//    qDebug() << "Reading: " << socket->bytesAvailable();

//    qDebug() << socket->readAll();
//    socket->close();

    qDebug() << "close";
}

void TcpClient::brightness(int val)
{
    char strbuff[100];
    //if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    sprintf(strbuff,"%d\r\n\r\n",val);
    socket->write(strbuff);
    socket->waitForBytesWritten(1000);
}
