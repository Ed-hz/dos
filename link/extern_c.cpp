#include <stdio.h>

namespace myname{
    int var = 44;
}

extern "C" double _ZN6myname3varE;//namespace里的东西共享出来

////////////////////////
//判断是否为cpp的代码
#ifndef __cplusplus
extern "C" {
#endif
    void *memset(void *, int, size_t);
#ifndef __cplusplus
}
#endif
///////////////////////

int main(){
    printf("%d\n", _ZN6myname3varE);
    return 0;
}