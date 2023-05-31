/* This file contains the definition needed to set peripheral interrupts */

.equ NVIC_BASE, 0xE000E100 @ Base address of the main NVIC register block

# ISER register addresses
.equ NVIC_ISER0_OFFSET, 0x000
.equ NVIC_ISER1_OFFSET, 0x004
.equ NVIC_ISER2_OFFSET, 0x008

# ICER register addresses
.equ NVIC_ICER0_OFFSET, 0x080
.equ NVIC_ICER1_OFFSET, 0x084
.equ NVIC_ICER2_OFFSET, 0x088

# ISPR register addresses
.equ NVIC_ISPR0_OFFSET, 0x100
.equ NVIC_ISPR1_OFFSET, 0x104
.equ NVIC_ISPR2_OFFSET, 0x108

# ICPR register addresses
.equ NVIC_ICPR0_OFFSET, 0x180
.equ NVIC_ICPR1_OFFSET, 0x184
.equ NVIC_ICPR2_OFFSET, 0x188

# IABR register addresses
.equ NVIC_IABR0_OFFSET, 0x200
.equ NVIC_IABR1_OFFSET, 0x204
.equ NVIC_IABR2_OFFSET, 0x208

# IPR register addresses
.equ NVIC_IPR0_OFFSET,  0x300
.equ NVIC_IPR4_OFFSET,  0x304
.equ NVIC_IPR8_OFFSET,  0x308
.equ NVIC_IPRC_OFFSET,  0x30C
.equ NVIC_IPR10_OFFSET, 0x310
.equ NVIC_IPR14_OFFSET, 0x314
.equ NVIC_IPR18_OFFSET, 0x318
.equ NVIC_IPR1c_OFFSET, 0x31C
.equ NVIC_IPR20_OFFSET, 0x320

# STIR register addresses
.equ NVIC_STIR, 0xE000EF00
