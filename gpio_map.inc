/* This file contains aliases mapping GPIO configuration registers with their
 * corresponding address */

.equ GPIOA_BASE, 0x40010800 @ Base address of GPIO-A configuration registers
.equ GPIOB_BASE, 0x40010C00 @ Base address of GPIO-B configuration registers
.equ GPIOC_BASE, 0x40011000 @ Base address of GPIO-C configuration registers
# The following register are not available in the blue pill dev. board
.equ GPIOD_BASE, 0x40011400 @ Base address of GPIO-D configuration registers
.equ GPIOE_BASE, 0x40011800 @ Base address of GPIO-E configuration registers
.equ GPIOF_BASE, 0x40011c00 @ Base address of GPIO-F configuration registers
.equ GPIOG_BASE, 0x40012000 @ Base address of GPIO-G configuration registers

# configuration register offsets
.equ GPIOx_CRL_OFFSET,  0x000  @ General-purpose I/O config. register port(0-7)
.equ GPIOx_CRH_OFFSET,  0x004  @ General-purpose I/O config. register port(8-F)
.equ GPIOx_IDR_OFFSET,  0x008  @ Port input data register offset
.equ GPIOx_ODR_OFFSET,  0x00C  @ Port output data register offset
.equ GPIOx_BSRR_OFFSET, 0x010  @ Port output data register offset
.equ GPIOx_BRR_OFFSET,  0x014  @ Port output data register offset
.equ GPIOx_LCKR_OFFSET, 0x018  @ Port output data register offset

