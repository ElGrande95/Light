#include "login.h"
#include <QSqlQuery>
#include <QDir>
#include <QVariant>

LogIn::LogIn(QObject* parent)
    :QObject(parent)
{
   mBase = new LogInDatabase("../../Light/Socket/Database/LogIn");
   mBase->connectOpen();
}

bool LogIn::tryLogIn(const QString &username, const QString &password)
{
    bool indicator = false;
    {

    QSqlQuery query("SELECT * FROM LogIn");

    while (query.next()) {
        QString user = query.value(1).toString();
        QString pass = query.value(2).toString();

        if(user == username && pass == password) {
            indicator = true;
            break;
        }
    }
    }

    return indicator;
}
