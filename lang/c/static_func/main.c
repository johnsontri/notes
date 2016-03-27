#include "foo.h"
#ifdef BROKEN
    #define FUNC g
#else
    #define FUNC f
#endif


int main(int argc, char *argv[])
{
    FUNC();
    return 0;
}
