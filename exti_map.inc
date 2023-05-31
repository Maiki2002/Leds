/* This file contains alias definitions mapping the EXTI configuration registers
 * with their corresponding memory addresses */

.equ EXTI_BASE, 0x40010400 @ Base address of EXTI configuration registers

.equ EXTI_IMR_OFFSET,   0x000 @ EXTI Interrupt mask register
.equ EXTI_EMR_OFFSET,   0x004 @ EXTI Event mask register
.equ EXTI_RTST_OFFSET,  0x008 @ EXTI Rising trigger selection register
.equ EXTI_FTST_OFFSET,  0x00C @ EXTI Falling trigger selection register
.equ EXTI_SWIER_OFFSET, 0x010 @ EXTI Software interrupt event register
.equ EXTI_PR_OFFSET,    0x014 @ EXTI Pending register
