#include <gtest/gtest.h>
#include "app/app.hpp"

TEST (APP_TEST, GetXDefault )
{
    A a;

    EXPECT_EQ( 1, a.GetX() );
}

TEST (APP_TEST, GetXAssigned )
{
    A a{10, 20};

    EXPECT_EQ( 10, a.GetX() );
}

