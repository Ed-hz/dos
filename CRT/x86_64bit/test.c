#include "minicrt.h"
/*
cl /c /DWIN32 /GS- entry.c malloc.c printf.c stdio.c string.c
lib entry.obj malloc.obj printf.obj stdio.obj string.obj /OUT:minicrt.lib
cl /c /DWIN32 test.c
link test.obj minicrt.lib kernel32.lib /NODEFAULTLIB /entry:mini_crt_entry
- /DWIN32：启用cl的宏定义功能，即定义WIN32这个宏，这是代码中区分平台的关键宏；
- /GS-：关闭堆栈保护功能，否则会在链接截断发生”_security_cookie”和”_security_check_cookie”符号未定义错误。
c1 /c /DWIN32 test.c
link test.obj minicrt.1ib kernel32.1ib /NODEFAULTLIB /entry:mini_crt_entry
dir test.exe
dumpbin /IMPORTS test.exe
./test.exe arg1 arg2 123
*/
/*
gcc -c -fno-builtin -nostdlib -fno-stack-protector entry.c malloc.c stdio.c string.c printf.c -m32 -g
gcc -c -ggdb -fno-builtin -nostdlib -fno-stack-protector test.c -m32 -g
ar -rs minicrt.a malloc.o printf.o stdio.o string.o
ld -static -e mini_crt_entry entry.o test.o minicrt.a -o test -m elf_i386
-fno-builtin参数：关闭GCC的内置函数功能，默认情况下GCC会把strlen\strcmp等函数展开成它内部的实现；
-nostdlib：表示不适用任何来自Glibc、GCC的库文件和启动文件，它包含了-nostartfiles这个参数；
-fno-stack-protector：关闭堆栈保护功能，最新版本的GCC在处理变长参数函数的情况下会要求实现对堆栈的保护函数；
- 由于系统是64位ubuntu，故而需要在上面注明-m32或m elf_i386。
gcc -c -ggdb -fno-builtin nostdlib -fno-stack-protector test.c
sia -static -e mini_crt_entry entry.o test.o minicrt.a -o test
l8 -l test
./test arg1 arg2 123
*/
int main(int argc, char *argv[])
{
    printf("xxx");
    int i;
    FILE *fp;
    char **v = (char **)malloc(argc * sizeof(char *));
    char **tempArgv = argv;
    int tempArgc = argc;

    for (i = 0; i < argc; ++i)
    {
        v[i] = (char *)malloc(strlen(tempArgv[i]) + 1);
        strcpy(v[i], tempArgv[i]);
    }

    fp = fopen("test.txt", "w");
    for (i = 0; i < tempArgc; ++i)
    {
        int len = strlen(v[i]);
        fwrite(&len, 1, sizeof(int), fp);
        fwrite(v[i], 1, len, fp);
    }
    fclose(fp);

    fp = fopen("test.txt", "r");
    for (i = 0; i < tempArgc; ++i)
    {
        int len;
        char *buf;
        fread(&len, 1, sizeof(int), fp);
        buf = (char *)malloc(len + 1);
        fread(buf, 1, len, fp);
        buf[len] = '\0';
        printf("%d %s\n", len, buf);
        free(buf);
        free(v[i]);
    }
    fclose(fp);
}