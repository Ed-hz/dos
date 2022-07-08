#include <stdio.h>

extern int ext;

//在多个文件里有重名时用弱引用
int weak;//弱符号，未初始化
int strong = 1;//强符号，初始化
__attribute__((weak)) int weak2 = 2; //手动弱符号
__attribute__((weakref)) void foo();
// * 强符号只能定义一次
// * 同一个符号名在不同文件中强符号覆盖弱符号
// * 不同文件中弱符号采用占用空间最大的
// ? 强引用必须正确
// ? 弱引用在有定义时决议，无定义时不报错

int main(){
    return 0;
    foo();
}