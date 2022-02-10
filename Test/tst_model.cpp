#include "../porj/mymodel.h"
#include <gmock/gmock.h>

class MockModel : public MyModel {

public:

    MockModel() {

        ON_CALL(*this, insertLight).WillByDefault([this](int n) {
          return ChangeInsertLight(n);
        });

        }
    int ChangeInsertLight (int index) {
        mModel.insertLight(index);
        return mModel.mData.size();
    }

    MOCK_METHOD(int, insertLight, (int));

public:
    MyModel mModel;
};

using ::testing::_;
using ::testing::Return;
using ::testing::Ge;

TEST(MockModel, insertLight) {
    MockModel model;

    EXPECT_CALL(model, insertLight(Ge(-1)))
      .Times(1);

    EXPECT_EQ(4, model.insertLight(0));
}
