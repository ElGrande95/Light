#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>
#include "../porj/serverconnect.h"
#include <gmock/gmock.h>

using ::testing::Return;

class ServetTest : public ::testing::Test {
protected:

    ServetTest(){}
    ~ServetTest() override {
    }

    void SetUp() override {
        _server = new ServerConnect();
    }
    void TearDown() override {

        delete _server;
    }

public:
    ServerConnect* _server;
};

TEST_F(ServetTest, serverData) {

    EXPECT_EQ("127.0.0.1", _server->host());
    EXPECT_EQ(7777, _server->port());
}
