/*
 * Author: A. Geovanni Medrano-Chávez
 * This linker script describes the sections where code and data resides in
 * the memory of the stm32f103c8t6 µC.
 * The following code is base on the content of this video
 * https://www.youtube.com/watch?v=B7oKdUvRhQQ
 * 
 * This script does not define any Entry_Point, but it's defines at 0x08000000
 * Then, the Reset_Handler is invoked. It maps .data in FLASH to .data in SRAM.
 * In case the BSS section is used, Reset_Handler must fill it with zeros.
 */


MEMORY
{
  FLASH(rx):ORIGIN =0x08000000,LENGTH =1024K /* Instruction memory */
  SRAM(rwx):ORIGIN =0x20000000,LENGTH =128K  /* Data memory */
}

/* Symbol definition for max heap size and max stack size */
__max_heap_size = 0x400;
__max_stack_size = 0x200;

SECTIONS
{
    .text :
    {
        *(.isr_vector) /* The table containig pointer to ISRs*/
        *(.text) /* User code */
        *(.rodata) /* read-only data, e.g., values to initialize an array */
    }> FLASH /* Text section resides at FLASH, no need to reallocate */

    /* Returns the absolute load address of the named section .data */
    _la_data = LOADADDR(.data);

    .data : /* This section is written in FLASH and mapped in SRAM */
    {
        /* Location counter
         * The special linker variable dot ‘.’ always contains the current 
         * output location counter 
         * https://sourceware.org/binutils/docs/ld/Location-Counter.html 
         */
        _sdata = .; /* start of the data section in FLASH */
        *(.data)
        _edata = .; /* end of the data section in FLASH */
    }> SRAM AT> FLASH

    /* Returns the absolute load address of the named section .data */
    _bss = LOADADDR(.bss);

    .bss : /* The block starting symbol. It's the space where statically 
            * allocated variables that are declared but have not been assigned a 
            * value yet */
    {
        *(.bss)
        _ebss = .; /* end of the data section in FLASH */
    }> SRAM

    /DISCARD/ : { *(.note.gnu.build-id) }
}