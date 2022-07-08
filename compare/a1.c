/*
gcc -fPIC -shared a1.c -o a1.so
gcc -fPIC -shared a2.c -o a2.so
gcc -fPIC -shared b1.c a1.so -o b1.so
gcc -fPIC -shared b2.c a2.so -o b2.so
ldd b1.so
ldd b2.so
*/
#include <stdio.h>
void a()
{
  printf("a1.c\n");
}