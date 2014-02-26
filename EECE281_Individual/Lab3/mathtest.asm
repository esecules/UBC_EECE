; mathtest.asm:  Examples using math32.asm routines

$MODDE2
org 0000H
   ljmp MyProgram

DSEG at 30H
x:   ds 4
y:   ds 4
bcd: ds 5

BSEG
mf: dbit 1

$include(math32.asm)

CSEG

; Look-up table for 7-seg displays
T_7seg:
    DB 0C0H, 0F9H, 0A4H, 0B0H, 099H
    DB 092H, 082H, 0F8H, 080H, 090H
    DB 088H, 083H

; An unsigned 32-bit number results in a 10-digit BCD number.
; Since there are only eight 7-segment displays on the DE2
; board, wer are limited to just 8-digits BCD numbers.
Display_BCD:
	
	mov dptr, #T_7seg

	mov a, bcd+3
	swap a
	anl a, #0FH
	movc a, @a+dptr
	mov HEX7, a
	
	mov a, bcd+3
	anl a, #0FH
	movc a, @a+dptr
	mov HEX6, a
	
	mov a, bcd+2
	swap a
	anl a, #0FH
	movc a, @a+dptr
	mov HEX5, a
	
	mov a, bcd+2
	anl a, #0FH
	movc a, @a+dptr
	mov HEX4, a
	
	mov a, bcd+1
	swap a
	anl a, #0FH
	movc a, @a+dptr
	mov HEX3, a
	
	mov a, bcd+1
	anl a, #0FH
	movc a, @a+dptr
	mov HEX2, a

	mov a, bcd+0
	swap a
	anl a, #0FH
	movc a, @a+dptr
	mov HEX1, a
	
	mov a, bcd+0
	anl a, #0FH
	movc a, @a+dptr
	mov HEX0, a
	
	ret

wait_for_key1:
key1_is_one:
	jb KEY.1, key1_is_one ; loop while the button is not pressed
key1_is_zero:
	jnb KEY.1, key1_is_zero ; loop while the button is pressed
	ret

MyProgram:
	mov sp, #07FH ; Initialize the stack pointer
	; For the health of your eyes, turn off all LEDs!
	clr a
	mov LEDG,  a
	mov LEDRA, a
	mov LEDRB, a
	mov LEDRC, a

Forever:
	; Try multiplying 1234 x 4567 = 5635678
	mov x+0, #low(1234)
	mov x+1, #high(1234)
	mov x+2, #0
	mov x+3, #0
	mov y+0, #low(4567)
	mov y+1, #high(4567)
	mov y+2, #0
	mov y+3, #0
	; mul32 and hex2bcd are in math32.asm
	lcall mul32
	lcall hex2bcd
	; display the result
	lcall Display_BCD
	; Now wait for key1 to be pressed and released so we can see the result.
	lcall wait_for_key1
	
	; There are macros defined in math32.asm that can be used to load constants
	; to variables x and y. The same code above may be written as:
	Load_x(1234)
	Load_y(4567)
	lcall mul32
	lcall hex2bcd
	lcall Display_BCD
	lcall wait_for_key1
	
	; Try dividing 5635678 / 1234 = 4567
	Load_x(5635678)
	Load_y(1234)
	lcall div32 ; This subroutine is in math32.asm
	lcall hex2bcd
	lcall Display_BCD
	lcall wait_for_key1

	; Try adding 1234 + 4567 = 5801
	Load_x(1234)
	Load_y(4567)
	lcall add32 ; This subroutine is in math32.asm
	lcall hex2bcd
	lcall Display_BCD
	lcall wait_for_key1

	; Try subtracting 4567 - 1234 = 3333
	Load_x(4567)
	Load_y(1234)
	lcall sub32 ; This subroutine is in math32.asm
	lcall hex2bcd
	lcall Display_BCD
	lcall wait_for_key1
	
	; Ok, that was easy.  Try computing the area of circle
	; with a radius of 23.2.  Remember we are working with
	; usigned 32-bit integers here, so there is the risk
	; of overflow, in particular when multiplying big numbers.
	; One trick you may use: approximate pi to 355/113.
	Load_x(232)
	Load_y(232)
	lcall mul32 ; Result is stored in x
	; Now multiply by pi
	Load_y(35500)
	lcall mul32
	Load_y(113)
	lcall div32
	lcall hex2bcd
	lcall Display_BCD ; result should be 1690.9309
	lcall wait_for_key1
	
	ljmp Forever
	
END
