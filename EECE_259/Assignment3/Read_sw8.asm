; Read_sw8.asm:  reads sw0 to sw15 in the DE2-68k and displays the
; number in HEX0 to HEX7
;
; by Jesus Calvino-Fraga (2013)
;
;




;----------------------------------------------------------------------
; This subroutine reads the switches in port A and B and combines then
; in a word.  It is used by get_switch below.
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
           lea.l	bcd, a0
           move.b (a0)+,HEXA
           move.b (a0)+,HEXB
           move.b (a0)+,HEXC
           move.b (a0)+,HEXD
           rts

;----------------------------------------------------------------------
; inserts a bcd digit into bcd by shifting it left one digit.  The two
; most signifcant digits are set to zero because there are only eight
; displays.
;----------------------------------------------------------------------
insert_bcd_digit
           move.l #4,d2
insert_bcd_digit_loop
           lea.l bcd, a0
        	andi.w  #$ffef,  sr     ; clear X flag
        	; Bcd digits 0 and 1
	move.b (A0), d1
	roxl.b  #1,d1
	move.b d1, (a0)+
        	; Bcd digits 2 and 3
	move.b (A0), d1
	roxl.b  #1,d1
	move.b d1, (a0)+
        	; Bcd digits 4 and 5
	move.b (A0), d1
	roxl.b  #1,d1
	move.b d1, (a0)+
        	; Bcd digits 6 and 7
	move.b (A0), d1
	roxl.b  #1,d1
	move.b d1, (a0)+
        	; Bcd digits 8 and 9 have not space.  Set them to zero.
	move.b  #0,d1
	move.b d1, (a0)
	subq.l  #1,d2	; decrement d2
	bne     insert_bcd_digit_loop		; keep decrementing until d2 = 0
	; Insert the new digit
	lea.l   bcd, a0
	or.b    d0,(a0)
	rts

