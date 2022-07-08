#include "minicrt.h"
/*
cl /c /DWIN32 /GS- entry.c malloc.c printf.c stdio.c string.c
lib entry.obj malloc.obj printf.obj stdio.obj string.obj /OUT:minicrt.lib
cl /c /DWIN32 test.c
link test.obj minicrt.lib kernel32.lib /NODEFAULTLIB /entry:mini_crt_entry
- /DWIN32������cl�ĺ궨�幦�ܣ�������WIN32����꣬���Ǵ���������ƽ̨�Ĺؼ��ꣻ
- /GS-���رն�ջ�������ܣ�����������ӽضϷ�����_security_cookie���͡�_security_check_cookie������δ�������
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
-fno-builtin�������ر�GCC�����ú������ܣ�Ĭ�������GCC���strlen\strcmp�Ⱥ���չ�������ڲ���ʵ�֣�
-nostdlib����ʾ�������κ�����Glibc��GCC�Ŀ��ļ��������ļ�����������-nostartfiles���������
-fno-stack-protector���رն�ջ�������ܣ����°汾��GCC�ڴ���䳤��������������»�Ҫ��ʵ�ֶԶ�ջ�ı���������
- ����ϵͳ��64λubuntu���ʶ���Ҫ������ע��-m32��m elf_i386��
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