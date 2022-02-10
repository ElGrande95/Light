include(gtest_dependency.pri)

QT += quick
CONFIG += c++11
QT += network

TARGET = Tests

QT += testlib #Include QtTest to use SignalSpy, QTest::mouseClick, etc
CONFIG += testcase #Creates 'check' target in Makefile.

TEMPLATE = app
CONFIG += console
CONFIG += thread

SOURCES += \
        ../Socket/socketworker.cpp \
        ../porj/datainfo.cpp \
        ../porj/mymodel.cpp \
        ../porj/serverconnect.cpp \
        ../Socket/socketconnect.cpp \
        main.cpp \
        tst_case1.cpp \
        tst_model.cpp \
        tst_server.cpp \
        tst_socket.cpp \
        tst_soket_worker.cpp

HEADERS += \
    ../Socket/socketworker.h \
    ../porj/datainfo.h \
    ../porj/mymodel.h \
    ../porj/serverconnect.h \
    ../Socket/socketconnect.h \
    Mock/MockSocket.h

RESOURCES += \
    json.qrc
