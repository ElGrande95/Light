#include "mymodel.h"
#include <QJsonArray>
#include <QJsonObject>
#include <QFile>

bool MyModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!hasIndex(index.row(), index.column(), index.parent()) || !value.isValid())
        return false;

    DataInfo *item = mData[index.row()];

    if (role == NAME)
        item->name = value.toString();
    else if (role == SRC)
        item->src = value.toString();
    else if (role == COLOR)
        item->color = value.toString();
    else if (role == ISON)
        item->isOn = value.toBool();
    else if (role == INTENSITY)
        item->intensity = value.toInt();
    else
        return false;

    emit dataChanged(index, index, { role } );

    return true ;
}

void MyModel::timerEvent(QTimerEvent *event)
{
    Q_UNUSED(event)
    insertLight(mData.length());
}

void MyModel::setNewData(DataInfo *newNewData)
{
    newData = newNewData;
}

MyModel::MyModel(QAbstractListModel *parent)
    :QAbstractListModel(parent), newData(new DataInfo())
{
    makeModel(":/json/initialData.json");
}

void MyModel::makeModel(const QString& myJson)
{
    QString val;
    QFile file;
    file.setFileName(myJson);

    file.open(QIODevice::ReadOnly | QIODevice::Text);
    val = file.readAll();
    file.close();

    QJsonDocument jsonDocument = QJsonDocument::fromJson(val.toUtf8());

    QJsonArray jsonArray = jsonDocument.array();

    if(jsonArray.isEmpty()){
        return;
    }

    for (int index = 0; index < jsonArray.size(); ++index) {
        QJsonObject jsonObject = jsonArray[index].toObject();
        DataInfo* data = new DataInfo (jsonObject.value("name").toString(),jsonObject.value("imageURL").toString(),
                                       jsonObject.value("color").toString(), jsonObject.value("isOn").toBool(),
                                       jsonObject.value("intensity").toInt());
        mData.push_back(data);
    }

    startTimer(3000);
}

int MyModel::rolsIsOn() const
{
    return ModelRols(ISON);
}

void MyModel::insertLight(const int& index)
{
    beginInsertRows(QModelIndex(), index, index);
    mData.insert(index, newData);
    endInsertRows();
}

int MyModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return mData.size();
}

QVariant MyModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    switch (role) {
    case ModelRols::NAME:
        return mData[row]->name;
        break;

    case ModelRols::SRC:
        return mData[row]->src;
        break;

    case ModelRols::COLOR:
        return mData[row]->color;
        break;

    case ModelRols::ISON:
        return mData[row]->isOn;
        break;

    case ModelRols::INTENSITY:
        return mData[row]->intensity;
        break;

    }
    return QVariant();
}

QHash<int, QByteArray> MyModel::roleNames() const
{
    QHash <int, QByteArray> hash = QAbstractListModel::roleNames();
    hash[ModelRols::NAME] = "name";
    hash[ModelRols::SRC] = "src";
    hash[ModelRols::COLOR] = "color";
    hash[ModelRols::ISON] = "isOn";
    hash[ModelRols::INTENSITY] = "intensity";

    return hash;
}
