/* This file contains alias to access the SysTick configuration registers */

.equ SYSTICK_BASE, 0xE000E010 @ The base address of the SysTick register

.equ STK_CTRL_OFFSET,  0x000 @ SysTick control and status register
.equ STK_LOAD_OFFSET,  0x004 @ SysTick reload value register
.equ STK_VAL_OFFSET,   0x008 @ SysTick current value register
.equ STK_CALIB_OFFSET, 0x00C @ SysTick calibration value register
