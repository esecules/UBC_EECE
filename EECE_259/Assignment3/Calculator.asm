PortA	equ	$00400000
PortB	equ	$00400002
PortC	equ	$00400004
PortD	equ	$00400006
HEXA	equ	$00400010
HEXB	equ	$00400012
HEXC	equ	$00400014
HEXD	equ	$00400016

        	  org	$10000 ; set the start address for our variables in Ram
x          ds.l          1
y          ds.l          1
temp       ds.l          1
bcd	  ds.b	        5

 org	$00800000
 jmp init

 include math32_68k.asm
 include Read_sw8.asm
Wait2Sec
     move.l #95,  d5
Lp3: move.l #250, d6
Lp2: move.l #250, d7
Lp1: dbeq d7, Lp1
	dbeq d6, Lp2
	dbeq d5, Lp3
	rts
calculate
         cmp.b #15, d0
         beq do_add
         cmp.b #14, d0
         beq do_sub
         cmp.b #13, d0
         beq do_mult
         cmp.b #12, d0
         beq do_div
         cmp.b #10, d0
         beq do_clear
         rts
do_clear
         move.l #0 , x
         move.l #0 , y
         move.l #0 , bcd
         jsr bin2bcd
         jsr display_bcd
         rts
do_mult
         jsr getY
         jsr mul32
         jsr bin2bcd
         jsr display_bcd
         jsr CLR_XY
         rts
do_div
         jsr getY
         jsr div32
         jsr bin2bcd
         jsr display_bcd
         jsr CLR_XY
         rts
do_add
         jsr getY
         jsr add32
         jsr bin2bcd
         jsr display_bcd
         jsr CLR_XY
         rts
do_sub
         jsr getY
         jsr sub32
         jsr bin2bcd
         jsr display_bcd
         jsr CLR_XY
         rts
getY
         jsr bcd2bin
         jsr xchg_xy
         jsr bin2bcd
         jsr display_bcd
read_Y
         jsr     get_switch
         cmp.b   #11, d0
         beq     BREAK
         cmp.b   #10, d0
         beq     CLR_XY
         cmp.b   #9, d0
         bgt     read_Y
         ; A new number was keyed in
         jsr     insert_bcd_digit
         jsr     display_bcd
         jmp     read_Y
BREAK
         jsr bcd2bin
         jsr xchg_xy
         rts
xchg_xy
         move.l x, temp
         move.l y, x
         move.l temp, y
         rts
CLR_XY
         move.l #0,x
         move.l #0,y
         rts
init
        	move.l #44581122, x
	jsr bin2bcd
	jsr display_bcd
	jsr Wait2Sec
         move.l #0, x
         move.l #0, y ;Just to be sure its actually clear
         jsr bin2bcd
	jsr  display_bcd

myprogram
           jsr     get_switch
           jsr     calculate
           cmp.b   #9, d0
           bgt     myprogram
           ; A new number was keyed in
           jsr     insert_bcd_digit
           jsr     display_bcd
           jmp     myprogram