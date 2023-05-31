.section .text
.align	1
.syntax unified
.thumb
.global read_button
.extern digital_read
.extern delay
.equ DELAY, 6
.equ POSITIVE_READINGS, 10
.equ SAMPLES, 15
.include "gpio_map.inc"
/*
 * This function implements the procedure is_button_pressed() proposed by Zhu
 * in "Embedded Systems with ARM Cortex-M Microcontrollers in Assembly Language 
 * and C"
 * Arguments:
 *     - port: the base address of the GPIO port to be read
 *     - pin: the number of pin to be read
 * Frame size 32 B
 * +---------+
 * | pin     | r7
 * + --------+
 * | port    | r7 + 4
 * + --------+
 * |         | r7 + 8
 * + --------+
 * | bit     | r7 + 12
 * + --------+
 * | i       | r7 + 16
 * + --------+
 * | counter | r7 + 20
 * + --------+
 * | r7      |
 * + --------+
 * | lr      |
 * + --------+
 */ 
read_button:
        # Prologue
        push	{r7, lr}
        sub	    sp, sp, #24
        add	    r7, sp, #0
        str	    r0, [r7, #4]
        str	    r1, [r7]
        # bit = digital_read(port, pin);
        ldr	    r1, [r7]
        ldr	    r0, [r7, #4]
        bl	    digital_read
        str	    r0, [r7, #12]
        # if (!bit)
        ldr	    r3, [r7, #12]
        mov	    r0, r3
        cmp	    r3, #0
        bne	    .L2
        movs	r3, #0 @ saves return value
        b	    .L3    @ jumps to epilogue
.L2: @ counter = 0;
        movs	r3, #0
        str	    r3, [r7, #20]
        # i = 0
        movs	r3, #0
        str	    r3, [r7, #16]
        b	    .L4
.L7: @ delay(5);
        movs	r0, #DELAY
        bl	    delay
        # bit = digital_read(port, pin);
        ldr	    r1, [r7]
        ldr	    r0, [r7, #4]
        bl	    digital_read
        str	    r0, [r7, #12]
        # if (!bit)
        ldr	    r3, [r7, #12]
        cmp	    r3, #0
        bne	    .L5
        # counter = 0;
        movs	r3, #0
        str	    r3, [r7, #20]
        b	    .L6
.L5: @ else
        # counter++;
        ldr	    r3, [r7, #20]
        adds	r3, r3, #1
        str	    r3, [r7, #20]
        # if (counter >= POSITIVE_READINGS)
        ldr	    r3, [r7, #20]
        cmp	    r3, #POSITIVE_READINGS-1
        ble	    .L6
        movs	r3, #1 @ saves return value
        b	    .L3        @ jumps to epilogue
.L6: @ i++
        ldr	    r3, [r7, #16]
        adds	r3, r3, #1
        str	    r3, [r7, #16]
.L4: @ i < SAMPLES
        ldr	    r3, [r7, #16]
        cmp	    r3, #SAMPLES-1
        ble	    .L7
        movs	r3, #0
.L3: @ Epilogue
        mov	    r0, r3
        adds	r7, r7, #24
        mov	    sp, r7
        pop	    {r7, pc}
        bx      lr
        .size	read_button, .-read_button