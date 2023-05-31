/* This file contains alias definitions mapping the AFIO configuration registers
 * with their corresponding memory addresses */

.equ AFIO_BASE, 0x40010000

.equ AFIO_EVCR_OFFSET, 0x000 @ Event control register
.equ AFIO_MAPR_OFFSET, 0x004 @ AF remap and debug I/O configuration register
.equ AFIO_EXTICR1_OFFSET, 0x008 @ External interrupt configuration register 1
.equ AFIO_EXTICR2_OFFSET, 0x00C @ External interrupt configuration register 2
.equ AFIO_EXTICR3_OFFSET, 0x010 @ External interrupt configuration register 3
.equ AFIO_EXTICR4_OFFSET, 0x014 @ External interrupt configuration register 4
.equ AFIO_MAPR2_OFFSET, 0x01C @ AF remap and debug I/O configuration register 2
