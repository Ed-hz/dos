// gcc -fPIC -shared -o Lib.so Lib.c
// gcc -o p1.exe p1.c ./lib.so
// gcc -o p2.exe p2.c ./lib.so
#include "lib.h"
int main()
{
  foobar(1);
  return 1;
}