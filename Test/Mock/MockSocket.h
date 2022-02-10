#ifndef MOCKSOCKET_H
#define MOCKSOCKET_H

#include <gmock/gmock.h>
#include <QTcpSocket>
#include <QObject>


class MockSocket : public QTcpSocket {
    Q_OBJECT
public:

    MOCK_METHOD(qint64, write, (const QByteArray &));
};

#endif // MOCKSOCKET_H
