$modde2
DSEG at 30H
sec: 	    ds 1
min:        ds 1
hour:		ds 1
alrm_sec: 	ds 1
alrm_min:   ds 1
alrm_hour:	ds 1
count10ms: 	ds 1
count250ms:	ds 1
BSEG
alrm_AM:  dbit 1
AM: 	  dbit 1
buzzer:	  dbit 1
set_alrm: dbit 1
CSEG
org 0H
ljmp init

org 3H
reti

org 0BH
ljmp Timer0_ISR

org 13H
reti

org 1bh
reti

org 23h
reti

org 2bh
ljmp Timer2_ISR

XTAL           EQU 33333333
FREQ_0         EQU 622 
FREQ_2		   EQU 100 
TIMER0_RELOAD  EQU 65536-(XTAL/(12*2*FREQ_0))
TIMER2_RELOAD  EQU 65536-(XTAL/(12*FREQ_2))


myLUT:
    DB 0C0H, 0F9H, 0A4H, 0B0H, 099H
    DB 092H, 082H, 0F8H, 080H, 090H
    DB 0FFH ; All segments off
AM_PM:
	DB 08H, 0CH 

    
Timer2_ISR:
    
    ; Save used register into the stack
    push psw
    push acc
    push dph
    push dpl
    clr TF2
    ; Increment the counter and check if a second has passed
    ; Allows the buzzer to beep twice a second while working off the same clock
    ; Still keeps accurate time (tested against windows clock)
    inc count10ms
    mov a, count10ms
    cjne A, #25, ISR_Timer2_L0
    mov count10ms, #0H
    inc count250ms
    mov a, count250ms
    cjne a, #4, sound_the_alarm
    mov count250ms, #0H
	
    mov a, sec
    add a, #1
    da a
    mov sec, a
    cjne A, #60H, Compare_time_with_alarm
    mov sec, #0

    mov a, min
    add a, #1
    da a
    mov min, a
    cjne A, #60H, Compare_time_with_alarm
    mov min, #0

    mov a, hour
    add a, #1
    da a
    mov hour, a
    cjne A, #12H, skip_am_pm
   	mov a, AM
   	xrl a, #1
   	mov AM, a
    skip_am_pm:
    cjne A, #13H, Compare_time_with_alarm
    mov hour, #1
    
    
Compare_time_with_alarm:
	mov a, AM
	cjne a, alrm_AM, Not_time_to_wake_up
	mov a, hour
	cjne a, alrm_hour, Not_time_to_wake_up
	mov a, min
	cjne a, alrm_min, Not_time_to_wake_up
	mov a, sec
	cjne a, alrm_sec, Not_time_to_wake_up
	setb buzzer
	Not_time_to_wake_up: ;the current time and the alarm time dont match
	;Lastly check if the buzzer needs to be turned on
sound_the_alarm:
	jnb buzzer, no_beep
    cpl ledg.2
    cpl ET0
  no_beep:
  
ISR_Timer2_L0:
	jb set_alrm, ISR_Timer2_L2
	; Update the display.  This happens every 10 ms
	mov dptr, #AM_PM
	mov a, AM
	movc a, @a+dptr
	mov HEX0, a

	mov dptr, #myLUT

	mov a, sec
	anl a, #0fH
	movc a, @a+dptr
	mov HEX2, a
	mov a, sec
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX3, a

	mov a, min
	anl a, #0fH
	movc a, @a+dptr
	mov HEX4, a
	mov a, min
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX5, a

	mov a, hour
	anl a, #0fH
	movc a, @a+dptr
	mov HEX6, a
	mov a, hour
	jb acc.4, ISR_Timer2_L1
	mov a, #0A0H
ISR_Timer2_L1:
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX7, a
ISR_Timer2_L2:

	; Restore used registers
	pop dpl
	pop dph
	pop acc
	pop psw    
	reti
	
Timer0_ISR:
	jnb buzzer, Buzzer_off
	cpl p0.0
 	mov TH0, #high(TIMER0_RELOAD)
    mov TL0, #low(TIMER0_RELOAD)
	buzzer_off:
	reti
	
	
Update_display:
	push psw
    push acc
    push dph
    push dpl
	; Update the display.  This happens every 10 ms
	mov dptr, #AM_PM
	mov a, AM
	movc a, @a+dptr
	mov HEX0, a
	
	mov dptr, #myLUT

	mov a, sec
	anl a, #0fH
	movc a, @a+dptr
	mov HEX2, a
	mov a, sec
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX3, a

	mov a, min
	anl a, #0fH
	movc a, @a+dptr
	mov HEX4, a
	mov a, min
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX5, a

	mov a, hour
	anl a, #0fH
	movc a, @a+dptr
	mov HEX6, a
	mov a, hour
	jb acc.4, Update_display_L1
	mov a, #0A0H
Update_display_L1:
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX7, a
	; Restore used registers
	pop dpl
	pop dph
	pop acc
	pop psw    
	ret
	
Update_display_alrm:
	push psw
    push acc
    push dph
    push dpl
	; Update the display.  This happens every 10 ms
	mov dptr, #AM_PM
	mov a, alrm_AM
	movc a, @a+dptr
	mov HEX0, a
	
	mov dptr, #myLUT

	mov a, alrm_sec
	anl a, #0fH
	movc a, @a+dptr
	mov HEX2, a
	mov a, alrm_sec
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX3, a

	mov a, alrm_min
	anl a, #0fH
	movc a, @a+dptr
	mov HEX4, a
	mov a, alrm_min
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX5, a

	mov a, alrm_hour
	anl a, #0fH
	movc a, @a+dptr
	mov HEX6, a
	mov a, alrm_hour
	jb acc.4, Update_display_alrm_L1
	mov a, #0A0H
Update_display_alrm_L1:
	swap a
	anl a, #0fH
	movc a, @a+dptr
	mov HEX7, a
	; Restore used registers
	pop dpl
	pop dph
	pop acc
	pop psw    
	ret
	


init:
	mov SP, #7FH
	mov LEDRA,#0
	mov LEDRB,#0
	mov LEDRC,#0
	mov LEDG,#0
	mov P0MOD, #00000011B ; P0.0, P0.1 are outputs.  P0.1 is used for testing Timer 2!
	setb P0.0
	clr p0.4
    mov TMOD,  #00000001B ; GATE=0, C/T*=0, M1=0, M0=1: 16-bit timer
	clr TR0 ; Disable timer 0
	clr TF0
    mov TH0, #high(TIMER0_RELOAD)
    mov TL0, #low(TIMER0_RELOAD)
    setb TR0 ; Enable timer 0
    clr ET0 ; Enable timer 0 interrupt
    
        
    mov T2CON, #00H ; Autoreload is enabled, work as a timer
    clr TR2
    clr TF2
    ; Set up timer 2 to interrupt every 10ms
    mov RCAP2H,#high(TIMER2_RELOAD)
    mov RCAP2L,#low(TIMER2_RELOAD)
    setb TR2
    setb ET2

	mov sec, #58H
	mov min, #59H
	mov hour, #10H
	setb AM
	mov alrm_sec, #00H
	mov alrm_min, #00H
	mov alrm_hour, #11H
	mov count10ms, #0H
	mov count250ms, #0H
	setb alrm_AM
	clr buzzer
	clr set_alrm
    setb EA  ; Enable all interrupts

forever:
	jnb KEY.2, set_time
	jnb key.3, set_alarm
	jnb buzzer, forever
	setb ledg.0
	jb key.1, $
	clr buzzer
	clr ledg.0
	clr ledg.2
	clr ET0
	ljmp forever
set_alarm:
	setb set_alrm ;takes control of the display from the clock
	lcall set_alarm_subroutine
	ljmp forever
set_time:
	lcall set_time_subroutine
	ljmp forever
	
set_time_subroutine:
	jnb key.2, $
	clr ET0
	setHour:
	mov LEDRC, #3H
	jnb key.2, setMin_L1
	jb key.1, setHour
	jnb key.1, $
	mov a, hour
    add a, #1
    da a
    mov hour, a
    cjne A, #12H, skip_set_am_pm
    mov a, AM
   	xrl a, #1
   	mov AM, a
    skip_set_am_pm:
    cjne A, #13H, skip1
    mov hour, #1
    skip1:
	lcall update_display
	ljmp setHour

	setMin_L1:
	jnb key.2 , $
	setMin:
	mov LEDRC, #0H
	mov LEDRB, #30H
	jnb key.2, setSec_L1
	jb key.1, setMin
	jnb key.1, $
	mov a, min
    add a, #1
    da a
    mov min, a
    cjne A, #60H, skip2
    mov min, #0
    skip2:
    lcall update_display
	ljmp setMin
	
	setSec_L1:
	jnb key.2, $
	setSec:
	mov LEDRB, #03H
	jnb key.2, finished
	jb key.1, setSec
	jnb key.1, $
	mov a, sec
    add a, #1
    da a
    mov sec, a
    cjne A, #60H, skip3
    mov sec, #0
    skip3:
    lcall update_display
	ljmp setSec
	finished:
	jnb key.2, $
	setb ET0
	mov LEDRB, #0H
	ret
	
set_alarm_subroutine:
	lcall update_display_alrm
	jnb key.3, $
	set_alrmHour:
	mov LEDRC, #3H
	jnb key.3, set_alrmMin_L1
	jb key.1, set_alrmHour
	jnb key.1, $
	mov a,alrm_hour
    add a, #1
    da a
    mov alrm_hour, a
    cjne A, #12H, skip_alrm_am_pm
    mov a, alrm_AM
   	xrl a, #1
   	mov alrm_AM, a
    skip_alrm_am_pm:
    cjne A, #13H, alrm_skip1
    mov alrm_hour, #1
    alrm_skip1:
	lcall update_display_alrm
	ljmp set_alrmHour

	set_alrmMin_L1:
	jnb key.3 , $
	set_alrmMin:
	mov LEDRC, #0H
	mov LEDRB, #30H
	jnb key.3, set_alrmSec_L1
	jb key.1, set_alrmMin
	jnb key.1, $
	mov a, alrm_min
    add a, #1
    da a
    mov alrm_min, a
    cjne A, #60H, alrm_skip2
    mov alrm_min, #0
    alrm_skip2:
    lcall update_display_alrm
	ljmp set_alrmMin
	
	set_alrmSec_L1:
	jnb key.3, $
	set_alrmSec:
	mov LEDRB, #03H
	jnb key.3, finished_alrm
	jb key.1, set_alrmSec
	jnb key.1, $
	mov a, alrm_sec
    add a, #1
    da a
    mov alrm_sec, a
    cjne A, #60H, alrm_skip3
    mov alrm_sec, #0
    alrm_skip3:
    lcall update_display_alrm
	ljmp set_alrmSec
	finished_alrm:
	jnb key.3, $
	mov LEDRB, #0H
	clr set_alrm ;gives the display back to the clock
ret
	
END