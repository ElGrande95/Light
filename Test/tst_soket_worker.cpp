#include <gtest/gtest.h>
#include "Mock/MockSocket.h"
#include "../Socket/socketworker.h"
#include "../porj/datainfo.h"

using namespace::testing;

class SocketWorkerTest : public Test {
protected:

    void SetUp() override {
        m_socket = new NiceMock<MockSocket>();
        m_socket->connectToHost("127.0.0.1", 7777);
        _worker = new SocketWorker(m_socket);
    }
    void TearDown() override {

        delete _worker;
        delete m_socket;
    }

    NiceMock<MockSocket>* m_socket;

public:
    SocketWorker* _worker;
};

TEST_F(SocketWorkerTest, workData) {

    EXPECT_EQ("127.0.0.1", _worker->mHost);
    EXPECT_EQ(7777, _worker->mPort);
}

TEST_F(SocketWorkerTest, pushOnServer) {

    EXPECT_EQ(155, _worker->doWork(new DataInfo()));
}
