#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractListModel>
#include <QVector>
#include <QObject>
#include "datainfo.h"
#include <QJsonDocument>

class MyModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit MyModel(QAbstractListModel* parent = nullptr);

    enum ModelRols {
        NAME = Qt::UserRole,
        SRC,
        COLOR,
        ISON,
        INTENSITY
    };

    Q_INVOKABLE void insertLight(const int& index);

    void makeModel(const QString& myJson);
    Q_INVOKABLE int rolsIsOn () const;

public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

    void timerEvent(QTimerEvent* event) override;

    void setNewData(DataInfo *newNewData);

public:
    QVector <DataInfo*> mData;
    DataInfo* newData;
};

#endif // MYMODEL_H
