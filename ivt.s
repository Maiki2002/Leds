/* Interrupt Service routine Vector Table
 * This file is based on
 * https://github.com/lapers/stm32-asm-samples
 * IVT means ISR vector table
 * The following table stores the address of both the system exceptions and the
 * peripheral ones. Address 0x00000000 holds the address of the main stack
 * pointer. Adrress 0x00000004 holds the initial value of the program counter.
 * This initial value corresponds to the Reset_Handler ISR.
 * All interruptions must be implemented 
 */

@ NVIC table
@ DO NOT FORGET USE +1 SHIFT FOR ADDRESS ON THUMB
@ Thumb mode requieres the LSB equals one

.extern Reset_Handler
.extern Default_Handler
.section .isr_vector

.word   0x20005000                 @  stack pointer initial value
.word   Reset_Handler   + 1        @  reset handler pointer
.word   Default_Handler + 1        @  NMI
.word   Default_Handler + 1        @  HardFault
.word   Default_Handler + 1        @  MemManage
.word   Default_Handler + 1        @  BusFault
.word   Default_Handler + 1        @  UsageFault
.word   Default_Handler + 1        @  ----
.word   Default_Handler + 1        @  ----
.word   0x00000000                 @  ----
.word   Default_Handler + 1        @  ----  
.word   Default_Handler + 1        @  SVCall
.word   Default_Handler + 1        @  DebugMonitor
.word   Default_Handler + 1        @  ----
.word   Default_Handler + 1        @  PendSV
.word   Default_Handler + 1        @  SysTick
.word   Default_Handler + 1        @  0 WWDG
.word   Default_Handler + 1        @  1 PVD
.word   Default_Handler + 1        @  2 TAMPER
.word   Default_Handler + 1        @  3 RTC
.word   Default_Handler + 1        @  4 FLASH
.word   Default_Handler + 1        @  5 RCC
.word   Default_Handler + 1        @  6 EXTI0
.word   Default_Handler + 1        @  7 EXTI1
.word   Default_Handler + 1        @  8 EXTI2
.word   Default_Handler + 1        @  9 EXTI3
.word   Default_Handler + 1        @ 10 EXTI4
.word   Default_Handler + 1        @ 11 DMA1_Channel1
.word   Default_Handler + 1        @ 12 DMA1_Channel2
.word   Default_Handler + 1        @ 13 DMA1_Channel3
.word   Default_Handler + 1        @ 14 DMA1_Channel4
.word   Default_Handler + 1        @ 15 DMA1_Channel5
.word   Default_Handler + 1        @ 16 DMA1_Channel6
.word   Default_Handler + 1        @ 17 DMA1_Channel7
.word   Default_Handler + 1        @ 18 ADC1 and ADC2 global interrupt
.word   Default_Handler + 1        @ 19 USB High Priority or CAN TX interrupts
.word   Default_Handler + 1        @ 20 USB Low Priority or CAN RX0 interrupts
.word   Default_Handler + 1        @ 21 CAN RX1 interrupt
.word   Default_Handler + 1        @ 22 CAN SCE interrupt
.word   Default_Handler + 1        @ 23 EXTI Line[9:5] interrupts
.word   Default_Handler + 1        @ 24 TIM1 Break interrup
.word   Default_Handler + 1        @ 25 TIM1 Update interrupt
.word   Default_Handler + 1        @ 26 M1 Trigger and Commutation interrupts
.word   Default_Handler + 1        @ 27 TIM1 Capture Compare interrupt
.word   Default_Handler + 1        @ 28	TIM2
.word   Default_Handler + 1        @ 29	TIM3
.word   Default_Handler + 1        @ 30	TIM4
.word   Default_Handler + 1        @ 31	I2C1_EV
.word   Default_Handler + 1        @ 32	I2C1_ER
.word   Default_Handler + 1        @ 33	I2C2_EV
.word   Default_Handler + 1        @ 34	I2C2_ER
.word   Default_Handler + 1        @ 35	SPI1
.word   Default_Handler + 1        @ 36	SPI2
.word   Default_Handler + 1        @ 37	USART1
.word   Default_Handler + 1        @ 38	USART2
.word   Default_Handler + 1        @ 39	USART3
.word   Default_Handler + 1        @ 40	EXTI15_10
.word   Default_Handler + 1        @ 41	RTCAlarm
.word   Default_Handler + 1        @ 42	USBWakeup
