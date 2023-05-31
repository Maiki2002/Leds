.cpu cortex-m3      @ Generates Cortex-M3 instructions
.extern __main
.section .text
.align	1
.syntax unified
.thumb
.global Reset_Handler
Reset_Handler:
        ldr     r0, =__main+1 @ Adds one to indicates __main is a thumb function
        bx      r0            @ calls main function
        b       .             @ If main returns, enter an infinite loop
.size   Reset_Handler, .-Reset_Handler
