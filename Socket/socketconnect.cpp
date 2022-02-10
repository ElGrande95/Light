#include "socketconnect.h"
#include "socketworker.h"

SocketConnect::SocketConnect(QObject* parent)
    :QObject(parent), newData (new DataInfo())
{
    mSocket = new QTcpSocket();
    mSocket->connectToHost(mHost, mPort);

    SocketWorker *worker = new SocketWorker(mSocket);
    worker->moveToThread(&workerThread);
    mSocket->moveToThread(&workerThread);

    connect(&workerThread, &QThread::finished, worker, &QObject::deleteLater);
    connect(this, &SocketConnect::pushOnServerData, worker, &SocketWorker::doWork);
    workerThread.start();
}

void SocketConnect::pushOnServer()
{
    emit pushOnServerData(newData);
}

SocketConnect::~SocketConnect()
{
    workerThread.quit();
    workerThread.wait();
}

void SocketConnect::switchOn(bool arg)
{
    newData->isOn = arg;
}

void SocketConnect::chooseColor(QString arg)
{
    newData->color = arg;
}

void SocketConnect::name(QString arg)
{
    newData->name = arg;

    if(newData->name == "color light")
        newData->src = "/imgs/imgs/idea.png";
    else if(newData->name == "on/off")
        newData->src = "/imgs/imgs/bulb.png";
    else if(newData->name == "dimmable light")
        newData->src = "/imgs/imgs/light-bulb.png";
}

const QString &SocketConnect::host() const
{
    return mHost;
}

void SocketConnect::setHost(const QString &newHost)
{
    mHost = newHost;
}

int SocketConnect::port() const
{
    return mPort;
}

void SocketConnect::setPort(int newPort)
{
    mPort = newPort;
}
