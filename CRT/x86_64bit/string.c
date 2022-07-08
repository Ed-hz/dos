/*这部分实现的是字符串相关的操作，主要是包括计算字符串长度、比较两个字符串、整数与字符串之间的转换等，由于这部分无需涉及任何和内核的交互，是纯粹的用户态的计算。实现较为简单*/
#include "minicrt.h"

char *itoa(int n, char *str, int radix)
{
    char digit[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    char *p = str;
    char *head = str;

    if (!p || radix < 2 || radix > 36) // radix代表是几进制
        return p;
    if (radix != 10 && n < 0)
        return p;

    if (n == 0) //如果要转换的数字n为0，则直接在输出字符串中直接输出
    {
        *p++ = '0';
        *p = 0;
        return p;
    }
    if (radix == 10 && n < 0) //如果是10进制，且为负数，则先添加负号，然后转正留待后续处理
    {
        *p++ = '-';
        n = -n;
    }

    while (n)
    {
        *p++ = digit[n % radix];
        n /= radix;
    }
    *p = 0; //数字转换完了，末尾添加0

    //上面的数字字符串是倒序的，这里将数字字符串倒过来
    for (--p; head < p; ++head, --p)
    {
        char temp = *head;
        *head = *p;
        *p = temp;
    }
    return str;
}

int strcmp(const char *src, const char *dst)
{
    int ret = 0;
    unsigned char *p1 = (unsigned char *)src;
    unsigned char *p2 = (unsigned char *)dst;
    while (!(ret = *p1 - *p2) && *p2)
    {
        ++p1, ++p2;
    }

    if (ret < 0)
        ret = -1;
    else if (ret > 0)
        ret = 1;
    return (ret);
}

char *strcpy(char *dest, const char *src)
{
    char *ret = dest;
    while (*src)
        *dest++ = *src++;
    *dest = '\0'; //字符串拷贝完后，手动在末尾添加\0
    return ret;   //返回copy后的字符串的首
}

unsigned strlen(const char *str)
{
    int cnt = 0;

    if (!str)
        return 0;

    for (; (int)*str != 204 && *str != '\0'; ++str)
    {
        // printf("inside the for-loop %d\n", cnt);
        ++cnt;
    }

    // printf("in the strlen return %d\n", cnt);
    return cnt;
}

int fputc(int c, FILE *stream)
{
    if (fwrite(&c, 1, 1, stream) != 1)
        return EOF;
    else
        return c;
}

int fputs(const char *str, FILE *stream)
{
    //  fputc('\n', stream);
    int len = strlen(str);
    if (fwrite(str, 1, len, stream) != len)
        return EOF;
    else
        return len;
}