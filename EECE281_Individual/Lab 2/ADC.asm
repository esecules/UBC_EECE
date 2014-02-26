; dac.asm: uses a R-2R ladder DAC to generate a ramp 
$MODDE2 
DSEG at 30H
voltage:		ds 1
voltage1:		ds 1
voltage_sum:	ds 2
voltage_sum1:	ds 2
voltage_avg:	ds 1
voltage_avg1:	ds 1
average_count:	ds 1
interupt_count:	ds 1
BCD:			ds 2
BCD1:			ds 2
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
	
	clr C
	mov a, voltage1
	addc a, voltage_sum1
	mov voltage_sum1, a
	mov a, voltage_sum1+1
	addc a, #0
	mov voltage_sum1+1, a
	
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
	
	clr C
	mov a, voltage_sum1+1
	rrc a
	mov voltage_sum1+1, a
	mov a, voltage_sum1
	rrc a
	mov voltage_sum1, a
	
	djnz average_count, shift_loop
	;cpl LEDRA.0
	mov voltage_avg, voltage_sum
	mov voltage_sum, #0
	
	mov voltage_avg1, voltage_sum1
	mov voltage_sum1, #0
	
	;mov LEDG,voltage_avg
	return_from_isr:
	pop acc
	pop psw
	reti

; 100 micro-second delay subroutine 
delay100us: 
 mov R1, #20 
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
    mov HEX1, A
	; Display Digit 1
    mov A, BCD+0
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX2, A
    ; Display Digit 2
    mov A, BCD+1
    anl a, #0fh
    movc A, @A+dptr
    mov HEX3, A
	; Display Digit 3
    mov A, BCD+1
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX4, A
    ret	
    
 Display_AVG:
	mov dptr, #myLUT
	; Display Digit 0
    mov A, voltage_avg1
    anl a, #0fh
    movc A, @A+dptr
    mov HEX0, A
	; Display Digit 1
    mov A, voltage_avg1
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX1, A
    ; Display Digit 0
    mov A, voltage_avg
    anl a, #0fh
    movc A, @A+dptr
    mov HEX4, A
	; Display Digit 1
    mov A, voltage_avg
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX5, A
    ret	
    
Wait40us:
	mov R0, #149
Wait40us_L0: 
	nop
	nop
	nop
	nop
	nop
	nop
	djnz R0, Wait40us_L0 ; 9 machine cycles-> 9*30ns*149=40us
    ret

LCD_command:
	mov	LCD_DATA, A
	clr	LCD_RS
	nop
	nop
	setb LCD_EN ; Enable pulse should be at least 230 ns
	nop
	nop
	nop
	nop
	nop
	nop
	clr	LCD_EN
	ljmp Wait40us

LCD_put:
	mov	LCD_DATA, A
	setb LCD_RS
	nop
	nop
	setb LCD_EN ; Enable pulse should be at least 230 ns
	nop
	nop
	nop
	nop
	nop
	nop
	clr	LCD_EN
	ljmp Wait40us
	
disp_LCD:
	lcall clr_lcd
	mov a, #80h
	lcall LCD_command
	mov a, #'V'	
	lcall LCD_PUT
	mov a, #'1'
	lcall LCD_PUT
	mov a, #':'
	lcall LCD_PUT
	mov a, #' '
	lcall LCD_PUT
	mov a, voltage_avg
	clr c
	subb a, #0FFH
	jz max_V1
	mov a,BCD+1
	mov b, a
	anl a, #0f0H
	rr a
	rr a
	rr a
	rr a
	add a, #30h	
	lcall lcd_put
	mov a, #2EH
	lcall LCD_PUT
	mov a,b
	anl a, #0Fh
	add a, #30h	
	lcall lcd_put
	mov a,BCD
	mov b, a
	anl a, #0f0H
	rr a
	rr a
	rr a
	rr a
	add a, #30h	
	lcall lcd_put
	mov a,b
	anl a, #0Fh
	add a, #30h	
	lcall lcd_put
	mov a, #' '
	lcall LCD_PUT
	mov a, #'V'
	lcall LCD_PUT
	sjmp V2_write
max_v1:
	mov a, #'M'	
	lcall LCD_PUT
	mov a, #'A'
	lcall LCD_PUT
	mov a, #'X'
	lcall LCD_PUT
V2_write:
	mov a, #0C0H
	lcall LCD_command
	mov a, #'V'	
	lcall LCD_PUT
	mov a, #'2'
	lcall LCD_PUT
	mov a, #':'
	lcall LCD_PUT
	mov a, #' '
	lcall LCD_PUT
	mov a, voltage_avg1
	clr c
	subb a, #0FFH
	jz max_V2
	mov a,BCD1+1
	mov b, a
	anl a, #0f0H
	rr a
	rr a
	rr a
	rr a
	add a, #30h	
	lcall lcd_put
	mov a, #2EH
	lcall LCD_PUT
	mov a,b
	anl a, #0Fh
	add a, #30h	
	lcall lcd_put
	mov a,BCD1
	mov b, a
	anl a, #0f0H
	rr a
	rr a
	rr a
	rr a
	add a, #30h	
	lcall lcd_put
	mov a,b
	anl a, #0Fh
	add a, #30h	
	lcall lcd_put
	mov a, #' '
	lcall LCD_PUT
	mov a, #'V'
	lcall LCD_PUT
	sjmp LCD_Done
max_V2:
	mov a, #'M'	
	lcall LCD_PUT
	mov a, #'A'
	lcall LCD_PUT
	mov a, #'X'
	lcall LCD_PUT
LCD_Done:
	ret
	  
CLR_LCD:	
	; Clear screen (Warning, very slow command!)
	mov a, #01H
	lcall LCD_command
    
    ; Delay loop needed for 'clear screen' command above (1.6ms at least!)
    mov R3, #18
Clr_loop:
	lcall delay100us
	djnz R3, Clr_loop
	ret
Lookup:
	mov a, voltage_avg
	clr c
	rlc a
	mov b, a
	jc High_LUT
	mov dptr, #Voltage_LUT
	sjmp Lookup_L1
	High_LUT:
	mov dptr, #Voltage_LUT_HIGH
	Lookup_L1:
	movc a, @a+dptr
	mov BCD+1, a
	mov a, b
	inc a
	movc a, @a+dptr
	mov BCD, a	

	mov a, voltage_avg1
	clr c
	rlc a
	mov b, a
	jc High_LUT_1
	mov dptr, #Voltage_LUT
	sjmp Lookup_L1_1
	High_LUT_1:
	mov dptr, #Voltage_LUT_HIGH
	Lookup_L1_1:
	movc a, @a+dptr
	mov BCD1+1, a
	mov a, b
	inc a
	movc a, @a+dptr
	mov BCD1, a	
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
; Turn LCD on, and wait a bit.
 setb LCD_ON
 clr LCD_EN  ; Default state of enable must be zero
 lcall Wait40us
  
 mov LCD_MOD, #0xff ; Use LCD_DATA as output port
 clr LCD_RW ;  Only writing to the LCD in this code.
	
 mov a, #0ch ; Display on command
 lcall LCD_command
 mov a, #38H ; 8-bits interface, 2 lines, 5x7 characters
 lcall LCD_command
 lcall clr_lcd
	
Loop:
 lcall ADC_0
 lcall ADC_1
 ;lcall display_avg
 djnz R4, Loop
 mov R4, #20
 lcall lookup 
 lcall disp_LCD
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
 lcall delay100us
L2:
 setb P3.5
 lcall delay100us
 jnb P1.2, L3
 clr p3.5
 lcall delay100us
L3:
 setb P3.4
 lcall delay100us
 jnb P1.2, L4
 clr p3.4
 lcall delay100us
L4:
 setb P3.3
 lcall delay100us
 jnb P1.2, L5
 clr p3.3
 lcall delay100us
L5:
 setb P3.2
 lcall delay100us
 jnb P1.2, L6
 clr p3.2
 lcall delay100us
L6:
 setb P3.1
 lcall delay100us
 jnb P1.2, L7
 clr p3.1
 lcall delay100us
L7:
 setb P3.0
 lcall delay100us
 jnb P1.2, L8
 clr p3.0
 lcall delay100us
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
 mov voltage1, P3
 ret

 END 
