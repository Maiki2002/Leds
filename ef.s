.thumb              @ Assembles using thumb mode
.cpu cortex-m3      @ Generates Cortex-M3 instructions
.syntax unified

.include "ivt.s"
.include "gpio_map.inc"
.include "rcc_map.inc"
.extern read_button
.extern output
.extern digital_read

.equ PIN10, 0xA
.equ PIN11, 0xB

.section .text
.align	1
.syntax unified
.thumb
.global __main
/* This function sets the bits A[4:0] as digital outputs, and A[6:5] as 
 * digital inputs.
 * Local variables (32-bit words):
 *     - counter: a 5 bits constant that represents numbers in range [-16, 15]
 *     - buttonA: boolean indicating whether the button A is pressed or not
 *     - buttonB: boolean indicating whether the button B is pressed or not
 * Frame size: 24 B
 * +---------+
 * | counter | r7
 * + --------+
 * | buttonA | r7 + 4
 * + --------+
 * | buttonB | r7 + 8
 * + --------+
 * |         |
 * + --------+
 * | r7      |
 * + --------+
 * | lr      |
 * + --------+
 */
__main:
        # Prologue
        push    {r7, lr}
        sub     sp, #16
        add     r7, sp, #0  
setup: @ Starts peripheral settings
        # enables clock in Port A
        ldr     r0, =RCC_BASE
        mov     r1, #4
        str     r1, [r0, RCC_APB2ENR_OFFSET]
        # configures pin 0 to 7 in GPIOA_CRL
        ldr     r0, =GPIOA_BASE @ moves base address of GPIOA registers
        ldr     r1, =0x33333333 @ PA[4:0] works as output, PA[6:5] as inputs
        str     r1, [r0, GPIOx_CRL_OFFSET] @ M[GPIOA_CRL] gets 0x33333333
        # disables pin 8 to 15 in GPIOA_CRL
        ldr     r1, =0x44448844
        str     r1, [r0, GPIOx_CRH_OFFSET] @ M[GPIOA_CRL] gets 0x44448844
        # initializes variables
        eor     r0, r0       @ clears r0
        str     r0, [r7]     @ counter = 0
        str     r0, [r7, #4] @ buttonA = 0
        str     r0, [r7, #8] @ buttonB = 0
loop: @ Starts microcontroller logic
        # read_button implements the functionality of is_button_pressed(), but
        # this function is parametered
        # buttonA = read_button(PORTA, PIN5);
        mov     r1, PIN10
        ldr     r0, =GPIOA_BASE
        bl      read_button
        str     r0, [r7, #4]
        # buttonB = read_button(PORTA, PIN6);
        mov     r1, PIN11
        ldr     r0, =GPIOA_BASE
        bl      read_button
        str     r0, [r7, #8]
        # if (buttonA && buttonB)
        ldr    r0, [r7, #4]
        cmp    r0, #0
        beq    .L1
        ldr    r0, [r7, #8]
        cmp    r0, #0
        beq    .L1
        #     counter = 0;
        ldr    r0, [r7]
        eor    r0, r0
        str    r0, [r7]
        b      .L2
.L1:    @ else if (buttonA && !buttonB)
        ldr    r0, [r7, #4]
        cmp    r0, #0
        beq    .L3
        ldr    r0, [r7, #8]
        cmp    r0, #1
        beq    .L3        
        #     counter++;
        ldr    r0, [r7]
        add    r0, #1
        str    r0, [r7]
        b      .L2
.L3:    @ else if (!buttonA && buttonB)
        ldr    r0, [r7, #4]
        cmp    r0, #1
        beq    .L2
        ldr    r0, [r7, #8]
        cmp    r0, #0
        beq    .L2        
        #     counter--;
        ldr    r0, [r7]
        sub    r0, #1
        str    r0, [r7]
.L2:    @ output(counter);
        ldr     r0, [r7]
        bl      output
        b       loop
