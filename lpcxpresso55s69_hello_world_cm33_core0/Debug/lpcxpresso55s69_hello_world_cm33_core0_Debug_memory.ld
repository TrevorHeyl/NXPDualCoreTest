/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright (c) 2008-2013 Code Red Technologies Ltd,
 * Copyright 2015, 2018-2019 NXP
 * (c) NXP Semiconductors 2013-2019
 * Generated linker script file for LPC55S69
 * Created from memory.ldt by FMCreateLinkMemory
 * Using Freemarker v2.3.23
 * MCUXpresso IDE v11.0.1 [Build 2563] [2019-09-01] on 25 Oct 2019 7:54:53 AM
 */

MEMORY
{
  /* Define each memory region */
  PROGRAM_FLASH (rx) : ORIGIN = 0x0, LENGTH = 0xa0000 /* 640K bytes (alias Flash) */  
  Ram0 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x31800 /* 198K bytes (alias RAM) */  
  Ram1 (rwx) : ORIGIN = 0x20033000, LENGTH = 0x11000 /* 68K bytes (alias RAM2) */  
  rpmsg_sh_mem (rwx) : ORIGIN = 0x20031800, LENGTH = 0x1800 /* 6K bytes (alias RAM3) */  
}

  /* Define a symbol for the top of each memory region */
  __base_PROGRAM_FLASH = 0x0  ; /* PROGRAM_FLASH */  
  __base_Flash = 0x0 ; /* Flash */  
  __top_PROGRAM_FLASH = 0x0 + 0xa0000 ; /* 640K bytes */  
  __top_Flash = 0x0 + 0xa0000 ; /* 640K bytes */  
  __base_Ram0 = 0x20000000  ; /* Ram0 */  
  __base_RAM = 0x20000000 ; /* RAM */  
  __top_Ram0 = 0x20000000 + 0x31800 ; /* 198K bytes */  
  __top_RAM = 0x20000000 + 0x31800 ; /* 198K bytes */  
  __base_Ram1 = 0x20033000  ; /* Ram1 */  
  __base_RAM2 = 0x20033000 ; /* RAM2 */  
  __top_Ram1 = 0x20033000 + 0x11000 ; /* 68K bytes */  
  __top_RAM2 = 0x20033000 + 0x11000 ; /* 68K bytes */  
  __base_rpmsg_sh_mem = 0x20031800  ; /* rpmsg_sh_mem */  
  __base_RAM3 = 0x20031800 ; /* RAM3 */  
  __top_rpmsg_sh_mem = 0x20031800 + 0x1800 ; /* 6K bytes */  
  __top_RAM3 = 0x20031800 + 0x1800 ; /* 6K bytes */  
