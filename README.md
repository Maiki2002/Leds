# Implementacion Proyecto 5
Este trabajo consiste en realizar un contador de numéros por bits usando la placa de desarrollo BluePill STM32F103.
Para esta práctica codificarémos en ensamblador Arm Cortex-M3.

El primer paso a realizar es configurar los puertos que vamos a utilizar para entrada y salida de datos:
  - 5 leds de salida
  - 2 botones de entrada
Identificamos que puertos se les asignará a cada uno:
  - leds -> PA0, PA1, PA2, PA3, PA4
  - botones -> PA10, PA11
 Una vez realizado lo anterior, creamos un archivo para realizar la configuración:
  - Creamos un marco asigando las variables que contendra
   +---------+
   | counter | r7
   + --------+
   | buttonA | r7 + 4
   + --------+
   | buttonB | r7 + 8
   + --------+
   |         |
   + --------+
   | r7      |
   + --------+
   | lr      |
   + --------+
  -  ldr     r0, =RCC_BASE
        mov     r1, #4
        str     r1, [r0, RCC_APB2ENR_OFFSET] (Se utiliza para habilitar los puertos A)
  - ldr     r0, =GPIOA_BASE 
        ldr     r1, =0x33333333 (Del puerto 0 al 7 asignamos que son de salida)
    str     r1, [r0, GPIOx_CRL_OFFSET]
   - ldr     r1, =0x44448844 (Solo se activa el puerto 10 y 11 se habilita como entrada)
     str     r1, [r0, GPIOx_CRH_OFFSET]
 - Declaramos el valor de las variables:
        eor     r0, r0       @ clears r0
        str     r0, [r7]     @ counter = 0
        str     r0, [r7, #4] @ buttonA = 0
        str     r0, [r7, #8] @ buttonB = 0
La siguiente parte del codigo es la lógica que llevará el programa llamado loop:

Creamos un archivo MakeFile para enlazar las funciones externas de:
- main1.s 
- ivt.s 
- default_handler.s 
- reset_handler.s 
- delay.s 
- read_button.s 
   +---------+
   | pin     | r7
   + --------+
   | port    | r7 + 4
   + --------+
   |         | r7 + 8
   + --------+
   | bit     | r7 + 12
   + --------+
   | i       | r7 + 16
   + --------+
   | counter | r7 + 20
   + --------+
   | r7      |
   + --------+
   | lr      |
   + --------+ 
- output.s 
- digital_read.s

En el archivo Makefile tenemos las extensiones de los archivo a enlazar en la compilacion:
- Utilizaremos el comando make para este proceso
- Make write es para escribir en la placa de desarrollo
- Make será para enlazar todos los archivos en uno solo


#El mapa de conexión de la blue pill en la protoboard:

![WhatsApp Image 2023-05-29 at 14 07 14](https://github.com/Maiki2002/Leds/assets/105370860/dd3a6409-7fcd-4e79-a52d-38e61aa29954)


     
