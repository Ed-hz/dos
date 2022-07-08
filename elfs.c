#include "elf.h"
#include <stdio.h>
int main(int argc, char *argv[])
{
  int *P = (int *)argv;
  int i;
  Elf32_auxv_t *aux;

  printf("Argument count; %d\n", *(p - 1));

  for (i = 0; i < *(p - 1); ++i)
  {
    printf("Argument count : %d\n", *(p + i));
  }

  p += 1;
  p++; // skip 0
  printf("Environment:\n");
  while (*p)
  {
    printf("%s\n", *p);
    p++;
  }

  p++; // skip 0

  printf("Auxiliary Vectors:\n");
  aux = (Elf32_auxv_t *)p;
  while (aux->a_type != AT_NULL)
  {
    printf("Type: %02d Value: %x\n", aux->a_type, aux->a_un.a_val);
    aux++;
  }
  return 0;
}