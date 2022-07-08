#include "minicrt.h"

#ifdef WIN32
#include <Windows.h>
#endif
// entry.c
extern int main(int argc, char *argv[]); //申明程序员编写的程序中的main函数
void exit(int);

static void crt_fatal_error(const char *msg)
{
    // printf("fatal error:%s", msg);
    exit(1);
}

void mini_crt_entry(void)
{
    int ret;

#ifdef WIN32
    int flag = 0;
    int argc = 0;
    char *argv[16]; //最多16个参数

    int sequentialSpaceNum = 0;   //连续空格数目
    char *cl = GetCommandLineA(); //对于windows系统提供GetCommandLine这个API来返回整体命令行参数字符串

    //解析命令行
    argv[0] = cl;
    argc++;
    while (*cl)
    {
        if (*cl == '\"')
        { //在字符串中的空格是有效的字符，所以需要设计标识位
            if (flag == 0)
                flag = 1;
            else
                flag = 0;
        }

        //如果不是在字符串期间遇到空格，则需要剔除空格
        else if (*cl == ' ' && flag == 0)
        {
            sequentialSpaceNum = 1; //空格数目为1

            while (*(cl + sequentialSpaceNum) == ' ')
            {
                sequentialSpaceNum++;
            }

            if (*(cl + sequentialSpaceNum))
            {
                argv[argc] = cl + sequentialSpaceNum;
                argc++;
            }

            *cl = '\0';
            cl = cl + sequentialSpaceNum;
        }

        cl++;
    }

#else
    int argc;
    char **argv;
    char *ebp_reg;
    asm(" movl %%ebp, %0  \n\t"
        : "=r"(ebp_reg));

    argc = *(int *)(ebp_reg + 4);
    argv = (char **)(ebp_reg + 8);

#endif
    if (!mini_crt_init_heap())
        crt_fatal_error("heap initialize failed");
    if (!mini_crt_init_io())
        crt_fatal_error("IO initialize failed");
    ret = main(argc, argv);
    exit(ret);
}

void exit(int exitCode)
{
    // mini_crt_call_exit_routine();
#ifdef WIN32
    ExitProcess(exitCode);
#else
    asm("movl %0, %%ebx \n\t"
        "movl $1, %%eax \n\t"
        "int $0x80      \n\t"
        "hlt            \n\t" ::"m"(exitCode));
#endif
}