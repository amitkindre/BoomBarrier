#include "tcpclient.h"
#include <QDebug>
#include <string>


#define TDCIP "100.101.111.238" //SANTOSH KIT
//#define TDCIP "192.168.4.1"
//#define TDCIP "127.0.0.1"
//#define TDCIP "100.101.111.182"//mobile ip
//#define TDCIP "100.101.111.183" //my pc server
#define port 80

TcpClient::TcpClient(QObject *parent) : QObject(parent)
{

}

bool TcpClient::connect()
{

    socket = new QTcpSocket(this);

    if(socket->state() != socket->ConnectedState)
        socket->connectToHost(TDCIP, port);

    //100.101.111.238

    if(socket->waitForConnected(3000))
    {
        qDebug() << "Connected!";

        // send
        socket->write("CONNECTED\r\n");
        socket->waitForBytesWritten(100);
        socket->waitForReadyRead(3000);
        qDebug() << "Reading: " << socket->bytesAvailable();

        qDebug() << socket->readAll();

        return true;

        socket->close();
    }
    else
    {
        qDebug() << "Not connected!";
        return false;
    }


}

void TcpClient::opengate()
{
    if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    socket->write("GET /O1? HTTP/1.1\r\n");
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    qDebug() << socket->readAll();
    //socket->close();

    qDebug() << "open";
}

void TcpClient::closegate()
{
    if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    socket->write("GET /C1? HTTP/1.1\r\n");

    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    qDebug() << socket->readAll();
    //socket->close();

    qDebug() << "close";

}

void TcpClient::brightness(int val)
{
    char strbuff[110];
    if(socket->state() != socket->ConnectedState)
    socket->connectToHost(TDCIP, port);
    sprintf(strbuff,"%d\r\n",val);
    socket->write(strbuff);
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    qDebug() << socket->readAll();
    //socket->close();

    socket->close();
}

bool TcpClient::logintoserver(QString s,QString z)
{
    socket = new QTcpSocket(this);
    QByteArray ba,baa;
    char *logBuff1,*logBuff2,sbuff[100];
    qDebug() << "Login in progress";

    ba = s.toLatin1();
    baa = z.toLatin1();
    logBuff1 = ba.data();
    logBuff2 = baa.data();
    sprintf(sbuff,"GET /Login?tex_t2368=%s&tex_t8632=%s HTTP\r\n",logBuff1,logBuff2);
    qDebug() << sbuff;

    if(socket->state() != socket->ConnectedState)
        socket->connectToHost(TDCIP, port);

    socket->write(sbuff);
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    ba = socket->readAll();

    qDebug() << ba;
    socket->close();
    if(TcpClient::findString(ba.data(),"html OK")){
        return true; //Login sucess
    }


    //else if(TcpClient::findString(ba.data(),"html FAIL")){
    return false;//Invalid user/ Login fail
     //}

     //return 3; //Server error or not reachable




}

bool TcpClient::getConnectStatus()
{
    //check wifi connectivity
    return true;
}


//GET /L1?
bool TcpClient::logoutuser()
{
    QByteArray ba;

    if(socket->state() != socket->ConnectedState)
       socket->connectToHost(TDCIP, port);

    socket->write("GET /L1? HTTP\r\n\r\n");
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    ba = socket->readAll();
    socket->close();

    if(TcpClient::findString(ba.data(),"html OK")){
        return true; //Logout sucess
    }
    return false; //Logout fail

}


bool TcpClient::findString(std::string source, std::string sub)
{
    std::size_t found = source.find(sub);
      if (found!=std::string::npos)
      {
          return true;
      }
      return false;
}
