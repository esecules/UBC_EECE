$MODDE2
org 0000H
   ljmp MyProgram
org 1bh
	ljmp Timer1_ISR

FREQ   EQU 33333333
BAUD   EQU 115200
T2LOAD EQU 65536-(FREQ/(32*BAUD))
CE_ADC EQU  P0.3
SCLK EQU P0.2
MOSI EQU P0.1
MISO EQU P0.0
CE_ARDUINO EQU P0.4

FREQ_1		   EQU 50
TIMER1_RELOAD  EQU 65536-(FREQ/(12*FREQ_1))

DSEG at 30H
x:        ds 2
y:        ds 2
bcd:	  ds 3
new_temp: ds 1
temp_sum: ds 2
temp_avg: ds 1
average_count:	ds 1
BSEG
mf:     dbit 1
CSEG

$include(math16.asm)
;16 sample averager 
Timer1_ISR:
	push psw
	push acc
	cpl LEDRA.1
	mov TH1, #high(TIMER1_RELOAD)
	mov TL1, #low(TIMER1_RELOAD)	
	inc average_count

	clr C
	mov a, new_temp
	addc a, temp_sum
	mov temp_sum, a
	mov a, temp_sum+1
	addc a, #0
	mov temp_sum+1, a
	
	
	mov a, average_count
	cjne a, #16,return_from_isr 
	mov average_count, #4
	shift_loop:
	
	clr C
	mov a, temp_sum+1
	rrc a
	mov temp_sum+1, a
	mov a, temp_sum
	rrc a
	mov temp_sum, a
	
	djnz average_count, shift_loop
	cpl LEDRA.0
	mov temp_avg, temp_sum
	mov temp_sum, #0

	;mov LEDG,voltage_avg
	return_from_isr:
	pop acc
	pop psw
	reti
	
delay:
	mov R3 , #2
Lp4: mov R2, #90
Lp3: mov R1, #250
Lp2: mov R0, #250
Lp1: djnz R0, Lp1 ; 3 machine cycles-> 3*30ns*250=22.5us
	djnz R1, Lp2 ; 22.5us*250=5.625ms
	djnz R2, Lp3 ; 5.625ms*90=0.5s (approximately)
	djnz R3, Lp4
	ret

 
INI_SPI:
orl P0MOD, #00000110b ; Set SCLK, MOSI as outputs
anl P0MOD, #11111110b ; Set MISO as input
clr SCLK ; Mode 0,0 default
ret

DO_SPI_G:
mov R1, #0 ; Received byte stored in R1
mov R2, #8 ; Loop counter (8-bits)
DO_SPI_G_LOOP:
mov a, R0 ; Byte to write is in R0
rlc a ; Carry flag has bit to write
mov R0, a
mov MOSI, c
setb SCLK ; Transmit
mov c, MISO ; Read received bit
mov a, R1 ; Save received bit in R1
rlc a
mov R1, a
clr SCLK
djnz R2, DO_SPI_G_LOOP
ret
myLUT:
    DB 0C0H, 0F9H, 0A4H, 0B0H, 099H        ; 0 TO 4
    DB 092H, 082H, 0F8H, 080H, 090H        ; 4 TO 9
Display_temp:
	mov dptr, #myLUT
	; Display Digit 0
    mov A, bcd+0
    anl a, #0fh
    movc A, @A+dptr
    mov HEX0, A
	; Display Digit 1
    mov A, bcd+0
    swap a
    anl a, #0fh
    movc A, @A+dptr
    mov HEX1, A
    ret
Read_ADC_Channel:
	clr CE_ADC
	mov R0, #00000001B ; Start bit:1
	lcall DO_SPI_G
	
	mov a, b
	swap a
	anl a, #0F0H
	setb acc.7 ; Single mode (bit 7).
	
	mov R0, a ;  Select channel
	lcall DO_SPI_G
	mov a, R1          ; R1 contains bits 8 and 9
	anl a, #03H
	mov R7, a
	
	mov R0, #55H ; It doesn't matter what we transmit...
	lcall DO_SPI_G
	mov a, R1    ; R1 contains bits 0 to 7
	mov R6, a
	setb CE_ADC
	ret

Get_Temperature:
	mov b, #0 ; LM335 temperature sensor is connected to channel 0
	lcall Read_ADC_Channel
	
	mov x+1, R7
	mov x+0, R6
	
	; The temperature can be calculated as (ADC*500/1024)-273 (may overflow 16 bit operations)
	; or (ADC*250/512)-273 (may overflow 16 bit operations)
	; or (ADC*125/256)-273 (may overflow 16 bit operations)
	; or (ADC*62/256)+(ADC*63/256)-273 (Does not overflow 16 bit operations!)
	
	Load_y(62)
	lcall mul16
	mov R4, x+1

	mov x+1, R7
	mov x+0, R6

	Load_y(63)
	lcall mul16
	mov R5, x+1
	
	mov x+0, R4
	mov x+1, #0
	mov y+0, R5
	mov y+1, #0
	lcall add16
	
	Load_y(273)
	lcall sub16
	
	mov new_temp, x
	mov x, temp_avg
	lcall hex2bcd
	lcall Display_temp
	
	ret
Send_arduino: ;assume that the byte to write is already in R0
	clr CE_ARDUINO
	lcall DO_SPI_G
	setb CE_ARDUINO
	ret
; Configure the serial port and baud rate using timer 2
InitSerialPort:
	clr TR2 ; Disable timer 2
	mov T2CON, #30H ; RCLK=1, TCLK=1 
	mov RCAP2H, #high(T2LOAD)  
	mov RCAP2L, #low(T2LOAD)
	setb TR2 ; Enable timer 2
	mov SCON, #52H
	ret

; Send a character through the serial port
putchar:
    JNB TI, putchar
    CLR TI
    MOV SBUF, a
    RET

; Send a constant-zero-terminated string through the serial port
SendString:
    CLR A
    MOVC A, @A+DPTR
    JZ SSDone
    LCALL putchar
    INC DPTR
    SJMP SendString
SSDone:
    ret
    
send_number:
	push acc
	swap a
	anl a, #0fh
	orl a, #30h ; Convert to ASCII
	lcall putchar
	pop acc
	anl a, #0fh
	orl a, #30h ; Convert to ASCII
	lcall putchar
	ret

Hello_World:
    DB  'Hello, World!', '\r', '\n', 0

MyProgram:
    MOV SP, #7FH
    mov LEDRA, #0
    mov LEDRB, #0
    mov LEDRC, #0
    mov LEDG, #0
    orl P0MOD, #00011000b ; make all CEs outputs
    mov P1MOD, #0H
	setb CE_ADC
	setb CE_ARDUINO
	
 	mov TMOD,  #00010000B ; GATE=0, C/T*=0, M1=0, M0=1: 16-bit timer
	clr TR1 ; Disable timer 1
	clr TF1
	mov TH1, #high(TIMER1_RELOAD)
	mov TL1, #low(TIMER1_RELOAD)
    setb TR1 ; Enable timer 1
    setb ET1 ; Disable timer 0 interrupt
	setb EA
    lcall INI_SPI
    LCALL InitSerialPort
    
    
    MOV DPTR, #Hello_World
    LCALL SendString

   Forever:
	lcall get_temperature
	mov a, BCD+0
	lcall send_number
	mov R0, BCD+0
	lcall send_arduino
	mov a, #'\n'
	lcall putchar
	lcall delay
    SJMP Forever
END