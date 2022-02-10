#ifndef SOCKETWORKER_H
#define SOCKETWORKER_H

#include <QObject>
#include <../porj/datainfo.h>
#include <QTcpSocket>

class SocketWorker : public QObject
{
    Q_OBJECT

public:
    explicit SocketWorker(QTcpSocket* socket);
public slots:
    int doWork(DataInfo *newData);
public:
    int mPort = 7777;
    QString mHost = "127.0.0.1";
    QTcpSocket* socket;
};

#endif // SOCKETWORKER_H
