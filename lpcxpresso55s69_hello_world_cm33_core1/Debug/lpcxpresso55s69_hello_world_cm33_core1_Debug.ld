/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright (c) 2008-2013 Code Red Technologies Ltd,
 * Copyright 2015, 2018-2019 NXP
 * (c) NXP Semiconductors 2013-2019
 * Generated linker script file for LPC55S69
 * Created from linkscript.ldt by FMCreateLinkLibraries
 * Using Freemarker v2.3.23
 * MCUXpresso IDE v11.0.1 [Build 2563] [2019-09-01] on 25 Oct 2019 7:57:58 AM
 */

INCLUDE "lpcxpresso55s69_hello_world_cm33_core1_Debug_library.ld"
INCLUDE "lpcxpresso55s69_hello_world_cm33_core1_Debug_memory.ld"

ENTRY(ResetISR)

SECTIONS
{
     /* MAIN TEXT SECTION */
    .text : ALIGN(4)
    {
        FILL(0xff)
        __vectors_start__ = ABSOLUTE(.) ;
        KEEP(*(.isr_vector))
        /* Global Section Table */
        . = ALIGN(4) ;
        __section_table_start = .;
        __data_section_table = .;
        LONG(LOADADDR(.data));
        LONG(    ADDR(.data));
        LONG(  SIZEOF(.data));
        LONG(LOADADDR(.data_RAM2));
        LONG(    ADDR(.data_RAM2));
        LONG(  SIZEOF(.data_RAM2));
        __data_section_table_end = .;
        __bss_section_table = .;
        LONG(    ADDR(.bss));
        LONG(  SIZEOF(.bss));
        LONG(    ADDR(.bss_RAM2));
        LONG(  SIZEOF(.bss_RAM2));
        __bss_section_table_end = .;
        __section_table_end = . ;
        /* End of Global Section Table */

        *(.after_vectors*)

    } > Ram1

    .text : ALIGN(4)
    {
       *(.text*)
       *(.rodata .rodata.* .constdata .constdata.*)
       . = ALIGN(4);
    } > Ram1
    /*
     * for exception handling/unwind - some Newlib functions (in common
     * with C++ and STDC++) use this. 
     */
    .ARM.extab : ALIGN(4) 
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > Ram1

    __exidx_start = .;

    .ARM.exidx : ALIGN(4)
    {
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > Ram1
    __exidx_end = .;
 
    _etext = .;
        
    /* DATA section for rpmsg_sh_mem */

    .data_RAM2 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM2 = .) ;
        *(.ramfunc.$RAM2)
        *(.ramfunc.$rpmsg_sh_mem)
        *(.data.$RAM2)
        *(.data.$rpmsg_sh_mem)
        *(.data.$RAM2.*)
        *(.data.$rpmsg_sh_mem.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM2 = .) ;
     } > rpmsg_sh_mem AT>Ram1
    /* MAIN DATA SECTION */
    .uninit_RESERVED (NOLOAD) :
    {
        . = ALIGN(4) ;
        KEEP(*(.bss.$RESERVED*))
       . = ALIGN(4) ;
        _end_uninit_RESERVED = .;
    } > Ram1

    /* Main DATA section (Ram1) */
    .data : ALIGN(4)
    {
       FILL(0xff)
       _data = . ;
       *(vtable)
       *(.ramfunc*)
       KEEP(*(CodeQuickAccess))
       KEEP(*(DataQuickAccess))
       *(RamFunction)
       *(.data*)
       . = ALIGN(4) ;
       _edata = . ;
    } > Ram1 AT>Ram1

    /* BSS section for rpmsg_sh_mem */
    .bss_RAM2 :
    {
       . = ALIGN(4) ;
       PROVIDE(__start_bss_RAM2 = .) ;
       *(.bss.$RAM2)
       *(.bss.$rpmsg_sh_mem)
       *(.bss.$RAM2.*)
       *(.bss.$rpmsg_sh_mem.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM2 = .) ;
    } > rpmsg_sh_mem

    /* MAIN BSS SECTION */
    .bss :
    {
        . = ALIGN(4) ;
        _bss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4) ;
        _ebss = .;
        PROVIDE(end = .);
    } > Ram1

    /* NOINIT section for rpmsg_sh_mem */
    .noinit_RAM2 (NOLOAD) :
    {
       . = ALIGN(4) ;
       *(.noinit.$RAM2)
       *(.noinit.$rpmsg_sh_mem)
       *(.noinit.$RAM2.*)
       *(.noinit.$rpmsg_sh_mem.*)
       . = ALIGN(4) ;
    } > rpmsg_sh_mem

    /* DEFAULT NOINIT SECTION */
    .noinit (NOLOAD):
    {
         . = ALIGN(4) ;
        _noinit = .;
        *(.noinit*)
         . = ALIGN(4) ;
        _end_noinit = .;
    } > Ram1

    /* Reserve and place Heap within memory map */
    _HeapSize = 0x1000;
    .heap :  ALIGN(4)
    {
        _pvHeapStart = .;
        . += _HeapSize;
        . = ALIGN(4);
        _pvHeapLimit = .;
    } > Ram1

     _StackSize = 0x1000;
     /* Reserve space in memory for Stack */
    .heap2stackfill  :
    {
        . += _StackSize;
    } > Ram1
    /* Locate actual Stack in memory map */
    .stack ORIGIN(Ram1) + LENGTH(Ram1) - _StackSize - 0:  ALIGN(4)
    {
        _vStackBase = .;
        . = ALIGN(4);
        _vStackTop = . + _StackSize;
    } > Ram1

    /* Provide basic symbols giving location and size of main text
     * block, including initial values of RW data sections. Note that
     * these will need extending to give a complete picture with
     * complex images (e.g multiple Flash banks).
     */
    _image_start = LOADADDR(.text);
    _image_end = LOADADDR(.data) + SIZEOF(.data);
    _image_size = _image_end - _image_start;
}