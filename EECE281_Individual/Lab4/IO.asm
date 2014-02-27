;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Wed Feb 26 23:19:03 2014
;--------------------------------------------------------
$name IO
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _circle
	public _checkLED
	public _getFreq
	public _wait2ms
	public _wait
	public _wait1s
	public __c51_external_startup
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_B              DATA 0xf0
_PSW            DATA 0xd0
_SP             DATA 0x81
_SPX            DATA 0xef
_DPL            DATA 0x82
_DPH            DATA 0x83
_DPLB           DATA 0xd4
_DPHB           DATA 0xd5
_PAGE           DATA 0xf6
_AX             DATA 0xe1
_BX             DATA 0xf7
_DSPR           DATA 0xe2
_FIRD           DATA 0xe3
_MACL           DATA 0xe4
_MACH           DATA 0xe5
_PCON           DATA 0x87
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa1
_CKRL           DATA 0x97
_CKCKON0        DATA 0x8f
_CKCKON1        DATA 0xaf
_CKSEL          DATA 0x85
_CLKREG         DATA 0xae
_OSCCON         DATA 0x85
_IE             DATA 0xa8
_IEN0           DATA 0xa8
_IEN1           DATA 0xb1
_IPH0           DATA 0xb7
_IP             DATA 0xb8
_IPL0           DATA 0xb8
_IPH1           DATA 0xb3
_IPL1           DATA 0xb2
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_P0M0           DATA 0xe6
_P0M1           DATA 0xe7
_P1M0           DATA 0xd6
_P1M1           DATA 0xd7
_P2M0           DATA 0xce
_P2M1           DATA 0xcf
_P3M0           DATA 0xc6
_P3M1           DATA 0xc7
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_BDRCON         DATA 0x9b
_BRL            DATA 0x9a
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TCONB          DATA 0x91
_TL0            DATA 0x8a
_TH0            DATA 0x8c
_TL1            DATA 0x8b
_TH1            DATA 0x8d
_RL0            DATA 0xf2
_RH0            DATA 0xf3
_RTL1           DATA 0xf4
_RH1            DATA 0xf5
_WDTRST         DATA 0xa6
_WDTPRG         DATA 0xa7
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_RCAP2H         DATA 0xcb
_RCAP2L         DATA 0xca
_TH2            DATA 0xcd
_TL2            DATA 0xcc
_SPCON          DATA 0xc3
_SPSTA          DATA 0xc4
_SPDAT          DATA 0xc5
_SSCON          DATA 0x93
_SSCS           DATA 0x94
_SSDAT          DATA 0x95
_SSADR          DATA 0x96
_KBLS           DATA 0x9c
_KBE            DATA 0x9d
_KBF            DATA 0x9e
_KBMOD          DATA 0x9f
_BMSEL          DATA 0x92
_FCON           DATA 0xd2
_EECON          DATA 0xd2
_ACSRA          DATA 0xa3
_ACSRB          DATA 0xab
_AREF           DATA 0xbd
_DADC           DATA 0xa4
_DADI           DATA 0xa5
_DADL           DATA 0xac
_DADH           DATA 0xad
_CCON           DATA 0xd8
_CMOD           DATA 0xd9
_CL             DATA 0xe9
_CH             DATA 0xf9
_CCAPM0         DATA 0xda
_CCAPM1         DATA 0xdb
_CCAPM2         DATA 0xdc
_CCAPM3         DATA 0xdd
_CCAPM4         DATA 0xde
_CCAP0H         DATA 0xfa
_CCAP1H         DATA 0xfb
_CCAP2H         DATA 0xfc
_CCAP3H         DATA 0xfd
_CCAP4H         DATA 0xfe
_CCAP0L         DATA 0xea
_CCAP1L         DATA 0xeb
_CCAP2L         DATA 0xec
_CCAP3L         DATA 0xed
_CCAP4L         DATA 0xee
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_P              BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES             BIT 0xac
_ET2            BIT 0xad
_EC             BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS             BIT 0xbc
_PT2            BIT 0xbd
_IP0D           BIT 0xbf
_PPCL           BIT 0xbe
_PT2L           BIT 0xbd
_PLS            BIT 0xbc
_PT1L           BIT 0xbb
_PX1L           BIT 0xba
_PT0L           BIT 0xb9
_PX0L           BIT 0xb8
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_RXD            BIT 0xb0
_TXD            BIT 0xb1
_INT0           BIT 0xb2
_INT1           BIT 0xb3
_T0             BIT 0xb4
_T1             BIT 0xb5
_WR             BIT 0xb6
_RD             BIT 0xb7
_P4_0           BIT 0xc0
_P4_1           BIT 0xc1
_P4_2           BIT 0xc2
_P4_3           BIT 0xc3
_P4_4           BIT 0xc4
_P4_5           BIT 0xc5
_P4_6           BIT 0xc6
_P4_7           BIT 0xc7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_SM2            BIT 0x9d
_SM1            BIT 0x9e
_SM0            BIT 0x9f
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_CP_RL2         BIT 0xc8
_C_T2           BIT 0xc9
_TR2            BIT 0xca
_EXEN2          BIT 0xcb
_TCLK           BIT 0xcc
_RCLK           BIT 0xcd
_EXF2           BIT 0xce
_TF2            BIT 0xcf
_CF             BIT 0xdf
_CR             BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_checkLED_lut_1_34:
	ds 10
_checkLED_disp_1_34:
	ds 3
_circle_lut_1_38:
	ds 6
_circle_disp_1_38:
	ds 3
_main_j_1_41:
	ds 2
_main_lut_1_41:
	ds 10
_main_disp_1_41:
	ds 3
_main_sloc0_1_0:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:8: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:11: P0M0=0;	P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:12: P1M0=0;	P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:13: P2M0=0;	P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:14: P3M0=0;	P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:15: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	mov	_AUXR,#0x11
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:16: P4M0=0;	P4M1=0;
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:18: setbaud_timer2(TIMER_2_RELOAD); // Initialize serial port using timer 2
	mov	dptr,#0xFFFA
	lcall	_setbaud_timer2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:19: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait1s'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:22: void wait1s (void)
;	-----------------------------------------
;	 function wait1s
;	-----------------------------------------
_wait1s:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:34: _endasm;
	
 ;For a 22.1184MHz crystal one machine cycle
 ;takes 12/22.1184MHz=0.5425347us
	 mov R2, #20
	 L3:
	mov R1, #250
	 L2:
	mov R0, #184
	 L1:
	djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	 djnz R1, L2 ; 200us*250=0.05s
	 djnz R2, L3 ; 0.05s*20=1s
	 ret
	 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:36: void wait (void)
;	-----------------------------------------
;	 function wait
;	-----------------------------------------
_wait:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:48: _endasm;
	
 ;For a 22.1184MHz crystal one machine cycle
 ;takes 12/22.1184MHz=0.5425347us
	 mov R2, #2
	 N3:
	mov R1, #250
	 N2:
	mov R0, #184
	 N1:
	djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	 djnz R1, L2 ; 200us*250=0.05s
	 djnz R2, L3 ; 0.05s*20=1s
	 ret
	 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait2ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:50: void wait2ms (void)
;	-----------------------------------------
;	 function wait2ms
;	-----------------------------------------
_wait2ms:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:60: _endasm;
	
 ;For a 22.1184MHz crystal one machine cycle
 ;takes 12/22.1184MHz=0.5425347us
	  mov R1, #10 ;200 us* 10 = 2 ms.
	 M2:
	mov R0, #184
	 M1:
	djnz R0, M1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	 djnz R1, M2 ; 200us*250=0.05s
	 ret
	 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getFreq'
;------------------------------------------------------------
;frequency                 Allocated to registers 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:62: unsigned int getFreq (void)
;	-----------------------------------------
;	 function getFreq
;	-----------------------------------------
_getFreq:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:68: TL0=0;
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:69: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:71: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:75: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:76: frequency=TH0*256+TL0;
	mov	r3,_TH0
	mov	r2,#0x00
	mov	r4,_TL0
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:79: return frequency;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'checkLED'
;------------------------------------------------------------
;lut                       Allocated with name '_checkLED_lut_1_34'
;disp                      Allocated with name '_checkLED_disp_1_34'
;i                         Allocated to registers r2 r3 
;count                     Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:81: void checkLED(void){
;	-----------------------------------------
;	 function checkLED
;	-----------------------------------------
_checkLED:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:82: char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	mov	_checkLED_lut_1_34,#0x88
	mov	(_checkLED_lut_1_34 + 0x0001),#0xF9
	mov	(_checkLED_lut_1_34 + 0x0002),#0x4C
	mov	(_checkLED_lut_1_34 + 0x0003),#0x68
	mov	(_checkLED_lut_1_34 + 0x0004),#0x39
	mov	(_checkLED_lut_1_34 + 0x0005),#0x2A
	mov	(_checkLED_lut_1_34 + 0x0006),#0x0A
	mov	(_checkLED_lut_1_34 + 0x0007),#0xF8
	mov	(_checkLED_lut_1_34 + 0x0008),#0x08
	mov	(_checkLED_lut_1_34 + 0x0009),#0x38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:83: char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	mov	_checkLED_disp_1_34,#0xC0
	mov	(_checkLED_disp_1_34 + 0x0001),#0xA0
	mov	(_checkLED_disp_1_34 + 0x0002),#0x60
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:84: int i= 0;
	mov	r2,#0x00
	mov	r3,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:85: int count = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:86: while(1){
L007006?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:87: count++; 
	inc	r4
	cjne	r4,#0x00,L007013?
	inc	r5
L007013?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:88: if(count == 166){
	cjne	r4,#0xA6,L007004?
	cjne	r5,#0x00,L007004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:89: i++;
	inc	r2
	cjne	r2,#0x00,L007016?
	inc	r3
L007016?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:90: if(i == 10)
	cjne	r2,#0x0A,L007002?
	cjne	r3,#0x00,L007002?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:91: i=0;
	mov	r2,#0x00
	mov	r3,#0x00
L007002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:92: P1=lut[i];
	mov	a,r2
	add	a,#_checkLED_lut_1_34
	mov	r0,a
	mov	_P1,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:93: count=0;
	mov	r4,#0x00
	mov	r5,#0x00
L007004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:95: P3=0B_11000000;
	mov	_P3,#0xC0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:96: wait2ms();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:97: P3=0B_10100000;
	mov	_P3,#0xA0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:98: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:99: P3=0B_01100000;
	mov	_P3,#0x60
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:100: wait2ms();
	lcall	_wait2ms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	sjmp	L007006?
;------------------------------------------------------------
;Allocation info for local variables in function 'circle'
;------------------------------------------------------------
;step                      Allocated to registers r2 r3 
;lut                       Allocated with name '_circle_lut_1_38'
;disp                      Allocated with name '_circle_disp_1_38'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:103: void circle(int step){
;	-----------------------------------------
;	 function circle
;	-----------------------------------------
_circle:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:104: char lut[6] = {0B_11111110,0B_11111101,0B_11111011,0B_11101111,0B_11011111,0B_10111111};
	mov	_circle_lut_1_38,#0xFE
	mov	(_circle_lut_1_38 + 0x0001),#0xFD
	mov	(_circle_lut_1_38 + 0x0002),#0xFB
	mov	(_circle_lut_1_38 + 0x0003),#0xEF
	mov	(_circle_lut_1_38 + 0x0004),#0xDF
	mov	(_circle_lut_1_38 + 0x0005),#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:105: char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	mov	_circle_disp_1_38,#0xC0
	mov	(_circle_disp_1_38 + 0x0001),#0xA0
	mov	(_circle_disp_1_38 + 0x0002),#0x60
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:106: switch(step){
	mov	a,r3
	jnb	acc.7,L008021?
	ret
L008021?:
	clr	c
	mov	a,#0x0D
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L008022?
	ret
L008022?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L008023?
	jmp	@a+dptr
L008023?:
	ljmp	L008001?
	ljmp	L008002?
	ljmp	L008003?
	ljmp	L008004?
	ljmp	L008005?
	ljmp	L008006?
	ljmp	L008007?
	ljmp	L008008?
	ljmp	L008009?
	ljmp	L008010?
	ljmp	L008011?
	ljmp	L008012?
	ljmp	L008013?
	ljmp	L008014?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:107: case 0:
L008001?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:108: P1=lut[0];
	mov	_P1,_circle_lut_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:109: P3=disp[0];
	mov	_P3,_circle_disp_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:110: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:111: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:112: case 1:
L008002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:113: P1=lut[1];
	mov	_P1,(_circle_lut_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:114: P3=disp[0];
	mov	_P3,_circle_disp_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:115: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:116: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:117: case 2:
L008003?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:118: P1=lut[2];
	mov	_P1,(_circle_lut_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:119: P3=disp[0];
	mov	_P3,_circle_disp_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:120: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:121: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:122: case 3:
L008004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:123: P1=lut[1];
	mov	_P1,(_circle_lut_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:124: P3=disp[1];
	mov	_P3,(_circle_disp_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:125: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:126: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:127: case 4:
	ljmp	_wait
L008005?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:128: P1=lut[2];
	mov	_P1,(_circle_lut_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:129: P3=disp[1];
	mov	_P3,(_circle_disp_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:130: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:131: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:132: case 5:
	ljmp	_wait
L008006?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:133: P1=lut[1];
	mov	_P1,(_circle_lut_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:134: P3=disp[2];
	mov	_P3,(_circle_disp_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:135: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:136: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:137: case 6:
	ljmp	_wait
L008007?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:138: P1=lut[2];
	mov	_P1,(_circle_lut_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:139: P3=disp[2];
	mov	_P3,(_circle_disp_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:140: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:141: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:142: case 7:
	ljmp	_wait
L008008?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:143: P1=lut[3];
	mov	_P1,(_circle_lut_1_38 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:144: P3=disp[2];
	mov	_P3,(_circle_disp_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:145: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:146: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:147: case 8:
	ljmp	_wait
L008009?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:148: P1=lut[4];
	mov	_P1,(_circle_lut_1_38 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:149: P3=disp[2];
	mov	_P3,(_circle_disp_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:150: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:151: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:152: case 9:
	ljmp	_wait
L008010?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:153: P1=lut[5];
	mov	_P1,(_circle_lut_1_38 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:154: P3=disp[2];
	mov	_P3,(_circle_disp_1_38 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:155: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:156: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:157: case 10:
	ljmp	_wait
L008011?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:158: P1=lut[4];
	mov	_P1,(_circle_lut_1_38 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:159: P3=disp[1];
	mov	_P3,(_circle_disp_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:160: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:161: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:162: case 11:
	ljmp	_wait
L008012?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:163: P1=lut[5];
	mov	_P1,(_circle_lut_1_38 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:164: P3=disp[1];
	mov	_P3,(_circle_disp_1_38 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:165: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:166: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:167: case 12:
	ljmp	_wait
L008013?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:168: P1=lut[4];
	mov	_P1,(_circle_lut_1_38 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:169: P3=disp[0];
	mov	_P3,_circle_disp_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:170: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:171: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:172: case 13:
	ljmp	_wait
L008014?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:173: P1=lut[5];
	mov	_P1,(_circle_lut_1_38 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:174: P3=disp[0];
	mov	_P3,_circle_disp_1_38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:175: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:178: }
	ljmp	_wait
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;count                     Allocated to registers r2 r3 
;j                         Allocated with name '_main_j_1_41'
;cap                       Allocated to registers r4 r5 
;Ra                        Allocated to registers 
;Rb                        Allocated to registers 
;lut                       Allocated with name '_main_lut_1_41'
;disp                      Allocated with name '_main_disp_1_41'
;freq                      Allocated to registers r6 r7 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:180: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:182: int count = 0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:183: int j = 0;
	clr	a
	mov	r2,a
	mov	r3,a
	mov	_main_j_1_41,a
	mov	(_main_j_1_41 + 1),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:187: char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	mov	_main_lut_1_41,#0x88
	mov	(_main_lut_1_41 + 0x0001),#0xF9
	mov	(_main_lut_1_41 + 0x0002),#0x4C
	mov	(_main_lut_1_41 + 0x0003),#0x68
	mov	(_main_lut_1_41 + 0x0004),#0x39
	mov	(_main_lut_1_41 + 0x0005),#0x2A
	mov	(_main_lut_1_41 + 0x0006),#0x0A
	mov	(_main_lut_1_41 + 0x0007),#0xF8
	mov	(_main_lut_1_41 + 0x0008),#0x08
	mov	(_main_lut_1_41 + 0x0009),#0x38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:188: char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	mov	_main_disp_1_41,#0xC0
	mov	(_main_disp_1_41 + 0x0001),#0xA0
	mov	(_main_disp_1_41 + 0x0002),#0x60
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:190: TR0=0; // Disable timer/counter 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:191: TMOD=0B_00000101; // Set timer/counter 0 as 16-bit counter
	mov	_TMOD,#0x05
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:192: while(1){
L009009?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:193: unsigned int freq=0;
	mov	r6,#0x00
	mov	r7,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:195: TL0=0;
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:196: TH0=0;
	mov	_TH0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:198: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:200: count++; 
	inc	r2
	cjne	r2,#0x00,L009017?
	inc	r3
L009017?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:201: if(count == 166){
	cjne	r2,#0xA6,L009002?
	cjne	r3,#0x00,L009002?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:203: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:204: freq=TH0*256+TL0;
	mov	r4,_TH0
	mov	(_main_sloc0_1_0 + 1),r4
	mov	_main_sloc0_1_0,#0x00
	mov	r4,_TL0
	mov	r5,#0x00
	mov	a,r4
	add	a,_main_sloc0_1_0
	mov	r6,a
	mov	a,r5
	addc	a,(_main_sloc0_1_0 + 1)
	mov	r7,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:205: count=0;
	mov	r2,#0x00
	mov	r3,#0x00
L009002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:207: if(freq > 0 ){
	mov	a,r6
	orl	a,r7
	jnz	L009020?
	ljmp	L009006?
L009020?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:208: cap = 1.44/(freq*(Ra+2*Rb));
	mov	__mulint_PARM_2,#0x92
	mov	(__mulint_PARM_2 + 1),#0x13
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	lcall	__mulint
	lcall	___uint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x51EC
	mov	b,#0xB8
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2sint
	mov	r4,dpl
	mov	r5,dph
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:209: printf("Capicatance: %d\r\d",cap);  	
	push	ar4
	push	ar5
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar5
	pop	ar4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:210: P1=lut[cap%10];
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
	push	ar4
	push	ar5
	lcall	__modsint
	mov	a,dpl
	add	a,#_main_lut_1_41
	mov	r0,a
	mov	_P1,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:211: P3=disp[0];
	mov	_P3,_main_disp_1_41
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:212: wait2ms();
	lcall	_wait2ms
	pop	ar5
	pop	ar4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:213: P1=lut[(cap/10)%10];
	mov	__divsint_PARM_2,#0x0A
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
	push	ar4
	push	ar5
	lcall	__divsint
	mov	r6,dpl
	mov	r7,dph
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,r6
	mov	dph,r7
	lcall	__modsint
	mov	a,dpl
	add	a,#_main_lut_1_41
	mov	r0,a
	mov	_P1,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:214: P3=disp[1];
	mov	_P3,(_main_disp_1_41 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:215: wait2ms();
	lcall	_wait2ms
	pop	ar5
	pop	ar4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:216: P1=lut[(cap/100)%10];
	mov	__divsint_PARM_2,#0x64
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
	lcall	__modsint
	mov	a,dpl
	add	a,#_main_lut_1_41
	mov	r0,a
	mov	_P1,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:217: P3=disp[2];
	mov	_P3,(_main_disp_1_41 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:218: wait2ms();
	lcall	_wait2ms
	pop	ar3
	pop	ar2
	ljmp	L009009?
L009006?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:221: circle(j);
	mov	dpl,_main_j_1_41
	mov	dph,(_main_j_1_41 + 1)
	push	ar2
	push	ar3
	lcall	_circle
	pop	ar3
	pop	ar2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:222: j++;
	inc	_main_j_1_41
	clr	a
	cjne	a,_main_j_1_41,L009021?
	inc	(_main_j_1_41 + 1)
L009021?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:223: if(j > 13)
	clr	c
	mov	a,#0x0D
	subb	a,_main_j_1_41
	clr	a
	xrl	a,#0x80
	mov	b,(_main_j_1_41 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L009022?
	ljmp	L009009?
L009022?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab4\IO.c:224: j=0;
	clr	a
	mov	_main_j_1_41,a
	mov	(_main_j_1_41 + 1),a
	ljmp	L009009?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Capicatance: %d'
	db 0x0D
	db 'd'
	db 0x00

	CSEG

end
