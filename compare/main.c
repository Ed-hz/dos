// gcc main.c b1.so b2.so -o main.exe -Xlinker -rpath ./
#include <stdio.h>

void b1();
void b2();
int main()
{
  b1();
  b2();
  return 0;
}