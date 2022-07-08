//堆的实现
/*在遵循Mini CRT的原则下，我们将Mini CRT堆的实现归纳为以下几条
1.实现一个以空闲链表算法为基础的堆空间分配算法；
2.为了简单起见，堆空间大小固定为32MB，初始化后空间不再扩展或缩小；
3.在Windows平台下不适用HeapAlloc等堆分配算法，采用VirtualAlloc 向系统直接申请32MB空间，由我们自己的堆分配算法实现malloc
4.在Linux平台下，使用brk将数据段结束地址向后调整32MB，将这块空间作为堆空间
*/
/*
 brk系统调用可以设置进程的数据段.data边界，而sbrk可以移动进程的数据段边界，显然如果将数据段边界后移，就相当于分配了一定量的内存。但是这段内存初始只是分配了虚拟空间，这些空间的申请一开始是不会提交的（即不会分配物理页面），当进程师徒访问一个地址的时候，操作系统会检测到页缺少异常，从而会为被访问的地址所在的页分配物理页面。
故而这种被动的物理分配，又被称为按践踏分配，即不打不动。
*/
#include "minicrt.h"

typedef struct _heap_header
{
    enum
    {
        HEAP_BLOCK_FREE = 0xABABABAB, //空闲块的魔数
        HEAP_BLOCK_USED = 0xCDCDCDCD, //占用快的魔数
    } type;

    unsigned size; //块的尺寸包括块的信息头
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
        //释放块的前一个块也正好为空
        header->prev->next = header->next;
        if (header->next != NULL)
            header->next->prev = header->prev;
        header->prev->size += header->size;

        header = header->prev;
    }

    if (header->next != NULL && header->next->type == HEAP_BLOCK_FREE)
    {
        //释放块的后一个块也是空块
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

        //刚好碰到一个空闲快，且其块的大小大于所需size加上一个信息头尺寸，但是小于所需size加上两个信息头尺寸，即剩余的内部碎片就算分离出来，也没有利用价值了，直接整个块都分配给used，等待整体释放
        if (header->size > size + HEADER_SIZE &&
            header->size <= size + HEADER_SIZE * 2)
        {
            header->type = HEAP_BLOCK_USED;
            return ADDR_ADD(header, HEADER_SIZE);
        }
        //空闲块空间足够，且剩余的内部碎片分离出来还可以再使用
        if (header->size > size + HEADER_SIZE * 2)
        {
            // split
            heap_header *next = (heap_header *)ADDR_ADD(header, size + HEADER_SIZE);
            next->prev = header;
            next->next = header->next;
            next->type = HEAP_BLOCK_FREE;
            next->size = header->size - (size + HEADER_SIZE); //此处有误吧

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

//以base为起点分配32MB的内存空间
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