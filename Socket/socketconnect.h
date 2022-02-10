#ifndef SOCKETCONNECT_H
#define SOCKETCONNECT_H

#include <QObject>
#include <QTcpSocket>
#include <QDataStream>
#include <QThread>
#include "../porj/datainfo.h"

class SocketConnect : public QObject
{
    Q_OBJECT

public:
    explicit SocketConnect(QObject* parent = nullptr);
    ~SocketConnect();

public slots:
    Q_INVOKABLE void pushOnServer();


    Q_INVOKABLE void switchOn(bool arg);
    Q_INVOKABLE void chooseColor(QString arg);
    Q_INVOKABLE void name(QString arg);
signals:
    void pushOnServerData(DataInfo *data);

public:
    DataInfo* newData;
    QTcpSocket* mSocket;
    int mPort = 7777;
    QString mHost = "127.0.0.1";
    int port() const;
    void setPort(int newPort);
    const QString &host() const;
    void setHost(const QString &newHost);

    QThread workerThread;
};


#endif // SOCKETCONNECT_H
