.thumb            
.cpu cortex-m3     
.syntax unified

.include "ivt.s"
.include "gpio_map.inc"
.include "rcc_map.inc"
.extern read_button
.extern output
.extern digital_read

setup:
    push    {r7,lr}
    sub     sp, sp, #16        
    add     r7, sp, #0
    #Habilita el reloj en el puerto A
    ldr     r0, =RCC_APB2ENR   
    mov     r3, 0x04           
    str     r3, [r0]           
    #PA0-PA7 Output
    ldr     r0, =GPIOA_CRL     
    ldr     r3, =0x33333333     
    str     r3, [r0]          
    #PA10-PA11 Input
    ldr     r0, =GPIOA_CRH      
    ldr     r3, =0x44448844         
    str     r3, [r0]

    eor r0, r0        
    str r0, [r7]        
    str r0, [r7, #4]    
    str r0, [r7, #8]    
loop:       
    mov r1, 0xA
    ldr r0, =GPIOA_BASE
    #Port A
    bl read_button
    str r0, [r7, #4]

    mov r1, 0xB
    ldr r0, =GPIOA_BASE
    #Port B
    bl read_button
    str r0, [r7, #8]
    
    ldr r0, [r7, #4]
    ldr r1, [r7, #8]
    #If(A&&B)
    cmp r0, #0
    beq L1

    cmp r1, #0
    beq L1
    #cont = 0
    ldr r0, [r7]
    eor r0, r0
    str r0, [r7]
    b L2
L1: 
    ldr r0, [r7, #4]
    ldr r1, [r7, #8]
    #If(A&&!B)
    cmp r0, #0
    beq L3

    cmp r1, #1
    beq L3
    #cont ++
    ldr r0, [r7]
    add r0, #1
    str r0, [r7]
    b L2
L3: 
    ldr r0, [r7, #4]
    ldr r1, [r7, #8]
    #If(!A&&B)
    cmp r0, #1
    beq L3

    cmp r1, #0
    beq L3
    #cont --
    ldr r0, [r7]
    sub r0, #1
    str r0, [r7]
L2:     
    ldr r0, [r7]
    bl output
    b loop
