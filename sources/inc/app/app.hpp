#pragma once

class A
{
    int x;
    int y;

    public:
    A() : x{1}, y{2} {}
    A(const int aX, const int aY) : x{aX}, y{aY} {}



    int GetX() const { return x; }
    int GetY() const { return y; }
};