#ifndef LOGINDATABASE_H
#define LOGINDATABASE_H

#include <QSqlDatabase>
#include <QObject>

class LogInDatabase : public QObject
{
    Q_OBJECT
public:
    explicit LogInDatabase(const QString &path = "");

    Q_INVOKABLE int deleteInBase(const QString& username);
    Q_INVOKABLE bool insertInBase(const QString& username, const QString& password);

    void connectClose();
    bool connectOpen();

private:
    QString mPath;
    QSqlDatabase db;
};

#endif // LOGINDATABASE_H
