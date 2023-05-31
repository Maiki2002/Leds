/* This file contains aliases mapping RCC configuration registers with their
 * corresponding address */
.equ RCC_BASE, 0x40021000 @ Base address of RCC configuration registers

# RCC register offsets
.equ RCC_CR_OFFSET, 0x000 @ Clock control register
.equ RCC_CFGR_OFFSET, 0x004 @ Clock configuration register
.equ RCC_CIR_OFFSET, 0x008 @ Clock interrupt register
.equ RCC_APB2RSTR_OFFSET, 0x00C @ APB2 peripheral reset register
.equ RCC_APB1RSTR_OFFSET, 0x010 @ APB1 peripheral reset register
.equ RCC_AHBENR_OFFSET, 0x014 @ AHB Peripheral Clock enable register 
.equ RCC_APB2ENR_OFFSET, 0x018 @ APB2 peripheral clock enable register
.equ RCC_APB1ENR_OFFSET, 0x01C @ APB1 peripheral clock enable register
.equ RCC_BDCR_OFFSET, 0x020 @ Backup domain control register
.equ RCC_CSR_OFFSET, 0x024 @ Control/status register (RCC_CSR)
.equ RCC_AHBSTR_OFFSET, 0x028 @ AHB peripheral clock reset register
.equ RCC_CFGR2_OFFSET, 0x02C @ Clock configuration register2
