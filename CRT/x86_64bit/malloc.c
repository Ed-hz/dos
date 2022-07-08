//�ѵ�ʵ��
/*����ѭMini CRT��ԭ���£����ǽ�Mini CRT�ѵ�ʵ�ֹ���Ϊ���¼���
1.ʵ��һ���Կ��������㷨Ϊ�����Ķѿռ�����㷨��
2.Ϊ�˼�������ѿռ��С�̶�Ϊ32MB����ʼ����ռ䲻����չ����С��
3.��Windowsƽ̨�²�����HeapAlloc�ȶѷ����㷨������VirtualAlloc ��ϵͳֱ������32MB�ռ䣬�������Լ��Ķѷ����㷨ʵ��malloc
4.��Linuxƽ̨�£�ʹ��brk�����ݶν�����ַ������32MB�������ռ���Ϊ�ѿռ�
*/
/*
 brkϵͳ���ÿ������ý��̵����ݶ�.data�߽磬��sbrk�����ƶ����̵����ݶα߽磬��Ȼ��������ݶα߽���ƣ����൱�ڷ�����һ�������ڴ档��������ڴ��ʼֻ�Ƿ���������ռ䣬��Щ�ռ������һ��ʼ�ǲ����ύ�ģ��������������ҳ�棩��������ʦͽ����һ����ַ��ʱ�򣬲���ϵͳ���⵽ҳȱ���쳣���Ӷ���Ϊ�����ʵĵ�ַ���ڵ�ҳ��������ҳ�档
�ʶ����ֱ�����������䣬�ֱ���Ϊ����̤���䣬�����򲻶���
*/
#include "minicrt.h"

typedef struct _heap_header
{
    enum
    {
        HEAP_BLOCK_FREE = 0xABABABAB, //���п��ħ��
        HEAP_BLOCK_USED = 0xCDCDCDCD, //ռ�ÿ��ħ��
    } type;

    unsigned size; //��ĳߴ���������Ϣͷ
    struct _heap_header *next;
    struct _heap_header *prev;
} heap_header;

#define ADDR_ADD(a, o) (((char *)(a)) + o)
#define HEADER_SIZE (sizeof(heap_header))

static heap_header *list_head = NULL;

void free(void *ptr)
{
    heap_header *header = (heap_header *)ADDR_ADD(ptr, -HEADER_SIZE);
    if (header->type != HEAP_BLOCK_USED)
        return;

    header->type = HEAP_BLOCK_FREE;
    if (header->prev != NULL && header->prev->type == HEAP_BLOCK_FREE)
    {
        //�ͷſ��ǰһ����Ҳ����Ϊ��
        header->prev->next = header->next;
        if (header->next != NULL)
            header->next->prev = header->prev;
        header->prev->size += header->size;

        header = header->prev;
    }

    if (header->next != NULL && header->next->type == HEAP_BLOCK_FREE)
    {
        //�ͷſ�ĺ�һ����Ҳ�ǿտ�
        header->size += header->next->size;
        header->next = header->next->next;
    }
}

void *malloc(unsigned size)
{
    heap_header *header;

    if (size == 0)
        return NULL;

    header = list_head;

    //  fputs("\ninside the malloc\n", stdout);
    //  fputs("outside the malloc-fuck you asshole\n", stdout);
    while (header != 0)
    {
        if (header->type == HEAP_BLOCK_USED)
        {
            header = header->next;
            continue;
        }

        //�պ�����һ�����п죬�����Ĵ�С��������size����һ����Ϣͷ�ߴ磬����С������size����������Ϣͷ�ߴ磬��ʣ����ڲ���Ƭ������������Ҳû�����ü�ֵ�ˣ�ֱ�������鶼�����used���ȴ������ͷ�
        if (header->size > size + HEADER_SIZE &&
            header->size <= size + HEADER_SIZE * 2)
        {
            header->type = HEAP_BLOCK_USED;
            return ADDR_ADD(header, HEADER_SIZE);
        }
        //���п�ռ��㹻����ʣ����ڲ���Ƭ���������������ʹ��
        if (header->size > size + HEADER_SIZE * 2)
        {
            // split
            heap_header *next = (heap_header *)ADDR_ADD(header, size + HEADER_SIZE);
            next->prev = header;
            next->next = header->next;
            next->type = HEAP_BLOCK_FREE;
            next->size = header->size - (size + HEADER_SIZE); //�˴������

            if (header->next != NULL)
                header->next->prev = next;

            header->next = next;
            header->size = size + HEADER_SIZE;
            header->type = HEAP_BLOCK_USED;
            return ADDR_ADD(header, HEADER_SIZE);
        };
        header = header->next;
    }

    //  fputs("outside the malloc-fuck you asshole\n", stdout);
    // delete header;

    return NULL;
}

#ifndef WIN32
// Linux brk system call
static int brk(void *end_data_segment)
{
    int ret = 0;
    // brk system call number:45
    // in /usr/include/asm-i386/unistd.h:
    //#define __NR_brk 45
    asm("movl $45, %%eax \n\t"
        "movl %1, %%ebx  \n\t"
        "int $0x80       \n\t"
        "movl %%eax, %0  \n\t"
        : "=r"(ret)
        : "m"(end_data_segment));
}
#endif

#ifdef WIN32
#include <Windows.h>
#endif

int mini_crt_init_heap()
{
    void *base = NULL;
    heap_header *header = NULL;
    // 32MB heap size
    unsigned heap_size = 1024 * 1024 * 32;

//��baseΪ������32MB���ڴ�ռ�
#ifdef WIN32
    base = VirtualAlloc(0, heap_size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (base == NULL)
        return 0;
#else
    base = (void *)brk(0);
    void *end = ADDR_ADD(base, heap_size);
    end = (void *)brk(end);
    if (!end)
    {
        printf("Linux create heap fail\n");
        return 0;
    }
#endif

    header = (heap_header *)base;
    header->size = heap_size;
    header->type = HEAP_BLOCK_FREE;
    header->next = NULL;
    header->prev = NULL;

    list_head = header;
    if (header == 0)
    {
        printf("Linux create heap fail\n");
        return 0;
    }
    return 1;
}