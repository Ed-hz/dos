#include <stdio.h>

namespace myname{
    int var = 44;
}

extern "C" double _ZN6myname3varE;//namespace��Ķ����������

////////////////////////
//�ж��Ƿ�Ϊcpp�Ĵ���
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