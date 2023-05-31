.cpu cortex-m3      @ Generates Cortex-M3 instructions
.section .text
# Default subroutine for not implemented ISR
.align	1
.syntax unified
.thumb
.global Default_Handler
Default_Handler: 
        b   .
.size   Default_Handler, .-Default_Handler
