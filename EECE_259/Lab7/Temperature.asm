DSEG at 30
x:		ds 2
y:		ds 2
bcd:	ds 3
adc:	ds 2
bseg
mf:   dbit 1

CSEG
$modde2
ljmp init

$include(Temp_LUT.asm)
Load_y MAC
	mov y+0, #low (%0) 
	mov y+1, #high(%0)
	ENDMAC
;------------------------------------------------
; mf=1 if x < y
;------------------------------------------------
adc_lt_y:
	push acc
	push psw
	clr c
	mov a, adc+0
	subb a, y+0
	mov a, adc+1
	subb a, y+1
	mov mf, c
	pop psw
	pop acc
	ret

T_7seg:
    DB 40H, 79H, 24H, 30H, 19H
    DB 12H, 02H, 78H, 00H, 10H


Display_BCD:
	
	mov dptr, #T_7seg

	mov HEX3 , #7FH  ; off
	Load_y(586)
	lcall adc_lt_y
	jnb mf, non_negative
	mov HEX3 , #3FH  ; - 
non_negative:
	
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

read_sw:
	mov adc, SWA
	mov a, SWB
 	anl a, #11b
 	mov adc+1, a
 	
 	Load_y(2)
 	lcall mult16 ; Multiplies adc by 2 since the LUT is 2byte alligned
 	clr c
 	mov dptr, #TEMP_LUT
 	mov a, DPL
 	addc a, adc+0
 	mov DPL, a
 	mov a, DPH
 	addc a, adc+1
 	mov DPH, a
 	clr a
 	movc a, @a+dptr
 	mov x+1, a
 	inc dptr
 	clr a
 	movc a, @a+dptr
 	mov x+0, a
 	lcall hex2bcd
	ret

mult16:
	push acc
	push b
	push psw
	push AR0
	push AR1
		
	; R0 = x+0 * y+0
	; R1 = x+1 * y+0 + x+0 * y+1
	
	; Byte 0
	mov	a,adc+0
	mov	b,y+0
	mul	ab		; x+0 * y+0
	mov	R0,a
	mov	R1,b
	
	; Byte 1
	mov	a,adc+1
	mov	b,y+0
	mul	ab		; x+1 * y+0
	add	a,R1
	mov	R1,a
	clr	a
	addc a,b
	mov	R2,a
	
	mov	a,adc+0
	mov	b,y+1
	mul	ab		; x+0 * y+1
	add	a,R1
	mov	R1,a
	
	mov	adc+1,R1
	mov	adc+0,R0

	pop AR1
	pop AR0
	pop psw
	pop b
	pop acc
	
	ret
hex2bcd:
	push acc
	push psw
	push AR0
	
	clr a
	mov bcd+0, a ; Initialize BCD to 00-00-00 
	mov bcd+1, a
	mov bcd+2, a
	mov r0, #16  ; Loop counter.
hex2bcd_L0:
	; Shift binary left	
	mov a, x+1
	mov c, acc.7 ; This way x remains unchanged!
	mov a, x+0
	rlc a
	mov x+0, a
	mov a, x+1
	rlc a
	mov x+1, a
    
	; Perform bcd + bcd + carry using BCD arithmetic
	mov a, bcd+0
	addc a, bcd+0
	da a
	mov bcd+0, a
	mov a, bcd+1
	addc a, bcd+1
	da a
	mov bcd+1, a
	mov a, bcd+2
	addc a, bcd+2
	da a
	mov bcd+2, a

	djnz r0, hex2bcd_L0

	pop AR0
	pop psw
	pop acc
	ret

init:
	mov SP, #7FH
	clr a
	mov LEDRA, a
	mov LEDRB, a
	mov LEDRC, a
	mov LEDG, a
forever:		
	lcall read_sw
	lcall Display_BCD
	jmp forever
END