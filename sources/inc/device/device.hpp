#pragma once
#include <iostream>

class IDevice
{
  public:
    IDevice(){};
    virtual ~IDevice(){};
};

class Device : public IDevice
{
  public:
    Device();
    virtual ~Device();
};
