#ifndef __MINI_CRT_H__
#define __MINI_CRT_H__

/*����C++��صĺ�������ʹ�ú����ļ����Եõ����㣬�������ɰ���C�����ι��������е������������Σ���ʹ��extern "C"*/
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

  //�ַ���
  char *itoa(long n, char *str, long radix);
  long strcmp(const char *src, const char *dst);
  char *strcpy(char *dst, const char *src);
  unsigned strlen(const char *str);

  //�ļ���IO
  typedef int FILE;
#define EOF (-1)

/*FILE* ���������Windows��ʵ�������ں˾����Ҫͨ��GetStdHandle��Windows API���
����Linux�������ļ�����������׼���������0,1,2��������ָ��FILE�ṹ�ĵ�ַ*/
#ifdef WIN32
#define stdin ((FILE *)(GetStdHandle(STD_INPUT_HANDLE)))
#define stdout ((FILE *)(GetStdHandle(STD_OUTPUT_HANDLE)))
#define stderr ((FILE *)(GetStdHandle(STD_ERROR_HANDLE)))
#else
#define stdin ((FILE *)0)
#define stdout ((FILE *)1)
#define stderr ((FILE *)2)
#endif

  //ʡ���˻����������ݣ�miniCRT��IO���������ʼ��������������ļ��б���пռ���䣩���ʶ����������ʵ���Ǹ��պ���
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
