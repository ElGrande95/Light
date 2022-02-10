#include <gtest/gtest.h>
#include "../Socket/socketconnect.h"

using namespace::testing;

class SocketTest : public Test {
protected:

    SocketTest(){}
    ~SocketTest() override {
    }

    void SetUp() override {
        _socket = new SocketConnect();
    }
    void TearDown() override {

        delete _socket;
    }
public:

    SocketConnect* _socket;
};

TEST_F(SocketTest, socketData) {

    EXPECT_EQ("127.0.0.1", _socket->mHost);
    EXPECT_EQ(7777, _socket->mPort);
}
