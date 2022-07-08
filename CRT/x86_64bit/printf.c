#include "minicrt.h"

static char __fputc_tmp_val__ = 0;
long fputc(char c, FILE *stream)
{
    __fputc_tmp_val__ = c;
    if (fwrite(&__fputc_tmp_val__, 1, 1, stream) != 1)
    {
        return EOF;
    }
    else
    {
        return c;
    }
}

static char __fputs_tmp_array__[256] = {0};
static int __fputs_tmp_size__ = 256;
long fputs(const char *str, FILE *stream)
{
    int len = strlen(str);
    if (fwrite(str, 1, len, stream) != len)
    {
        return EOF;
    }
    else
    {
        return len;
    }
}

#ifndef WIN32
#define va_list char *
#define va_start(ap, arg) (ap = (va_list)&arg + sizeof(arg))
#define va_arg(ap, t) (*(t *)((ap += sizeof(t)) - sizeof(t)))
#define va_end(ap) (ap = (va_list)0)
#else
#include "Windows.h"
#endif

// Mini CRT 中并不支持特殊的格式操作，仅支持%d和%s两种简单的转换
long vfprintf(FILE *stream, const char *format, va_list arglist)
{
    int translating = 0;
    int ret = 0; //记录最终输出的字符个数
    const char *p = 0;

    //  fputs("***********entry the Vprintf*********\n",stream);

    for (p = format; *p && *p != '\0'; ++p)
    {
        switch (*p)
        {
        case '%':
            if (!translating)
                translating = 1; // translating置为1，代表后面的字符需要解析
            else
            {
                if (fputc('%', stream) < 0)
                    return EOF;
                ++ret;
                translating = 0;
            }
            break;
        case 'd':
            if (translating) //%d
            {
                char buf[16] = {0};
                translating = 0;
                itoa(va_arg(arglist, int), buf, 10);
                if (fputs(buf, stream) < 0)
                    return EOF;
                ret += strlen(buf);
                free(buf);
                // buf = 0;
            }
            else if (fputc('d', stream) < 0)
                return EOF;
            else
                ++ret;
            break;
        case 's':
            if (translating) //%s
            {
                const char *str = va_arg(arglist, const char *);
                translating = 0;
                if (fputs(str, stream) < 0)
                    return EOF;
                ret += strlen(str);
            }
            else if (fputc('s', stream) < 0)
                return EOF;
            else
                ++ret;
            break;
        default:
            if (translating)
                translating = 0;
            if (fputc(*p, stream) < 0)
                return EOF;
            else
                ++ret;
            break;
        }
    }
    //  fputs("************Get out the Vprintf*****************\n", stream);
    return ret;
}

long printf(const char *format, ...)
{
    // fputs("entry the printf*************\n", stdout);
    va_list(arglist);
    va_start(arglist, format);
    return vfprintf(stdout, format, arglist);
}

long fprintf(FILE *stream, const char *format, ...)
{
    va_list(arglist);
    va_start(arglist, format);
    return vfprintf(stream, format, arglist);
}