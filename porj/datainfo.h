#ifndef DATAINFO_H
#define DATAINFO_H

#include <QString>
#include <QObject>

class DataInfo
{
public:

    explicit DataInfo();
    explicit DataInfo(const QString& name, const QString& src, const QString& color, const bool& isOn, const int& intensity);


    QString name;
    QString src;
    QString color;
    bool isOn;
    int intensity;
};

#endif // DATAINFO_H

