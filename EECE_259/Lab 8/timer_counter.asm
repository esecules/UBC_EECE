$modde2
DSEG at 35
freq: 	   ds 3 ;24 bits
bcd:       ds 4 ;8 digits
PartProd:  ds 5
Mult:      ds 3 
Num1:      ds 3
Num2:      ds 3
BSEG at 30
nonZero: dbit 1
CSEG
ljmp init 
T_7seg:
    DB 40H, 79H, 24H, 30H, 19H
    DB 12H, 02H, 78H, 00H, 10H
Wait1s:
	mov R2, #59
	L3: mov R1, #251
	L2: mov R0, #250
	L1:
	nop
	nop
	jnb  TF0, noOverflow ;4 Machine cycles
	inc R3	
	clr TF0		 ; overflow count stored in ov
	noOverflow:
	djnz R0, L1 ; 9 machine cycles-> 9*30ns*250=67.5us
	djnz R1, L2 ; 67.5us*251=ms
	djnz R2, L3 ; 16.9425ms*59=1s (.9996075s)-0.03925% error
	
ret

readTime:
	lcall clrTimer
	setb TR0 ;timer on
	lcall Wait1s
	clr TR0 ;timer off
	mov freq+0, TL0
	mov freq+1, TH0
	mov freq+2, R3
;	mov freq+0, #0FFH
;	mov freq+1, #0H
;	mov freq+2, #0H
	
	lcall hex2bcd
ret

initTimer:
	clr TR0 ; Stop timer 0
	mov a, #11110000B ; Clear the bits of timer 0
	anl a,TMOD
	orl a, #00000101B ; Set timer 0 as 16-bit counter
	mov TMOD, a
	ret
	
clrTimer:
	lcall initTimer
	; Stop counter 0
	clr TR0
	; 2) Reset the counter
	mov TL0, #0
	mov TH0, #0
	
	ret
	

hex2bcd:
	push acc
	push psw
	push AR0
	clr a
	mov R5, #24 ;Loop counter.
	mov bcd+0, #0
	mov bcd+1, #0
	mov bcd+2, #0
	mov bcd+3, #0

	L0:
		mov a, freq+2
		mov c, acc.7 ; This way x remains unchanged!
		mov a, freq+0 ;Shift R0-R1 left through carry
		rlc a
		mov freq+0, a
		mov a, freq+1
		rlc a
		mov freq+1, a
		mov a, freq+2
		rlc a
		mov freq+2, a
		; Perform bcd + bcd + carry
		; using BCD numbers
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
		mov a, bcd+3
		addc a, bcd+3
		da a
		mov bcd+3, a
		djnz R5, L0
	
	pop AR0	
	pop psw
	pop acc
	ret


DispTime:
		clr nonZero
		mov a, #7fH
		mov HEX0,a
		mov HEX1,a
		mov HEX2,a
		mov HEX3,a
		mov HEX4,a
		mov HEX5,a
		mov HEX6,a
		mov HEX7,a
		
		mov dptr, #T_7seg
	
		mov a, bcd+3
		swap a
		anl a, #0FH
		jnz continue7
		jnb nonZero,skip7
		continue7:
		setb nonZero
		movc a, @a+dptr
		mov HEX7, a
	Skip7:	
		
		mov a, bcd+3
		anl a, #0FH
		jnz continue6
		jnb nonZero,skip6
		continue6:
		setb nonZero
		movc a, @a+dptr
		mov HEX6, a
	Skip6:
	
		mov a, bcd+2
		swap a
		anl a, #0FH
		jnz continue5
		jnb nonZero,skip5
		continue5:
		setb nonZero
		movc a, @a+dptr
		mov HEX5, a
	Skip5:
	
		mov a, bcd+2
		anl a, #0FH
		jnz continue4
		jnb nonZero,skip4
		continue4:
		setb nonZero
		movc a, @a+dptr
		mov HEX4, a
	Skip4:
		
		mov a, bcd+1
		swap a
		anl a, #0FH
		jnz continue3
		jnb nonZero,skip3
		continue3:
		setb nonZero
		movc a, @a+dptr
		mov HEX3, a
	Skip3:
	
		mov a, bcd+1
		anl a, #0FH
		jnz continue2
		jnb nonZero,skip2
		continue2:
		setb nonZero
		movc a, @a+dptr
		mov HEX2, a
	Skip2:
	
		mov a, bcd+0
		swap a
		anl a, #0FH
		jnz continue1
		jnb nonZero,skip1
		continue1:
		setb nonZero
		movc a, @a+dptr
		mov HEX1, a
	Skip1:
	
		mov a, bcd+0
		anl a, #0FH
		movc a, @a+dptr
		mov HEX0, a
		
		

ret	



init:
	mov SP, #7FH
	clr a
	mov LEDRA, a
	mov LEDRB, a
	mov LEDRC, a
	mov LEDG, a



forever:
	lcall readTime
	lcall dispTime
	clr a
	mov R3, a ;clear the overflow count
	ljmp forever
	
	
END