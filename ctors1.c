#include <stdio.h>
void my_init(void)
{
  printf("hello ");
}

typedef void (*ctor_t)(void);
//- ����һ������ָ��
ctor_t __attribute__((section(".ctors"))) my_init_p = &my_init;

int main()
{
  printf("world!\n");
  return 0;
}