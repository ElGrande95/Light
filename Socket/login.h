#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <logindatabase.h>

class LogIn : public QObject
{
    Q_OBJECT
public:
    explicit LogIn(QObject* parent = nullptr);
    Q_INVOKABLE bool tryLogIn(const QString &username, const QString &password);

private:
    LogInDatabase* mBase;

};

#endif // LOGIN_H
