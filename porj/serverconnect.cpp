#include "serverconnect.h"
#include <QDataStream>

#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>

ServerConnect::ServerConnect(QObject* parent)
    :QObject(parent), m_sender(nullptr), mModel (new MyModel()),
      newData(new DataInfo())
{
    m_server = new QTcpServer(this);
    connect(m_server, &QTcpServer::newConnection, this, &ServerConnect::newConnection);
    m_server->listen(static_cast<QHostAddress>(mHost), mPort);
}

void ServerConnect::newConnection()
{
    while (m_server->hasPendingConnections()) {
        QTcpSocket *socket = m_server->nextPendingConnection();
        connect(socket, &QTcpSocket::readyRead, this, &ServerConnect::readDate);
        connect(socket, &QTcpSocket::disconnected, this, &ServerConnect::closeConnection);
        m_sockets.append(socket);
    }
}

void ServerConnect::readDate()
{
    m_sender = qobject_cast<QTcpSocket*>(sender());
    QString str = this->m_sender->readAll();

    QJsonDocument jsonResponse = QJsonDocument::fromJson(str.toLatin1());
    QJsonArray jsonArray = jsonResponse.array();

    if(jsonArray.isEmpty()){
        return;
    }
    QJsonObject jsonObject = jsonArray.first().toObject();

    newData->name = jsonObject.value("name").toString();
    newData->src = jsonObject.value("src").toString();
    newData->color = jsonObject.value("color").toString();
    newData->isOn = jsonObject.value("isOn").toBool();
    newData->intensity = jsonObject.value("intensity").toInt();

    mModel->setNewData(newData);

    emit pushedData();
}

void ServerConnect::closeConnection()
{
    m_sender = qobject_cast<QTcpSocket* > (sender());
    m_sockets.removeOne(m_sender);
}

int ServerConnect::port() const
{
    return mPort;
}

void ServerConnect::setPort(int arg)
{
    if(mPort == arg)
        return;
    mPort = arg;

    emit portChanged();
}

QString ServerConnect::host() const
{
    return mHost;

}

void ServerConnect::setHost(const QString &arg)
{
    if(mHost == arg)
        return;
    mHost = arg;

    emit hostChanged();
}

int ServerConnect::value() const
{
    return mValue;
}

MyModel *ServerConnect::modelData()
{
    return mModel;
}

void ServerConnect::classBegin()
{

}

void ServerConnect::componentComplete()
{
    startTimer(1000);
}

void ServerConnect::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event)
    mValue++;
    emit valueChanged(mValue);
}
