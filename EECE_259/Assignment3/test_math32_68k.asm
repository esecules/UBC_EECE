; test_math32_68k.asm:  This program is used to test the 32
; arithmetic routines in math32_68k.asm
;
; by Jesus Calvino-Fraga (2013)
;

PortA	equ	$00400000
PortB	equ	$00400002
PortC	equ	$00400004
PortD	equ	$00400006
HEXA	equ	$00400010
HEXB	equ	$00400012
HEXC	equ	$00400014
HEXD	equ	$00400016

	org	$10000	;set the start address for our variables in Ram
x          ds.l          1
y          ds.l          1
bcd	ds.b	5

	org	$00800000
	jmp myprogram

           ; Load the library of 32-bit operations
           include math32_68k.asm

;----------------------------------------------------------------------
; This subroutine reads the switches in port A and B and combines then
; into a word.  It is used by get_switch below.
;----------------------------------------------------------------------
portAB_to_d1
	move.l #0, d1
	move.b portB, d1
	andi.w  #$ffef, sr ; clear X flag
	roxl.w #8, d1
	move.b portA, d1
	ori.l #$10000, d1 ; Sets the end bit
	rts

;----------------------------------------------------------------------
; This subroutine checks the toggle switches and returns the number of
; of the first one that is toggled up (1).  For example if SW7 is toggle
; up/down, this subroutine returns 7 in d0.  If no switches are toggled,
; 16 is returned.
;----------------------------------------------------------------------
get_switch
           jsr portAB_to_d1
           move.l d1, d2
           ; A bit of debouncing
           move.l #31250,d0	; load d0 with a big number
get_switch_loop
 	subq.l #1,d0		; decrement d0
	bne    get_switch_loop		; keep decrementing until d0 = 0
           jsr portAB_to_d1
           cmp    d1, d2
           beq    get_switch_good      ; If we got the same value after two reads -> good!
           move.l #16, d0
           rts
get_switch_good
           move.l #0,d0
get_switch_next
           btst d0,d1
           bne get_switch_done
           addi.l #1,d0
           bra get_switch_next
           rts
get_switch_done
           jsr portAB_to_d1
           andi.l #$ffff, d1 ; Mask off the end bit
           btst d0,d1
           bne get_switch_done ; Wait until the switch is set back to zero
           rts

;----------------------------------------------------------------------
; Takes the eight least significant bits of 'bcd' and sends them to the
; seven segment displays.
;----------------------------------------------------------------------
display_bcd
	lea.l   bcd, a0
	move.b (a0)+,HEXA
	move.b (a0)+,HEXB
	move.b (a0)+,HEXC
	move.b (a0)+,HEXD
	rts

wait_for_sw0_toggle
	jsr     get_switch
	cmp.b   #0, d0
	bne     wait_for_sw0_toggle
	rts

; This macro is used to test the math operations and display the result.
do_math  macro num1, num2, operation
	move.l  #num1, x
	move.l  #num2, y
	jsr     operation
	jsr     bin2bcd
	jsr     display_bcd
	jsr     wait_for_sw0_toggle
	endm

myprogram
	; Test division.  222222 / 2 = 111111
	do_math 222222, 2, div32

	; Test division.  7679232 / 2222 = 3456
	do_math 7679232, 2222, div32

	; Test division by zero.  7679232 / 0 = 4294967295 (only 94967295 displayed)
	do_math 7679232, 0, div32

	; Test division by one.  7679232 / 1 = 7679232
	do_math 7679232, 1, div32

	; Test division by same.  12345678 / 12345678 = 1
	do_math 12345678, 12345678, div32

	; Test addition.  2345678 + 10000000 = 12345678
	do_math 2345678, 10000000, add32

	; Test subtraction.  12345678 - 2345678 =10000000
	do_math 12345678, 2345678, sub32

	; Test multiplication.  2222 x 3456 = 7679232
	do_math 2222, 3456, mul32

	; Test multiplication.  45000000 x 2 = 90000000
	do_math 2, 45000000, mul32 ; Multiplication is commutative!

	jmp     myprogram