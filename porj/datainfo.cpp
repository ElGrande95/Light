#include "datainfo.h"

DataInfo::DataInfo()
{
    name = "color light";
    src = "/imgs/imgs/idea.png";
    color = "red";
    isOn = true;
    intensity = 50;
}

DataInfo::DataInfo(const QString &name, const QString &src, const QString &color, const bool &isOn, const int &intensity)
    :name(name), src(src), color(color), isOn(isOn), intensity(intensity)
{

}
