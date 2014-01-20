; dac.asm: uses a R-2R ladder DAC to generate a ramp 
$MODDE2 
DSEG at 30H
voltage:		ds 1
voltage_sum:	ds 2
voltage_avg:	ds 1
average_count:	ds 1
interupt_count:	ds 1
BCD:			ds 2
CSEG		
org 0000H 
 ljmp myprogram 
org 2bh
 ljmp Timer2_ISR
 	$include (voltage_lut.asm)

XTAL           EQU 33333333
FREQ_2		   EQU 50
TIMER2_RELOAD  EQU 65536-(XTAL/(12*FREQ_2))
input_sel	   EQU P0.0
nibble_sel	   EQU P0.1

;16 sample averager 
Timer2_ISR:
push psw
push acc
clr TF2
inc interupt_count 
mov a, interupt_count
cjne a, #2, return_from_isr
mov interupt_count, #0
inc average_count
clr C
mov a, voltage
addc a, voltage_sum
mov voltage_sum, a
mov a, voltage_sum+1
addc a, #0
mov voltage_sum+1, a
mov a, average_count
cjne a, #16,return_from_isr 
mov average_count, #4
shift_loop:
clr C
mov a, voltage_sum+1
rrc a
mov voltage_sum+1, a
mov a, voltage_sum
rrc a
mov voltage_sum, a
djnz average_count, shift_loop
cpl LEDRA.0
mov voltage_avg, voltage_sum
mov voltage_sum, #0
;mov LEDG,voltage_avg
return_from_isr:
pop acc
pop psw
reti

; 100 micro-second delay subroutine 
delay100us: 
 mov R1, #10 
 Label0: mov R0, #111 
 Label1: djnz R0, Label1 ; 111*30ns*3=10us 
 djnz R1, Label0 ; 10*10us=100us, approximately 
 ret 
 
 ; Look-up table for 7-seg displays
myLUT:
    DB 0C0H, 0F9H, 0A4H, 0B0H, 099H        ; 0 TO 4
    DB 092H, 082H, 0F8H, 080H, 090H        ; 4 TO 9
    DB 088H, 083H, 0C6H, 0A1H, 086H, 08EH  ; A to F

Display_HEX:
	mov dptr, #myLUT
	; Display Digit 0
    mov A, BCD+0
    anl a, #0fh
    movc A, @A+dptr
    mov HEX0, A
	; Display Digit 1
    mov A, BCD+0
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX1, A
    ; Display Digit 2
    mov A, BCD+1
    anl a, #0fh
    movc A, @A+dptr
    mov HEX2, A
	; Display Digit 3
    mov A, BCD+1
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX3, A
    ret	
    
Lookup:
	mov dptr, #Voltage_LUT
	mov a, voltage_avg
	movc a, @a+dptr
	mov BCD, a
	mov a, voltage_avg
	inc a
	movc a, @a+dptr
	mov BCD+1, a	
	ret

myprogram: 
 mov SP, #7FH ; Set the stack pointer 
 mov LEDRA, #0 ; Turn off all LEDs 
 mov LEDRB, #0 
 mov LEDRC, #0 
 mov LEDG, #0 
 mov P3MOD, #11111111B ; Configure P3.0 to P3.7 as outputs 
 mov R3, #0 ; Initialize counter to zero 
 mov P0MOD, #0 ;set P0 as input (only care about p0.0)
 
 mov T2CON, #00H ; Autoreload is enabled, work as a timer
 clr TR2
 clr TF2
 ; Set up timer 2 to interrupt every 10ms
 mov RCAP2H,#high(TIMER2_RELOAD)
 mov RCAP2L,#low(TIMER2_RELOAD)
 setb TR2
 setb ET2
 setb EA
Loop:
lcall ADC_0
;lcall ADC_1
lcall lookup
lcall display_hex
sjmp Loop

ADC_0: 
 mov P3, #0
 mov LEDG, #0 
 setb P3.7
 lcall delay100us
 jnb P1.2, L1
 clr p3.7
L1:
 setb P3.6
 lcall delay100us 
 jnb P1.2, L2
 clr p3.6
L2:
 setb P3.5
 lcall delay100us
 jnb P1.2, L3
 clr p3.5
L3:
 setb P3.4
 lcall delay100us
 jnb P1.2, L4
 clr p3.4
L4:
 setb P3.3
 lcall delay100us
 jnb P1.2, L5
 clr p3.3
L5:
 setb P3.2
 lcall delay100us
 jnb P1.2, L6
 clr p3.2
L6:
 setb P3.1
 lcall delay100us
 jnb P1.2, L7
 clr p3.1
L7:
 setb P3.0
 lcall delay100us
 jnb P1.2, L8
 clr p3.0
L8: ;conversion done
 lcall delay100us 
 mov LEDG, P3
 lcall delay100us 
 lcall delay100us 
 lcall delay100us 
 mov voltage, P3
 ret
 
ADC_1:
 mov P3, #0
 mov LEDRA, #0 
 setb P3.7
 lcall delay100us
 jnb P1.3, L1_ADC_1
 clr p3.7
L1_ADC_1:
 setb P3.6
 lcall delay100us 
 jnb P1.3, L2_ADC_1
 clr p3.6
L2_ADC_1:
 setb P3.5
 lcall delay100us
 jnb P1.3, L3_ADC_1
 clr p3.5
L3_ADC_1:
 setb P3.4
 lcall delay100us
 jnb P1.3, L4_ADC_1
 clr p3.4
L4_ADC_1:
 setb P3.3
 lcall delay100us
 jnb P1.3, L5_ADC_1
 clr p3.3
L5_ADC_1:
 setb P3.2
 lcall delay100us
 jnb P1.3, L6_ADC_1
 clr p3.2
L6_ADC_1:
 setb P3.1
 lcall delay100us
 jnb P1.3, L7_ADC_1
 clr p3.1
L7_ADC_1:
 setb P3.0
 lcall delay100us
 jnb P1.3, L8_ADC_1
 clr p3.0
L8_ADC_1: ;conversion done
 lcall delay100us 
 mov LEDRA, P3
 lcall delay100us 
 lcall delay100us 
 lcall delay100us 
 ;mov voltage_1, P3
 ret

 END 
