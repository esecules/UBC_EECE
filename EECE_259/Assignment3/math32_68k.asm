;----------------------------------------------------
; math32_68k.asm: Addition, subtraction, multiplication,
; and division of 32-bit integers. Also included are
; binary to bcd and bcd to binary conversion subroutines.
;
; 2013 by Jesus Calvino-Fraga
;
;----------------------------------------------------


;----------------------------------------------------------------------
; This helper subroutine takes a 2-digit packed BCD in d1 and divides it
; by two.  The remainder is returned in X.  It is only called from bcd2bin.
;----------------------------------------------------------------------
rrx_fix_bcd
	roxr.b  #1,d1
	move.w  sr,-(a7) ; 'push' sr.  The X flag lives in sr.
	btst    #7,d1 ; Checks if correction of MSD is needed
	beq     rrx_fix_bcd_L0
	subi    #$30, d1 ; Apply correction to MSD
rrx_fix_bcd_L0
	btst    #3,d1 ; Checks if correction of LSD is needed
	beq     rrx_fix_bcd_L1
	subi    #$03, d1 ; Apply correction to LSD
rrx_fix_bcd_L1
	move.w  (a7)+, sr ; 'pop' sr.  Restore the X flag
	rts

;----------------------------------------------------------------------
; This subroutine takes the 10-digit BCD number in 'bcd' and converts it to
; binary.  The result is saved in 'x'.  It uses the reverse double-dabble
; algorithm
;----------------------------------------------------------------------
bcd2bin
	movem   d0-d2/a0,-(a7)  ; Saved used registers in the stack
	move.w  sr,-(a7) ; 'push' sr.
	move.l	#32,d2		; Up to 32 bits.
bcd2bin_loop
	lea.l	bcd+5, a0
	andi.w  #$ffef,  sr     ; clear X flag
	; BCD digits 9 and 8
	move.b	-(A0), d1
	jsr     rrx_fix_bcd
	move.b	d1, (a0)
	; BCD digits 7 and 6
	move.b	-(A0), d1
	jsr     rrx_fix_bcd
	move.b	d1, (a0)
	; BCD digits 5 and 4
	move.b	-(A0), d1
	jsr     rrx_fix_bcd
	move.b	d1, (a0)
	; BCD digits 3 and 2
	move.b	-(A0), d1
	jsr     rrx_fix_bcd
	move.b	d1, (a0)
	; BCD digits 1 and 0
	move.b	-(A0), d1
	jsr     rrx_fix_bcd
	move.b	d1, (a0)
	; Move the remainder to the binary result
	roxr.l	#1,d0
	; Repeat if needed
	subq.l	#1,d2		; decrement d2
	bne	bcd2bin_loop		; keep decrementing until d2 = 0
	; Done.  Save to x and restore used registers to their original values
	move.l  d0, x
	move.w  (a7)+, sr ; 'pop' sr.
	movem   (a7)+,d0-d2/a0  ; Restore used registers from the stack
	rts

;----------------------------------------------------------------------
; This routine takes the 32-bit binary number in 'x' and converts it to
; BCD.  The result is packed/stored in 'bcd'.  It uses the double-dabble
; algorithm.  The doubling of 'bcd' is performed using the bcd addition
; instruction abcd.
;----------------------------------------------------------------------
bin2bcd
	movem d0-d2/a0,-(a7)  ; Saved used registers in the stack
	move.w sr,-(a7) ; 'push' sr.
	move.l  x, d0
	; Set initial bcd result to all zeroes.
	lea.l	bcd, a0
	move.b	#0, (a0)+
	move.b	#0, (a0)+
	move.b	#0, (a0)+
	move.b	#0, (a0)+
	move.b	#0, (a0)+
	move.l	#32, d2 ; Up to 32 bits.
bin2bcd_loop
	roxl.l	#1,d0
	lea.l	bcd, a0
	; compute bcd=bcd+bcd+X:
	; BCD digits 0 and 1
	move.b	(a0), d1
	abcd	d1, d1
	move.b	d1, (a0)+
	; BCD digits 2 and 3
	move.b	(a0), d1
	abcd	d1, d1
	move.b	d1, (a0)+
	; BCD digits 4 and 5
	move.b	(a0), d1
	abcd	d1, d1
	move.b	d1, (a0)+
	; BCD digits 6 and 7
	move.b	(a0), d1
	abcd	d1, d1
	move.b	d1, (a0)+
	; BCD digits 8 and 9
	move.b	(a0), d1
	abcd	d1, d1
	move.b	d1, (a0)+
	subq.l	#1, d2 ; decrement d2
	bne	bin2bcd_loop  ; keep decrementing until d2 = 0
	; Done
	move.w (a7)+, sr ; 'pop' sr.
	movem (a7)+,d0-d2/a0  ; Restore used registers from the stack
	rts

;----------------------------------------------------------------------
; mul32: multiplies two 32-bit numbers and get a 32-bit result.
; We use the 16-bit unsigned multiply instruction like this:
;
;         D1 D0
;      x  D3 D2
;      --------
;         HA LA  <-- result of D2xD0
;      HB LB     <-- result of D2xD1
;      HC LC     <-- result of D3xD0
; + HD LD        <-- result of D3xD1
; --------------
;   HD,(HB+HC+LD),(HA+LB+LC),LA  <-- 64 bit result
;
; We just care about the least significant 32 bits: (HA+LB+LC), LA
;----------------------------------------------------------------------
mul32
	movem d0-d4,-(a7)  ; Saved used registers in the stack
	move.w sr,-(a7) ; 'push' sr.
	; Get x's high and low parts in d1 and d0 respetively
	move.l x, d0
	andi.l #$ffff, d0
	move.l x, d1
	swap d1
	andi.l #$ffff, d1
	; Get y's high and low parts in d2 and d3 respetively
	move.l y, d2
	andi.l #$ffff, d2
	move.l y, d3
	swap d3
	andi.l #$ffff, d3
	; Compute (HA+LB+LC), LA
	move.l d0, d4
	mulu   d2, d4
	mulu   d2, d1
	swap   d1
	andi.l #$ffff0000,d1
	add.l  d1, d4
	mulu   d3, d0
	swap d0
	andi.l #$ffff0000,d0
	add.l  d0, d4
	; Save result in x, restore registers, and exit
	move.l d4, x
	move.w (a7)+, sr ; 'pop' sr.
	movem (a7)+,d0-d4  ; Restore used registers from the stack
	rts

;------------------------------------------------------
; div32: x = x / y
; This subroutine uses the 'paper-and-pencil'
; method described in page 139 of 'Using the
; MCS-51 microcontroller' by Han-Way Huang.
; Obviously it has been translated to 68k assembly!
;------------------------------------------------------
div32
	movem   d0-d3,-(a7) ; Saved used registers in the stack
	move.w  sr,-(a7) ; 'push' sr.
	move.l  x, d0
	move.l  #0, d1
	move.l  y, d2 ; Put denominator in d2 for speed
	move.l  #32, d3 ; Loop counter.  32 bits.
div32_loop
	; shift [d1,d0] left
	andi.w  #$ffef, sr ; clear X flag
	roxl.l  #1, d0
	roxl.l  #1, d1
	; Check if d1 >= d2.  If true, make d1=d1-d2 and set bit 0 of d0 to 1.
	cmp.l   d2, d1
	blt     div32_nosub
	sub.l   d2, d1
	ori.l   #1, d0
div32_nosub
	subq.l  #1, d3 ; decrement d3
	bne     div32_loop ; keep decrementing until d3 = 0
	move.l  d0, x
	move.w  (a7)+, sr ; 'pop' sr.
	movem   (a7)+,d0-d3 ; Restore used registers from the stack
	rts

;------------------------------------------------
; add32: x = x + y
;------------------------------------------------
add32
	movem d0,-(a7)  ; Saved used registers in the stack
	move.w sr,-(a7) ; 'push' sr.
	move.l x, d0
	add.l y, d0
	move.l d0, x
	move.w (a7)+, sr ; 'pop' sr.
	movem (a7)+,d0  ; Restore used registers from the stack
	rts

;------------------------------------------------
; sub32: x = x - y
;------------------------------------------------
sub32
	movem d0,-(a7)  ; Saved used registers in the stack
	move.w sr,-(a7) ; 'push' sr.
	move.l x, d0
	sub.l y, d0
	move.l d0, x
	move.w (a7)+, sr ; 'pop' sr.
	movem (a7)+,d0  ; Restore used registers from the stack
	rts