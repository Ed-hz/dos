#ifndef __MINI_CRT_H__
#define __MINI_CRT_H__

/*定义C++相关的函数，以使得函数的兼容性得到满足，但是依旧按照C的修饰规则来进行导出函数名修饰，即使用extern "C"*/
#ifdef __cplusplus
extern "C"
{
#endif

// malloc
#ifndef NULL
#define NULL (0)
#endif

  void free(void *ptr);
  void *malloc(unsigned size);
  static long brk(void *end_data_segment);
  int mini_crt_heap_init();

  //字符串
  char *itoa(long n, char *str, long radix);
  long strcmp(const char *src, const char *dst);
  char *strcpy(char *dst, const char *src);
  unsigned strlen(const char *str);

  //文件与IO
  typedef int FILE;
#define EOF (-1)

/*FILE* 这个类型在Windows下实际上是内核句柄，要通过GetStdHandle的Windows API获得
而在Linux下则是文件描述符，标准输入输出是0,1,2，并不是指向FILE结构的地址*/
#ifdef WIN32
#define stdin ((FILE *)(GetStdHandle(STD_INPUT_HANDLE)))
#define stdout ((FILE *)(GetStdHandle(STD_OUTPUT_HANDLE)))
#define stderr ((FILE *)(GetStdHandle(STD_ERROR_HANDLE)))
#else
#define stdin ((FILE *)0)
#define stdout ((FILE *)1)
#define stderr ((FILE *)2)
#endif

  //省略了缓冲等诸多内容，miniCRT的IO基本无需初始化（即无需给打开文件列表进行空间分配），故而这个函数其实就是个空函数
  int mini_crt_heap_init();
  int mini_crt_io_init();
  FILE *fopen(const char *filename, const char *mode);
  long fread(void *buffer, long size, long count, FILE *stream);
  long fwrite(const void *buffer, long size, long count, FILE *stream);
  long fclose(FILE *fp);
  long fseek(FILE *fp, long offset, long set);

  // printf
  long fputc(char c, FILE *stream);
  long fputs(const char *str, FILE *stream);
  long printf(const char *format, ...);
  long fprintf(FILE *stream, const char *format, ...);

  // internal
  void do_global_ctors();
  void mini_crt_call_exit_routine();

  // atexit
  typedef void (*atexit_func_t)(void);
  long atexit(atexit_func_t func);

#ifdef __cplusplus
}
#endif

#endif
