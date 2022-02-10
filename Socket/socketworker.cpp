#include "socketworker.h"

#include <QDataStream>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>

SocketWorker::SocketWorker(QTcpSocket *socket)
    :socket(socket)
{
}

int SocketWorker::doWork(DataInfo *newData){

    QJsonObject jsonData{
        {"name", newData->name},
        {"src", newData->src},
        {"color", newData->color},
        {"isOn", newData->isOn},
        {"intensity", newData->intensity},
    };

    QJsonArray jsarray {jsonData};
    QJsonDocument jsDoc(jsarray);

    QString jsString = QString::fromLatin1(jsDoc.toJson());
    return socket->write(jsString.toLatin1());
}
