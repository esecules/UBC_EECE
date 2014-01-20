; This file contains all the song data and the infastructure to play them
rest EQU 65500
Note_F0	EQU	1913
FS0	EQU	5462
G0	EQU	8846
GS0	EQU	12034
A0	EQU	15030
AS0	EQU	17873
B0	EQU	20544
C1	EQU	23062
CS1	EQU	25452
D1	EQU	27701
DS1	EQU	29822
E1	EQU	31825
F1	EQU	33717
FS1	EQU	35505
G1	EQU	37191
GS1	EQU	38780
A1	EQU	40283
AS1	EQU	41700
B1	EQU	43040
C2	EQU	44302
CS2	EQU	45494
D2	EQU	46618
DS2	EQU	47679
E2	EQU	48682
F2	EQU	49628
FS2	EQU	50520
G2	EQU	51363
GS2	EQU	52159
A2	EQU	52909
AS2	EQU	53618
B2	EQU	54287
C3	EQU	54918
CS3	EQU	55514
D3	EQU	56076
DS3	EQU	56607
E3	EQU	57108
F3	EQU	57581
FS3	EQU	58028
G3	EQU	58449
GS3	EQU	58847
A3	EQU	59222
AS3	EQU	59577
B3	EQU	59911
C4	EQU	60227
CS4	EQU	60525
D4	EQU	60806
DS4	EQU	61071
E4	EQU	61322
F4	EQU	61558
FS4	EQU	61782
G4	EQU	61992
GS4	EQU	62191
A4	EQU	62379
AS4	EQU	62556
B4	EQU	62723
C5	EQU	62881
CS5	EQU	63030
D5	EQU	63171
DS5	EQU	63303
E5	EQU	63429
F5	EQU	63547
FS5	EQU	63659
G5	EQU	63764
GS5	EQU	63863
A5	EQU	63957
AS5	EQU	64046
B5	EQU	64129
C6	EQU	64208
CS6	EQU	64283
D6	EQU	64353
DS6	EQU	64419
E6	EQU	64482
F6	EQU	64541
FS6	EQU	64597
G6	EQU	64650
GS6	EQU	64699
A6	EQU	64746
AS6	EQU	64791
B6	EQU	64832
C7	EQU	64872
CS7	EQU	64909
D7	EQU	64944
DS7	EQU	64977
E7	EQU	65009
F7	EQU	65038
FS7	EQU	65066
G7	EQU	65093
GS7	EQU	65117
A7	EQU	65141
AS7	EQU	65163
B7	EQU	65184
C8	EQU	65204
CS8	EQU	65222
D8	EQU	65240
DS8	EQU	65256
;noteLengths
grace	EQU 1
sixteenth	EQU 4
eighth	EQU 8
dot_eighth	EQU 12
quarter	EQU 16
dot_quarter	EQU 24
half	EQU 32
whole 	EQU 64
;Tempos
Fast	EQU 15
Medium	EQU 24
Slow 	EQU 30
	 

playNote mac	
	mov timer0Reload, #low(%0)
	mov timer0reload+1, #high(%0)
	mov noteLen, #(%1)
	setb ET0
	lcall wait
	clr ET0
	lcall wait1
endmac
 
poly mac
	mov timer0Reload, #low(%0)
	mov timer0reload+1, #high(%0)
	mov timer1Reload, #low(%1)
	mov timer1reload+1, #high(%1)
	mov noteLen, #(%2)
	setb ET0
	setb ET1
	lcall wait
	clr ET0
	clr ET1
	lcall wait1
endmac
;the first operand must be strictly greater than the second
mod_down mac
	mov startNote, #low(%0)
	mov startNote+1, #high(%0)
	mov endNote, #low(%1)
	mov endNote+1, #high(%1)
	setb legato
	mov r3, #1
	lcall mod_down_loop
endmac
mod_down_loop:
	playNote(startNote,grace)
	clr c
	mov a, startNote
	subb a, #1
	mov startNote, a
	mov a, startNote+1
	subb a, #0
	mov startNote+1, a
	cjne a, endNote+1, mod_down_loop
	mov a, startNote
	cjne a, endNote, mod_down_loop
	ret
wait:
	lcall graceNote
	djnz noteLen, wait
	ret	
	
wait1:
	jb legato, legato_lable
	lcall graceNote
	legato_lable:
	ret
	
graceNote:
;33.33MHz, 1 clk per cycle: 0.03us
	mov a, R3
	mov R0, a
L3: mov R1, #70
L2: mov R2, #250
	jnb buzzer, skip_wait
L1: djnz R2, L1 ;3*250*0.03us=22.5us
    djnz R1, L2 ;74*22.5us=1.665ms
    djnz R0, L3 ;1.665ms*30=50ms
    skip_wait:
    ret
    
Music:
	jb SWA.0, play_sexy_sax
	jb SWA.1, play_chopsticks
	lcall pirates
	music_1:
	jb buzzer, Music
	ret	
play_sexy_sax:
lcall sexy_sax
jmp music_1
play_chopsticks:
lcall chopsticks
jmp music_1
play_pirates:
lcall pirates
jmp music_1

chopsticks:
	clr legato
	mov R3, #Medium
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)

	
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)

	
	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	
	poly(E6,A6,sixteenth)
	poly(D6,B6,sixteenth)
	poly(C6,C7,eighth)
	
	poly(C6,C7,sixteenth)
	poly(C6,C7,sixteenth)
	poly(D6,B6,sixteenth)
	poly(E6,A6,sixteenth)
	
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	poly(F6,G6,sixteenth)
	
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)
	poly(E6,G6,sixteenth)

	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	poly(C6,B6,sixteenth)
	
	
	poly(E6,A6,sixteenth)
	poly(D6,B6,sixteenth)
	poly(C6,C7,sixteenth)
	playNote(rest,sixteenth)
	poly(F6,G6,sixteenth)
	playNote(rest,sixteenth)
	poly(C6,C7,sixteenth)
	playNote(rest,eighth)
	
	
	playNote(E7, sixteenth)
	playNote(D7, sixteenth)
	playNote(rest,sixteenth)	
	playNote(C7, sixteenth)
	playNote(B6, sixteenth)
	playNote(rest,sixteenth)
	playNote(A6, sixteenth)
	playNote(rest,sixteenth)
	
	playNote(G6, sixteenth)
	playNote(G6, sixteenth)
	playNote(G6, sixteenth)
	playNote(G6, sixteenth)
	playNote(A6, sixteenth)
	playNote(G6, sixteenth)
	
	
	playNote(F6, sixteenth)
	playNote(F6, sixteenth)
	playNote(F6, sixteenth)
	playNote(F6, sixteenth)
	playNote(G6, sixteenth)
	playNote(F6, sixteenth)
	playNote(E6, sixteenth)
	playNote(rest, sixteenth)
	playNote(E7, sixteenth)

	playNote(D7, sixteenth)
	playNote(rest,sixteenth)	
	playNote(C7, sixteenth)

	playNote(B6, sixteenth)
	playNote(rest,sixteenth)
	playNote(A6, sixteenth)
	playNote(rest,sixteenth)
	
	playNote(G6, sixteenth)
	playNote(G6, sixteenth)
	playNote(G6, sixteenth)	
	playNote(G6, sixteenth)	
	playNote(A6, sixteenth)
	playNote(G6, sixteenth)
	
	
	playNote(B6, sixteenth)
	playNote(B6, sixteenth)
	playNote(B6, sixteenth)
	playNote(B6, sixteenth)
	playNote(B6, sixteenth)
	playNote(B6, sixteenth)
	playNote(A6, sixteenth)
	playNote(B6, sixteenth)
	
	playNote(C7, sixteenth)
	playNote(rest, eighth)
	ret	
sexy_sax:
setb legato
mov r3, #medium
	playNote(D6, grace)
	poly(E6,D4, eighth)
	poly(D6,D4, sixteenth)
	poly(A5,D4, dot_eighth)
	poly(F5,D4, eighth)
;	playNote(rest, sixteenth)
	poly(D6,G4, grace)
	poly(E6,G4, eighth)
	poly(D6,G4, sixteenth)
	poly(A5,G4, dot_eighth)
	poly(F5,G4, eighth)
;	playNote(rest, sixteenth)
	poly(AS5,AS4, grace)
	poly(C6,AS4, eighth)
	poly(AS5,AS4, sixteenth)
	poly(F5, AS4, dot_eighth)
	poly(D5,AS4, eighth)
;	playNote(rest, sixteenth)
	poly(AS5,AS4, grace)
	poly(C6,AS4, eighth)
	poly(AS5,AS4, sixteenth)
	poly(F5, AS4, dot_eighth)
	poly(D5,AS4, eighth)
;	playNote(rest, sixteenth)
	
	poly(A4,A5, grace)
	poly(A4,AS5, eighth)
	poly(A4,A5, sixteenth)
	poly(A4,F5, dot_eighth)
	poly(A4,D5, eighth)
	poly(A4,AS4, dot_quarter)
	poly(A4,rest, eighth)
	poly(A4,A4, grace)
	poly(A4,AS4, grace)
	poly(A4,A4, eighth)
	poly(A4,AS4, eighth)
	poly(A4,C5,eighth)
	poly(A4,D5, eighth)
	poly(A4,E5, eighth)
	poly(A4,F5, eighth)
	poly(A4,G5, eighth)
	poly(A4,A5, eighth)	

ret

Pirates:
clr legato
mov r3, #fast
	playNote(A3, sixteenth)
	playNote(A4, sixteenth)
	playNote(C5, sixteenth)
	poly(D4,D5,eighth)
	playNote(D5,eighth)
	playNote(D4, eighth)
	playNote(D5,sixteenth)
	playNote(E5,sixteenth)
	poly(F5, AS3, eighth)
	playNote(F5, eighth)
	playNote(AS3, eighth)
	playNote(F5, sixteenth)
	playNote(G5, sixteenth)
	poly(E5, A3, eighth)
	playNote(E5, eighth)
	playNote(A3, eighth)
	playNote(D5, sixteenth)
	playNote(C5, sixteenth)
	poly(C5, D4, sixteenth)
	playNote(D5, quarter)
	playNote(D4, sixteenth)
	playNote(A4, sixteenth)
	playNote(C5, eighth)
	poly(AS3,D5,eighth)
	playNote(D5,eighth)
	playNote(AS3, eighth)
	playNote(D5,sixteenth)
	playNote(E5,sixteenth)
	poly(F5, F3, eighth)
	playNote(F5, eighth)
	playNote(F3, eighth)
	playNote(F5, sixteenth)
	playNote(G5, sixteenth)
	poly(E5, C4, eighth)
	playNote(E5, eighth)
	playNote(C4, eighth)
	playNote(D5, sixteenth)
	playNote(C5, sixteenth)
	poly(D5, D4, dot_eighth)
	playNote(D3, sixteenth)
	playNote(D3, sixteenth)
	playNote(A4, sixteenth)
	playNote(C5, sixteenth)
	poly(D4,D5,eighth)
	playNote(D5,eighth)
	playNote(D4, eighth)
	playNote(D5,sixteenth)
	playNote(E5,sixteenth)
	poly(G5, AS3, eighth)
	playNote(G5, eighth)
	playNote(AS3, eighth)
	playNote(G5,sixteenth)
	playNote(A5,sixteenth)
	poly(AS5, G3, eighth)
	playNote(AS5, eighth)
	playNote(G3, eighth)
	playNote(A5,sixteenth)
	playNote(G5,sixteenth)
	poly(A5,D4,sixteenth)
	playNote(D5, eighth)
	playNote(D4, eighth)
	playNote(D5,sixteenth)
	playNote(E5,sixteenth)
	poly(F5, AS3, eighth)
	playNote(F5, eighth)
	playNote(AS3, eighth)
	playNote(G5, eighth)
	poly(A5, D4, sixteenth)
	playNote(D5,eighth)
	playNote(A3, eighth)
	playNote(D5,sixteenth)
	playNote(F5,sixteenth)
	Poly(E5, A3, eighth)
	playNote(E5, eighth)
	playNote(A3, eighth)
	playNote(F5, sixteenth)
	playNote(D5, sixteenth)	
	Poly(E5, A3, eighth)
	playNote(A3, sixteenth)

ret
	
