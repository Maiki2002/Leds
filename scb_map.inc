/* This file contains definitions to alias the addresses of the SCB
 * configuration registers */

.equ SCB_BASE, 0xE000ED00 @ Base address of System Block configuration regs.


.equ SCB_CPUID_OFFSET, 0x000 @ Offset to access the CPUID base register
.equ SCB_ICSR_OFFSET,  0x004 @ Offset to access the Interrupt control and state register
.equ SCB_VTOR_OFFSET,  0x008 @ Offset to access the Vector table offset register
.equ SCB_AIRCR_OFFSET, 0x00C @ Offset to access the Application interrupt and reset control register
.equ SCB_SCR_OFFSET,   0x010 @ Offset to access the System control register
.equ SCB_CCR_OFFSET,   0x014 @ Offset to access the Configuration and control register
.equ SCB_SHPR1_OFFSET, 0x018 @ Offset to access the System handler priority register 1
.equ SCB_SHPR2_OFFSET, 0x01C @ Offset to access the System handler priority register 2
.equ SCB_SHPR3_OFFSET, 0x020 @ Offset to access the System handler priority register 3
.equ SCB_SHCRS_OFFSET, 0x024 @ Offset to access the System handler control and state register
.equ SCB_CFSR_OFFSET,  0x028 @ Offset to access the Configurable fault status register
.equ SCB_HFSR_OFFSET,  0x02C @ Offset to access the Hard fault status register
.equ SCB_MMAR_OFFSET,  0x034 @ Offset to access the Memory management fault address register
.equ SCB_BFAR_OFFSET,  0x038 @ Offset to access the Bus fault address register
