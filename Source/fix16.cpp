#include "Function.hpp"
#include "fix16.hpp"

MATCH_FUNC(0x4369F0)
Fix16& Fix16::FromInt_4369F0(int a2)
{
    mValue = a2 << 14;
    return *this;
}
