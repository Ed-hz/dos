#bin/sh
gcc -c -m32 -fno-builtin -nostdlib  -ggdb entry.c stdio.c string.c print.c malloc.c
ar -rs minicrt.a malloc.o print.o stdio.o string.o entry.o

gcc -m32 -c -ggdb -fno-builtin -nostdlib test.c
ld -static -e mini_crt_entry entry.o test.o minicrt.a -o test -m elf_i386
