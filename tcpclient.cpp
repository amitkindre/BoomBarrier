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

    for(int i = 0; i < 5; i++){
        if(socket->state() == QTcpSocket::UnconnectedState){
            qDebug()<< "connecting attempt" << i;

            //socket->setSocketOption(QTcpSocket::KeepAliveOption,1);
            socket->setCurrentWriteChannel(0);
            socket->setCurrentReadChannel(0);
            socket->connectToHost(TDCIP, port);
            if(socket->waitForConnected(3000)){
                qDebug() << "Connected" << i;
                socket->write("\r\n");
                socket->waitForBytesWritten(1000);
                return true;
            }
        }
//        else{

//        }
    }

    qDebug() << "Connection Failed!";
    return false;

}

void TcpClient::opengate()
{
    connectAndSetchannel();

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
    connectAndSetchannel();

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

    connectAndSetchannel();

    sprintf(strbuff,"%d\r\n",val);
    socket->write(strbuff);
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    qDebug() << socket->readAll();

    //socket->close();

}

int TcpClient::logintoserver(QString s,QString z)
{
    QByteArray ba,baa;
    char *logBuff1,*logBuff2,sbuff[100];
    qDebug() << "Login in progress";

    ba = s.toLatin1();
    baa = z.toLatin1();
    logBuff1 = ba.data();
    logBuff2 = baa.data();
    sprintf(sbuff,"GET /Login?tex_t2368=%s&tex_t8632=%s HTTP\r\n",logBuff1,logBuff2);
    qDebug() << sbuff;

    connectAndSetchannel();

    socket->write(sbuff);
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(10000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    ba = socket->readAll();


    qDebug() << ba;
    //socket->close();
    if(TcpClient::findString(ba.data(),"html OK")){
        qDebug() << "Login Sucess";
        return 1; //Login sucess
    }

    else if(TcpClient::findString(ba.data(),"html FAIL")){
        qDebug() << "Login Fail";
        socket->close();
        socket->waitForDisconnected(10000);
        return 2;//Invalid user/ Login fail
    }
    return 3;//Server channel unavailable "html ERROR"

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

    connectAndSetchannel();

    socket->write("GET /L1? HTTP\r\n");
    socket->waitForBytesWritten(1000);

    socket->waitForReadyRead(3000);
    qDebug() << "Reading: " << socket->bytesAvailable();

    ba = socket->readAll();
    qDebug() << ba;
    socket->close();
    socket->waitForDisconnected(10000);

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

bool TcpClient::connectAndSetchannel()
{
    for(int i = 0; i < 3; i++){
        if(socket->state() == QTcpSocket::UnconnectedState)
        {
            qDebug()<< "connecting attempt" << i;

            //socket->setSocketOption(QTcpSocket::KeepAliveOption,1);
            socket->setCurrentWriteChannel(0);
            socket->setCurrentReadChannel(0);
            socket->connectToHost(TDCIP, port);
            if(socket->waitForConnected(3000))
            {
                qDebug() << "Connected" << i;
                socket->write("\r\n");
                socket->waitForBytesWritten(1000);
                return true;
            }
        }
        else
        {   //Already connected
            qDebug() << "Already Connected";
            return true;
        }
    }

    qDebug() << "Connection Failed ";
    return false;
}
