ENTRY(nomain)

SECTIONS{
    . = 0x08048000 + SIZEOF_HEADERS;
    print_without_main : {*(.text) *(.data) *(.rodata)}
    /DISCARD/ : {*(.comment)}
}