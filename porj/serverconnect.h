#ifndef SERVERCONNECT_H
#define SERVERCONNECT_H

#include <QObject>
#include <QQmlParserStatus>
#include "mymodel.h"

#include <QTcpServer>
#include <QTcpSocket>

class ServerConnect : public QObject, public QQmlParserStatus
{
    Q_OBJECT
    Q_INTERFACES(QQmlParserStatus)

    Q_PROPERTY(int port READ port WRITE setPort NOTIFY portChanged)
    Q_PROPERTY(QString host READ host WRITE setHost NOTIFY hostChanged)
    Q_PROPERTY(MyModel* modelData READ modelData CONSTANT)
    Q_PROPERTY(int value READ value NOTIFY valueChanged)

public:
    explicit ServerConnect(QObject* parent = nullptr);

    int port() const;
    void setPort(int arg);

    QString host() const;
    void setHost(const QString& arg);

    MyModel* modelData();

    int value() const;

signals:
    void portChanged();
    void hostChanged();
    void valueChanged(int);
    void pushedData();

public slots:
    void newConnection();
    void readDate();
    void closeConnection();

protected:
    void classBegin() override;
    void componentComplete() override;

    void timerEvent(QTimerEvent* event) override;

private:
    QTcpServer *m_server;
    QTcpSocket *m_sender;
    QVector <QTcpSocket *> m_sockets;

    int mPort = 7777;
    QString mHost = "127.0.0.1";
    int mValue = 0;
    MyModel* mModel = nullptr;
public:
    DataInfo* newData;

};

#endif // SERVERCONNECT_H
