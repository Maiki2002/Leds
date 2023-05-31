.align	1
.global	output
.syntax unified
.thumb
.include "gpio_map.inc" 
.thumb_func
.type	output, %function
.section .text
# Emits a value through a Digital Port
# Argument:
#     - r0: 5 bit integer
output:
        ldr     r1, =GPIOA_BASE
        and     r0, #255
        str     r0, [r1, GPIOx_ODR_OFFSET]
        bx	    lr
.size	output, .-output
