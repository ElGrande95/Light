#include "logindatabase.h"
#include <QDebug>
#include <QSqlQuery>
#include <QVariant>

LogInDatabase::LogInDatabase(const QString &path)
    :mPath(path)
{
}

int LogInDatabase::deleteInBase(const QString &username)
{

    if (username == "Admin")
        return 0;

    QSqlQuery query ("SELECT * FROM LogIn");
    int indicator = 1;

    while (query.next()) {

        QString user = query.value(1).toString();

        if(user == username) {
            indicator = 2;
            break;
        }
    }

    query.prepare("delete from LogIn where username =  '"+username+"' ");

    if(!query.exec()) {
        indicator = 1;
    }

    return indicator;

}

bool LogInDatabase::insertInBase(const QString &username, const QString &password)
{
    int idNumber = 0;

    QSqlQuery query("SELECT * FROM LogIn "
                    "order by Id");
    bool indicator = true;

    while (query.next()) {

        QString user = query.value(1).toString();
        int currentId = query.value(0).toInt();

        if(user == username) {
            indicator = false;
            qDebug() << indicator;
            break;
        }

        if(idNumber == currentId) {
            idNumber++;
        }
    }

    query.clear();

    if(indicator){

        query.prepare("INSERT INTO LogIn (id, username, password) "
                      "VALUES (:id, :username, :password)");
        query.bindValue(0, idNumber);
        query.bindValue(1, username);
        query.bindValue(2, password);

        if(!query.exec()) {
            indicator = false;
        }
    }

    return indicator;
}

void LogInDatabase::connectClose()
{
    db.close();
    db.removeDatabase(QSqlDatabase::defaultConnection);
    qDebug() << "Close database connection";

}

bool LogInDatabase::connectOpen()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(mPath);
    if(!db.open()){
        qDebug() << "Faild database connection";
        return false;
    }
    else {
        qDebug() << "Succes database connection";
        return true;
    }
}
