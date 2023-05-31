@collab Ivan Garrido Velazquez from terminal make
.section .text
.include "gpio_map.inc"
.extern delay
.align	1
.syntax unified
.thumb
.global digital_read
.thumb_func
.type	digital_read, %function
digital_read:
        ldr     r2, [r0, GPIOx_IDR_OFFSET]
        lsr     r2, r1
        and     r2, #1
        mov     r0, r2
        bx      lr
