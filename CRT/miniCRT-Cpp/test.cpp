// test.cpp
/*
cl /c /DWIN32 /GS- entry.c malloc.c printf.c stdio.c string.c atexit.c
cl /c /DWIN32 /GS- /GR- crtbegin.cpp crtend.cpp ctor.cpp new_delete.cpp iostream.cpp
lib entry.obj malloc.obj printf.obj stdio.obj string.obj ctor.obj new_delete.obj atexit.obj iostream.obj /OUT:minicrt.lib
- /GR-，关闭RTTI功能，否则编译器会为有虚函数的类产生RTTI相关代码，在最终链接时会看到“const type_ info::vftable"符号
cl /c /DWIN32 /GR- test.cpp
link test.obj minicrt.1ib kerne132.1ib /NODEFAULTLIB /entry:mini_crt_entry
*/
/*
gcc -C -fno-builtin -nostdlib -fno-stack-protector entry.c malloc.c gtdio.c string.c printf.c atexit.c
g++ -C -nostdinc++ -fno-rtti -fno-exceptions -fno-builtin -nostdlib -fno-stack-protector crtbegin.cpp crtend.cpp Ctor.cpp new_ delete.cpp
sysdep.cpp iostream.cpp sysdep. cpp
ar -rs minicrt.a malloc.o printf.o stdio.o string.o ctor.o atexit.o
iostream.o new_delete.o sysdep.o
-fno-rtti 的作用与cl的/GR-作用一样，用于关闭RTTI。
-fno-exceptions的作用用于关闭异常支持，否则GCC会产生异常支持代码，可能导致链接错误。
g++ -c -nostdinc++ -fno-rtti -fno-exceptiong -fno-builtin -nostdlib -fno-stack-protector test.cpp
ld -static -e mini_crt_entry entry.o crtbegin.o test.o minicrt.a crtend.o -o test
*/
#include <iostream>
#include <string>
using namespace std;

int main(int argc, char *argv[])
{
  string *msg = new string("Hello World");
  cout << *msg << endl;
  delete msg;
  return 0;
}
