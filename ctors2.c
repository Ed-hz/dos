#include <stdio.h>

void my_init(void) __attribute__((constructor));
void my_init(void)
{
  printf("hello ");
}

int main()
{
  printf("world!\n");
  return 0;
}