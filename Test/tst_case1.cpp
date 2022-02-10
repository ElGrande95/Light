#include <gtest/gtest.h>
#include "../porj/mymodel.h"
#include <QSignalSpy>
#include <QThread>

class ModelTest : public ::testing::Test {
protected:

    void SetUp() override {
        _model = new MyModel();
    }
    void TearDown() override {
        delete _model;
    }

    MyModel* _model;
};

TEST_F(ModelTest, nameValid) {

    int i;
    bool check = true;
    for (i=0; i < _model->mData.size(); i++) {
        if( !(_model->mData[i]->name == "dimmable light" ||  _model->mData[i]->name == "color light"
             || _model->mData[i]->name == "on/off")) {
            check = false;
            break;
        }
    }

    EXPECT_EQ(check, true)  << "Error in " << i << " delegat!";
}

TEST_F(ModelTest, emitDataChanged) {

    QSignalSpy spy(_model, SIGNAL(dataChanged(QModelIndex, QModelIndex, QVector<int> )));

    _model->setData( _model->index(0), true, _model->rolsIsOn());
    EXPECT_EQ(1,spy.count());
}

TEST_F(ModelTest, insertSize) {

    int num1 = _model->mData.size();
    _model->insertLight(1);
    int num2 = _model->mData.size();


    EXPECT_EQ(num1, num2-1);
}

TEST_F(ModelTest, dimmableLight_Src) {

    int i;
    bool check = true;
    for (i=0; i < _model->mData.size(); i++) {
        if( (_model->mData[i]->name == "dimmable light" && _model->mData[i]->src != "/imgs/imgs/bulb.png")) {
            check = false;
            break;
        }
    }

    EXPECT_EQ(check, true) << "Error in " << i << " delegat!";
}

TEST_F(ModelTest, onOff_Src) {

    int i;
    bool check = true;
    for (i=0; i < _model->mData.size(); i++) {
        if( (_model->mData[i]->name == "on/off" && _model->mData[i]->src != "/imgs/imgs/light-bulb.png")) {
            check = false;
            break;
        }
    }

    EXPECT_EQ(check, true) << "Error in " << i << " delegat!";
}

TEST_F(ModelTest, colorLight_Src) {

    int i;
    bool check = true;
    for (i=0; i < _model->mData.size(); i++) {
        if( (_model->mData[i]->name == "color light" && _model->mData[i]->src != "/imgs/imgs/idea.png")) {
            check = false;
            break;
        }
    }

    EXPECT_EQ(check, true) << "Error in " << i << " delegat!";
}
