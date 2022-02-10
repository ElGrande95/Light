#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <QThread>
#include <QCoreApplication>
#include <QSharedPointer>

static void ExecuteGTest()
{
    const int iRes = RUN_ALL_TESTS();
    QCoreApplication::exit(iRes);
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleMock(&argc, argv);
    ::testing::InitGoogleTest(&argc, argv);

    QCoreApplication app(argc, argv);

    auto pGTest = QSharedPointer<QThread>(QThread::create(ExecuteGTest));
    pGTest->start();

    return app.exec();
}

