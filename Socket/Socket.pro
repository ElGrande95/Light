QT += quick
QT += network
CONFIG += c++11
QT += core
QT += sql

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    ../porj/datainfo.h \
    login.h \
    logindatabase.h \
    socketconnect.h \
    socketworker.h

SOURCES += \
        ../porj/datainfo.cpp \
        login.cpp \
        logindatabase.cpp \
        main.cpp \
        socketconnect.cpp \
        socketworker.cpp

RESOURCES += qml.qrc \
    imgs.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=
