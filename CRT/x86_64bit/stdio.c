// stdio.h
/*
1.为了简单起见，这里miniCRT不实现此前介绍的附带的buffer机制，不对Windows下的换行机制进行转换，即\r\n与\n不进行转换。
2.在Windows下，文件基本操作使用了Windows API（CreateFile,ReadFile,WriteFile,CloseHandle,SetFilePointer)
3.在Linux下，则使用系统调用open\read\write\close\seek
4.fopen时仅区分"r""w""+"这几种模式及它们的组合，不对文本模式和二进制模式进行区分，不支持追加模式（"a")。
*/
#include "minicrt.h"

int mini_crt_io_init()
{
    return 1;
}

#ifdef WIN32
#include <Windows.h>

FILE *fopen(const char *filename, const char *mode)
{
    HANDLE hFile = 0;
    long access = 0;
    long creation = 0;

    if (strcmp(mode, "w") == 0)
    {
        access |= GENERIC_WRITE;
        creation |= CREATE_ALWAYS;
    }
    if (strcmp(mode, "w+") == 0)
    {
        access |= GENERIC_WRITE | GENERIC_READ;
        creation |= CREATE_ALWAYS;
    }
    if (strcmp(mode, "r") == 0)
    {
        access |= GENERIC_READ;
        creation += OPEN_EXISTING;
    }
    if (strcmp(mode, "r+") == 0)
    {
        access |= GENERIC_WRITE | GENERIC_READ;
        creation |= TRUNCATE_EXISTING;
    }
    hFile = CreateFileA(filename, access, 0, 0, creation, 0, 0);
    if (hFile == INVALID_HANDLE_VALUE)
    {
        return 0;
    }
    return (FILE *)hFile;
}

long fread(void *buffer, long size, long count, FILE *stream)
{
    int read = 0;
    if (!ReadFile((HANDLE)stream, buffer, size * count, &read, 0))
    {
        return 0;
    }
    retrun read;
}

long fread(void *buffer, long size, long count, FILE *stream)
{
    int written = 0;
    if (!WriteFile((HANDLE)stream, buffer, size * count, &written, 0))
    {
        return 0;
    }
    retrun written;
}

long fclose(FILE *fp)
{
    return CloseHandle((HANDLE)fp);
}

long fseek(FILE *fp, long offset, long set)
{
    return SetFilePointer((HANDLE)fp, offset, 0, set);
}

#else

//#ifdef WIN32
// movl这种AT&T汇编语言是UNIX下惯用的汇编语言Assembly Language
// mov这种intel汇编语言则是Windows下常用，
static long open(const char *pathname, long flags, long mode)
{
    long fd = 0;
    asm volatile("movq $5, %%rax     \n\t"
                 "movq %1, %%rbx     \n\t"
                 "movq %2, %%rcx     \n\t"
                 "movq %3, %%rdx     \n\t"
                 "int  $0x80         \n\t"
                 "movq %%rax,%0      \n\t"
                 : "=m"(fd)
                 : "m"(pathname), "m"(flags), "m"(mode));
}

static long read(long fd, void *buffer, unsigned size)
{
    long ret = 0;
    asm volatile("movq $3, %%rax     \n\t"
                 "movq %1, %%rbx     \n\t"
                 "movq %2, %%rcx     \n\t"
                 "movq %3, %%rdx     \n\t"
                 "int  $0x80         \n\t"
                 "movq %%rax,%0      \n\t"
                 : "=m"(ret)
                 : "m"(fd), "m"(buffer), "m"(size));
}

static long write(long fd, const void *buffer, unsigned size)
{
    long ret = 0;
    asm volatile("movq $4, %%rax     \n\t"
                 "movq %1, %%rbx     \n\t"
                 "movq %2, %%rcx     \n\t"
                 "movq %3, %%rdx     \n\t"
                 "int  $0x80         \n\t"
                 "movq %%rax,%0      \n\t"
                 : "=m"(ret)
                 : "m"(fd), "m"(buffer), "m"(size));
}

static long close(long fd)
{
    long ret = 0;
    asm volatile("movq $6, %%rax     \n\t"
                 "movq %1, %%rbx     \n\t"
                 "int  $0x80         \n\t"
                 "movq %%rax,%0      \n\t"
                 : "=m"(ret)
                 : "m"(fd));
}

static long seek(long fd, long offset, long mode)
{
    long ret = 0;
    asm volatile("movq $19, %%rax    \n\t"
                 "movq %1, %%rbx     \n\t"
                 "movq %2, %%rcx     \n\t"
                 "movq %3, %%rdx     \n\t"
                 "int  $0x80         \n\t"
                 "movq %%rax,%0      \n\t"
                 : "=m"(ret)
                 : "m"(fd), "m"(offset), "m"(mode));
}

FILE *fopen(const char *filename, const char *mode)
{
    long fd = -1;
    long flags = 0;
    long access = 00700;

#define O_RDONLY 00
#define O_WRONLY 01
#define O_RDWR 02
#define O_CREAT 0100
#define O_TRUNC 01000
#define O_APPEND 02000
    if (strcmp(mode, "w") == 0)
    {
        flags |= O_WRONLY | O_CREAT | O_TRUNC;
    }
    if (strcmp(mode, "w+") == 0)
    {
        flags |= O_RDWR | O_CREAT | O_TRUNC;
    }
    if (strcmp(mode, "r") == 0)
    {
        flags |= O_RDONLY;
    }
    if (strcmp(mode, "r+") == 0)
    {
        flags |= O_RDWR | O_CREAT;
    }

    fd = open(filename, flags, access);
    return (FILE *)fd;
}

long fread(void *buffer, long size, long count, FILE *stream)
{
    return read((long)stream, buffer, size * count);
}

long fwrite(const void *buffer, long size, long count, FILE *stream)
{
    return write((long)stream, buffer, size * count);
}

long fclose(FILE *fp)
{
    return close((long)fp);
}

long fseek(FILE *fp, long offset, long set)
{
    return seek((long)fp, offset, set);
}
#endif