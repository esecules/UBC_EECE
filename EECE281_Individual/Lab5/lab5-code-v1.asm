;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Wed Mar 05 19:56:47 2014
;--------------------------------------------------------
$name lab5_code_v1
$optc51 --model-small
$printf_float
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
	public _getPhaseAngle
	public _getQuarterPeriod
	public _getHalfPeriod
	public _oneShot
	public _GetADC
	public _SPIWrite
	public _circle
	public _checkLED
	public _wait2ms
	public _wait
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
_checkLED_lut_1_30:
	ds 10
_checkLED_disp_1_30:
	ds 4
_circle_lut_1_34:
	ds 6
_circle_disp_1_34:
	ds 4
_oneShot_peak_1_42:
	ds 4
_main_count_1_68:
	ds 2
_main_j_1_68:
	ds 2
_main_freq_1_68:
	ds 4
_main_lut_1_68:
	ds 10
_main_disp_1_68:
	ds 4
_main_sloc0_1_0:
	ds 2
_main_sloc1_1_0:
	ds 2
_main_sloc2_1_0:
	ds 4
_main_sloc3_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:11: unsigned char _c51_external_startup(void) 
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:14: P0M0=0; P0M1=0; 
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:15: P1M0=0; P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:16: P2M0=0; P2M1=0; 
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:17: P3M0=0; P3M1=0; 
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:18: AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O 
	mov	_AUXR,#0x11
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:19: P4M0=0; P4M1=0; // The AT89LP51RB2 has a baud rate generator: 
	mov	_P4M0,#0x00
	mov	_P4M1,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:20: PCON|=0x80; 
	orl	_PCON,#0x80
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:21: SCON = 0x52; 
	mov	_SCON,#0x52
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:22: BDRCON=0; 
	mov	_BDRCON,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:23: BRL=BRG_VAL; 
	mov	_BRL,#0xFA
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:24: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:26: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:28: void wait (void)
;	-----------------------------------------
;	 function wait
;	-----------------------------------------
_wait:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:40: _endasm;
	
 ;For a 22.1184MHz crystal one machine cycle
 ;takes 12/22.1184MHz=0.5425347us
	 mov R2, #2
	 N3:
	mov R1, #250
	 N2:
	mov R0, #184
	 N1:
	djnz R0, N1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	 djnz R1, N2 ; 200us*250=0.05s
	 djnz R2, N3 ; 0.05s*20=1s
	 ret
	 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait2ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:42: void wait2ms (void)
;	-----------------------------------------
;	 function wait2ms
;	-----------------------------------------
_wait2ms:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:52: _endasm;
	
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
;Allocation info for local variables in function 'checkLED'
;------------------------------------------------------------
;lut                       Allocated with name '_checkLED_lut_1_30'
;disp                      Allocated with name '_checkLED_disp_1_30'
;i                         Allocated to registers r4 r5 
;count                     Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:55: void checkLED(void){
;	-----------------------------------------
;	 function checkLED
;	-----------------------------------------
_checkLED:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:56: char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	mov	_checkLED_lut_1_30,#0x88
	mov	(_checkLED_lut_1_30 + 0x0001),#0xF9
	mov	(_checkLED_lut_1_30 + 0x0002),#0x4C
	mov	(_checkLED_lut_1_30 + 0x0003),#0x68
	mov	(_checkLED_lut_1_30 + 0x0004),#0x39
	mov	(_checkLED_lut_1_30 + 0x0005),#0x2A
	mov	(_checkLED_lut_1_30 + 0x0006),#0x0A
	mov	(_checkLED_lut_1_30 + 0x0007),#0xF8
	mov	(_checkLED_lut_1_30 + 0x0008),#0x08
	mov	(_checkLED_lut_1_30 + 0x0009),#0x38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:57: char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	mov	_checkLED_disp_1_30,#0xDF
	mov	(_checkLED_disp_1_30 + 0x0001),#0xBF
	mov	(_checkLED_disp_1_30 + 0x0002),#0x7F
	mov	(_checkLED_disp_1_30 + 0x0003),#0xEF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:59: int count = 0;
	mov	r2,#0x00
	mov	r3,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:60: while(i < 20){
	mov	r4,#0x00
	mov	r5,#0x00
L005003?:
	clr	c
	mov	a,r4
	subb	a,#0x14
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	L005012?
	ret
L005012?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:61: count++; 
	inc	r2
	cjne	r2,#0x00,L005013?
	inc	r3
L005013?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:62: if(count == 166){
	cjne	r2,#0xA6,L005002?
	cjne	r3,#0x00,L005002?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:63: i++;
	inc	r4
	cjne	r4,#0x00,L005016?
	inc	r5
L005016?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:64: P2=lut[i%10];
	mov	__modsint_PARM_2,#0x0A
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,r4
	mov	dph,r5
	push	ar4
	push	ar5
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	pop	ar5
	pop	ar4
	mov	a,r6
	add	a,#_checkLED_lut_1_30
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:65: count=0;
	mov	r2,#0x00
	mov	r3,#0x00
L005002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:67: P3=disp[0];
	mov	_P3,_checkLED_disp_1_30
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:68: wait2ms();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:69: P3=disp[1];
	mov	_P3,(_checkLED_disp_1_30 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:70: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:71: P3=disp[2];
	mov	_P3,(_checkLED_disp_1_30 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:72: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:73: P3=disp[3];
	mov	_P3,(_checkLED_disp_1_30 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:74: wait2ms();
	lcall	_wait2ms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	ljmp	L005003?
;------------------------------------------------------------
;Allocation info for local variables in function 'circle'
;------------------------------------------------------------
;step                      Allocated to registers r2 r3 
;lut                       Allocated with name '_circle_lut_1_34'
;disp                      Allocated with name '_circle_disp_1_34'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:77: void circle(int step){
;	-----------------------------------------
;	 function circle
;	-----------------------------------------
_circle:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:78: char lut[6] = {0B_11111110,0B_11111101,0B_11111011,0B_11101111,0B_11011111,0B_10111111};
	mov	_circle_lut_1_34,#0xFE
	mov	(_circle_lut_1_34 + 0x0001),#0xFD
	mov	(_circle_lut_1_34 + 0x0002),#0xFB
	mov	(_circle_lut_1_34 + 0x0003),#0xEF
	mov	(_circle_lut_1_34 + 0x0004),#0xDF
	mov	(_circle_lut_1_34 + 0x0005),#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:79: char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	mov	_circle_disp_1_34,#0xDF
	mov	(_circle_disp_1_34 + 0x0001),#0xBF
	mov	(_circle_disp_1_34 + 0x0002),#0x7F
	mov	(_circle_disp_1_34 + 0x0003),#0xEF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:80: switch(step){
	mov	a,r3
	jnb	acc.7,L006025?
	ret
L006025?:
	clr	c
	mov	a,#0x11
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L006026?
	ret
L006026?:
	mov	a,r2
L006029?:
	add	a,#(L006027?-3-L006029?)
	movc	a,@a+pc
	push	acc
	mov	a,r2
L006030?:
	add	a,#(L006028?-3-L006030?)
	movc	a,@a+pc
	push	acc
	ret
L006027?:
	db	L006001?
	db	L006002?
	db	L006003?
	db	L006004?
	db	L006005?
	db	L006006?
	db	L006007?
	db	L006008?
	db	L006009?
	db	L006010?
	db	L006011?
	db	L006012?
	db	L006013?
	db	L006014?
	db	L006015?
	db	L006016?
	db	L006017?
	db	L006018?
L006028?:
	db	L006001?>>8
	db	L006002?>>8
	db	L006003?>>8
	db	L006004?>>8
	db	L006005?>>8
	db	L006006?>>8
	db	L006007?>>8
	db	L006008?>>8
	db	L006009?>>8
	db	L006010?>>8
	db	L006011?>>8
	db	L006012?>>8
	db	L006013?>>8
	db	L006014?>>8
	db	L006015?>>8
	db	L006016?>>8
	db	L006017?>>8
	db	L006018?>>8
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:81: case 0:
L006001?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:82: P2=lut[0];
	mov	_P2,_circle_lut_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:83: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:84: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:85: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:86: case 1:
L006002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:87: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:88: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:89: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:90: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:91: case 2:
L006003?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:92: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:93: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:94: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:95: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:96: case 3:
L006004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:97: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:98: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:99: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:100: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:101: case 4:
L006005?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:102: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:103: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:104: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:105: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:106: case 5:
L006006?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:107: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:108: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:109: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:110: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:111: case 6:
L006007?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:112: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:113: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:114: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:115: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:116: case 7:
L006008?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:117: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:118: P3=disp[3];
	mov	_P3,(_circle_disp_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:119: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:120: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:121: case 8:
	ljmp	_wait
L006009?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:122: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:123: P3=disp[3];
	mov	_P3,(_circle_disp_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:124: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:125: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:126: case 9:
	ljmp	_wait
L006010?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:127: P2=lut[3];
	mov	_P2,(_circle_lut_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:128: P3=disp[3];
	mov	_P3,(_circle_disp_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:129: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:130: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:131: case 10:
	ljmp	_wait
L006011?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:132: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:133: P3=disp[3];
	mov	_P3,(_circle_disp_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:134: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:135: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:136: case 11:
	ljmp	_wait
L006012?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:137: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:138: P3=disp[3];
	mov	_P3,(_circle_disp_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:139: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:140: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:141: case 12:
	ljmp	_wait
L006013?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:142: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:143: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:144: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:145: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:146: case 13:
	ljmp	_wait
L006014?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:147: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:148: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:149: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:150: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:151: case 14:
	ljmp	_wait
L006015?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:152: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:153: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:154: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:155: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:156: case 15:
	ljmp	_wait
L006016?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:157: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:158: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:159: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:160: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:161: case 16:
	ljmp	_wait
L006017?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:162: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:163: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:164: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:165: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:166: case 17:
	ljmp	_wait
L006018?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:167: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:168: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:169: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:172: }
	ljmp	_wait
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:174: void SPIWrite( unsigned char value) 
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:176: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA 
	anl	_SPSTA,#0x7F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:177: SPDAT=value; 
	mov	_SPDAT,r2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:178: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end 
L007001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L007001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:182: unsigned int GetADC(unsigned char channel) 
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:187: SPCON&=(~SPEN); // Disable SPI 
	anl	_SPCON,#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:188: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS; 
	mov	_SPCON,#0x3F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:189: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:190: P1_4=0; // Activate the MCP3004 ADC. 
	clr	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:191: SPIWrite(channel|0x18); // Send start bit, single/diff* bit, D2, D1, and D0 bits. 
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:192: for(adc=0; adc<10; adc++){}; // Wait for S/H to setup 
	mov	r2,#0x0A
	mov	r3,#0x00
L008003?:
	dec	r2
	cjne	r2,#0xff,L008009?
	dec	r3
L008009?:
	mov	a,r2
	orl	a,r3
	jnz	L008003?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:193: SPIWrite(0xff); // Read bits 9 down to 4 
	mov	dpl,#0xFF
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:194: adc=((SPDAT&0x3f)<<4); 
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r2,a
	clr	a
	swap	a
	anl	a,#0xf0
	xch	a,r2
	swap	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf0
	xch	a,r2
	xrl	a,r2
	mov	r3,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:196: SPIWrite(0xff); // Read bits 3 down to 0
	mov	dpl,#0xFF
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:198: P1_4=1; // Deactivate the MCP3004 ADC. 
	setb	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:199: adc|=(SPDAT&0xf0)>>4; // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	swap	a
	anl	a,#0x0f
	mov	r5,#0x00
	orl	ar2,a
	mov	a,r5
	orl	ar3,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:201: return adc*4.77/1023;
	mov	dpl,r2
	mov	dph,r3
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xA3D7
	mov	b,#0x98
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ljmp	___fs2uint
;------------------------------------------------------------
;Allocation info for local variables in function 'oneShot'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;temp                      Allocated to registers r7 r0 r1 r3 
;peak                      Allocated with name '_oneShot_peak_1_42'
;rms                       Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:216: float oneShot(unsigned char channel)
;	-----------------------------------------
;	 function oneShot
;	-----------------------------------------
_oneShot:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:219: float peak = 0;
	mov	_oneShot_peak_1_42,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:221: if(channel==0)
	clr	a
	mov	(_oneShot_peak_1_42 + 1),a
	mov	(_oneShot_peak_1_42 + 2),a
	mov	(_oneShot_peak_1_42 + 3),a
	mov	a,r2
	jnz	L009026?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:223: while(P1_0==1){}
L009001?:
	jb	_P1_0,L009001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:224: while(P1_0==0){}
L009004?:
	jnb	_P1_0,L009004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:225: while(P1_0==1)
L009009?:
	jb	_P1_0,L009043?
	ljmp	L009027?
L009043?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:227: temp = GetADC(channel);
	mov	dpl,r2
	push	ar2
	lcall	_GetADC
	lcall	___uint2fs
	mov	r7,dpl
	mov	r0,dph
	mov	r1,b
	mov	r3,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:229: if(temp > peak) peak = temp;
	push	ar3
	push	ar7
	push	ar0
	push	ar1
	push	_oneShot_peak_1_42
	push	(_oneShot_peak_1_42 + 1)
	push	(_oneShot_peak_1_42 + 2)
	push	(_oneShot_peak_1_42 + 3)
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	mov	a,r3
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L009009?
	mov	_oneShot_peak_1_42,r7
	mov	(_oneShot_peak_1_42 + 1),r0
	mov	(_oneShot_peak_1_42 + 2),r1
	mov	(_oneShot_peak_1_42 + 3),r3
	sjmp	L009009?
L009026?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:232: else if(channel==1)
	cjne	r2,#0x01,L009027?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:234: while(P1_1==1){}
L009012?:
	jb	_P1_1,L009012?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:235: while(P1_1==0){}
L009015?:
	jnb	_P1_1,L009015?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:236: while(P1_1==1)
L009020?:
	jnb	_P1_1,L009027?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:238: temp = GetADC(channel);
	mov	dpl,r2
	push	ar2
	lcall	_GetADC
	lcall	___uint2fs
	mov	r7,dpl
	mov	r0,dph
	mov	r1,b
	mov	r3,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:240: if(temp > peak) peak = temp;
	push	ar3
	push	ar7
	push	ar0
	push	ar1
	push	_oneShot_peak_1_42
	push	(_oneShot_peak_1_42 + 1)
	push	(_oneShot_peak_1_42 + 2)
	push	(_oneShot_peak_1_42 + 3)
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	mov	a,r3
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar3
	pop	ar2
	mov	a,r4
	jz	L009020?
	mov	_oneShot_peak_1_42,r7
	mov	(_oneShot_peak_1_42 + 1),r0
	mov	(_oneShot_peak_1_42 + 2),r1
	mov	(_oneShot_peak_1_42 + 3),r3
	sjmp	L009020?
L009027?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:243: rms = (peak / 1.41421356237);
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_oneShot_peak_1_42
	mov	dph,(_oneShot_peak_1_42 + 1)
	mov	b,(_oneShot_peak_1_42 + 2)
	mov	a,(_oneShot_peak_1_42 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:244: return rms;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getHalfPeriod'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;halfPeriodRef             Allocated to registers 
;halfPeriodTest            Allocated to registers 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:264: unsigned int getHalfPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getHalfPeriod
;	-----------------------------------------
_getHalfPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:268: if(channel==0)
	mov	a,dpl
	mov	r2,a
	jnz	L010023?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:271: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:272: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:273: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:274: while(P1_0==1){} //Wait for the signal to be 0
L010001?:
	jb	_P1_0,L010001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:275: while(P1_0==0){} //Wait for the signal to be 1
L010004?:
	jnb	_P1_0,L010004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:276: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:277: while(P1_0==1){}
L010007?:
	jb	_P1_0,L010007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:278: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:280: halfPeriodRef=(TH0*0x100+TL0);	//Assumed period is unsigned int
	mov	r4,_TH0
	mov	r3,#0x00
	mov	r5,_TL0
	mov	r6,#0x00
	mov	a,r5
	add	a,r3
	mov	dpl,a
	mov	a,r6
	addc	a,r4
	mov	dph,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:282: return halfPeriodRef;
	ret
L010023?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:284: else if(channel==1)
	cjne	r2,#0x01,L010020?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:287: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:288: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:289: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:290: while(P1_1==1){} //Wait for the signal to be 0
L010010?:
	jb	_P1_1,L010010?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:291: while(P1_1==0){} //Wait for the signal to be 1
L010013?:
	jnb	_P1_1,L010013?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:292: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:293: while(P1_1==1){}
L010016?:
	jb	_P1_1,L010016?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:294: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:296: halfPeriodTest=(TH0*0x100+TL0);	//Assumed period is unsigned int
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:298: return halfPeriodTest;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:301: return -1;
	ret
L010020?:
	mov	dptr,#0xFFFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getQuarterPeriod'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:304: unsigned int getQuarterPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getQuarterPeriod
;	-----------------------------------------
_getQuarterPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:306: return getHalfPeriod(channel);
	ljmp	_getHalfPeriod
;------------------------------------------------------------
;Allocation info for local variables in function 'getPhaseAngle'
;------------------------------------------------------------
;phaseDifference           Allocated to registers r2 r3 
;phaseAngle                Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:308: float getPhaseAngle()
;	-----------------------------------------
;	 function getPhaseAngle
;	-----------------------------------------
_getPhaseAngle:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:312: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:313: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:314: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:315: while(P1_1==1){} //Wait for the reference signal to be 0
L012001?:
	jb	_P1_1,L012001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:316: while(P1_1==0){} //Wait for the reference signal to be 1
L012004?:
	jnb	_P1_1,L012004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:317: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:318: while(P1_0==0){}
L012007?:
	jnb	_P1_0,L012007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:319: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:321: phaseDifference=(TH0*0x100+TL0);
	mov	r3,_TH0
	mov	r2,#0x00
	mov	r4,_TL0
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
	mov	r3,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:322: phaseAngle = phaseDifference*(1.0/(2.0*getHalfPeriod(REF)))*360.0;
	mov	dpl,#0x01
	push	ar2
	push	ar3
	lcall	_getHalfPeriod
	lcall	___uint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,#0x40
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	___uint2fs
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:323: return phaseAngle;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;count                     Allocated with name '_main_count_1_68'
;j                         Allocated with name '_main_j_1_68'
;freq                      Allocated with name '_main_freq_1_68'
;lut                       Allocated with name '_main_lut_1_68'
;disp                      Allocated with name '_main_disp_1_68'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;sloc3                     Allocated with name '_main_sloc3_1_0'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:325: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:327: int count = 0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:328: int j = 0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:329: unsigned long int freq=0;
	clr	a
	mov	_main_count_1_68,a
	mov	(_main_count_1_68 + 1),a
	mov	_main_j_1_68,a
	mov	(_main_j_1_68 + 1),a
	mov	_main_freq_1_68,a
	mov	(_main_freq_1_68 + 1),a
	mov	(_main_freq_1_68 + 2),a
	mov	(_main_freq_1_68 + 3),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:330: char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	mov	_main_lut_1_68,#0x88
	mov	(_main_lut_1_68 + 0x0001),#0xF9
	mov	(_main_lut_1_68 + 0x0002),#0x4C
	mov	(_main_lut_1_68 + 0x0003),#0x68
	mov	(_main_lut_1_68 + 0x0004),#0x39
	mov	(_main_lut_1_68 + 0x0005),#0x2A
	mov	(_main_lut_1_68 + 0x0006),#0x0A
	mov	(_main_lut_1_68 + 0x0007),#0xF8
	mov	(_main_lut_1_68 + 0x0008),#0x08
	mov	(_main_lut_1_68 + 0x0009),#0x38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:331: char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	mov	_main_disp_1_68,#0xDF
	mov	(_main_disp_1_68 + 0x0001),#0xBF
	mov	(_main_disp_1_68 + 0x0002),#0x7F
	mov	(_main_disp_1_68 + 0x0003),#0xEF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:333: TR0=0; // Disable timer/counter 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:334: TMOD=0B_00010101; // Set timer/counter 0 as 16-bit counter and timer2 as a 16bit timer
	mov	_TMOD,#0x15
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:335: while(1) 
L013019?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:337: if(count == 0){
	mov	a,_main_count_1_68
	orl	a,(_main_count_1_68 + 1)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:339: TL0=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:340: TH0=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:341: TH1=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:342: TL1=0;
	jnz	L013002?
	mov	_TL0,a
	mov	_TH0,a
	mov	_TH1,a
	mov	_TL1,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:344: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:345: TR1=1;
	setb	_TR1
L013002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:348: count++;
	inc	_main_count_1_68
	clr	a
	cjne	a,_main_count_1_68,L013032?
	inc	(_main_count_1_68 + 1)
L013032?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:349: if(count >= 71){
	clr	c
	mov	a,_main_count_1_68
	subb	a,#0x47
	mov	a,(_main_count_1_68 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L013033?
	ljmp	L013004?
L013033?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:351: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:352: TR1=0;
	clr	_TR1
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:353: freq=(TH0*256+TL0);
	mov	_main_sloc0_1_0,_TH0
	mov	(_main_sloc0_1_0 + 1),_main_sloc0_1_0
	mov	_main_sloc0_1_0,#0x00
	mov	_main_sloc1_1_0,_TL0
	mov	(_main_sloc1_1_0 + 1),#0x00
	mov	a,_main_sloc1_1_0
	add	a,_main_sloc0_1_0
	mov	_main_sloc1_1_0,a
	mov	a,(_main_sloc1_1_0 + 1)
	addc	a,(_main_sloc0_1_0 + 1)
	mov	(_main_sloc1_1_0 + 1),a
	mov	_main_freq_1_68,_main_sloc1_1_0
	mov	a,(_main_sloc1_1_0 + 1)
	mov	(_main_freq_1_68 + 1),a
	rlc	a
	subb	a,acc
	mov	(_main_freq_1_68 + 2),a
	mov	(_main_freq_1_68 + 3),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:354: count=0;
	clr	a
	mov	_main_count_1_68,a
	mov	(_main_count_1_68 + 1),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:355: printf("Rref V RMS: %6.2fV Test V RMS: %6.2fV\tPhase dif: %6.2f deg\r\n",oneShot(REF),oneShot(TEST),getPhaseAngle());
	lcall	_getPhaseAngle
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	dpl,#0x00
	lcall	_oneShot
	mov	_main_sloc3_1_0,dpl
	mov	(_main_sloc3_1_0 + 1),dph
	mov	(_main_sloc3_1_0 + 2),b
	mov	(_main_sloc3_1_0 + 3),a
	mov	dpl,#0x01
	lcall	_oneShot
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	_main_sloc3_1_0
	push	(_main_sloc3_1_0 + 1)
	push	(_main_sloc3_1_0 + 2)
	push	(_main_sloc3_1_0 + 3)
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
L013004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:357: if(freq > 0 ){
	mov	a,_main_freq_1_68
	orl	a,(_main_freq_1_68 + 1)
	orl	a,(_main_freq_1_68 + 2)
	orl	a,(_main_freq_1_68 + 3)
	jnz	L013034?
	ljmp	L013016?
L013034?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:358: if(freq < 1000){ //0 Hz - 999 Hz	  	
	clr	c
	mov	a,_main_freq_1_68
	subb	a,#0xE8
	mov	a,(_main_freq_1_68 + 1)
	subb	a,#0x03
	mov	a,(_main_freq_1_68 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_68 + 3)
	subb	a,#0x00
	jc	L013035?
	ljmp	L013011?
L013035?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:359: P2=lut[freq%10];
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_68
	mov	dph,(_main_freq_1_68 + 1)
	mov	b,(_main_freq_1_68 + 2)
	mov	a,(_main_freq_1_68 + 3)
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:360: P3=disp[0];
	mov	_P3,_main_disp_1_68
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:361: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:362: P2=lut[(freq/10)%10];
	mov	__divulong_PARM_2,#0x0A
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_68
	mov	dph,(_main_freq_1_68 + 1)
	mov	b,(_main_freq_1_68 + 2)
	mov	a,(_main_freq_1_68 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:363: P3=disp[1];
	mov	_P3,(_main_disp_1_68 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:364: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:365: P2=lut[(freq/100)%10];
	mov	__divulong_PARM_2,#0x64
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_68
	mov	dph,(_main_freq_1_68 + 1)
	mov	b,(_main_freq_1_68 + 2)
	mov	a,(_main_freq_1_68 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:366: P3=disp[2];
	mov	_P3,(_main_disp_1_68 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:367: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:368: P2=lut[3];
	mov	_P2,(_main_lut_1_68 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:369: P3=disp[3];
	mov	_P3,(_main_disp_1_68 + 0x0003)
	ljmp	L013019?
L013011?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:371: else if(freq < 10000){ //1.00 kHz - 9.99 kHz
	clr	c
	mov	a,_main_freq_1_68
	subb	a,#0x10
	mov	a,(_main_freq_1_68 + 1)
	subb	a,#0x27
	mov	a,(_main_freq_1_68 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_68 + 3)
	subb	a,#0x00
	jc	L013036?
	ljmp	L013008?
L013036?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:372: P2=lut[(freq/1000)%10];
	mov	__divulong_PARM_2,#0xE8
	mov	(__divulong_PARM_2 + 1),#0x03
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,_main_freq_1_68
	mov	dph,(_main_freq_1_68 + 1)
	mov	b,(_main_freq_1_68 + 2)
	mov	a,(_main_freq_1_68 + 3)
	lcall	__divulong
	mov	_main_sloc3_1_0,dpl
	mov	(_main_sloc3_1_0 + 1),dph
	mov	(_main_sloc3_1_0 + 2),b
	mov	(_main_sloc3_1_0 + 3),a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__modulong
	mov	r6,dpl
	mov	a,r6
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:373: P2&=0B_11110111;
	anl	_P2,#0xF7
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:374: P3=disp[0];
	mov	_P3,_main_disp_1_68
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:375: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:376: P2=lut[((freq/1000)/10)%10];
	mov	__divulong_PARM_2,#0x0A
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:377: P3=disp[1];
	mov	_P3,(_main_disp_1_68 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:378: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:379: P2=lut[((freq/1000)/100)%10];
	mov	__divulong_PARM_2,#0x64
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:380: P3=disp[2];
	mov	_P3,(_main_disp_1_68 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:381: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:382: P2=lut[3];
	mov	_P2,(_main_lut_1_68 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:383: P3=disp[3];
	mov	_P3,(_main_disp_1_68 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:384: wait2ms();
	lcall	_wait2ms
	ljmp	L013019?
L013008?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:386: else if(freq < 100000){ //10.0 kHz - 99.9 kHz
	clr	c
	mov	a,_main_freq_1_68
	subb	a,#0xA0
	mov	a,(_main_freq_1_68 + 1)
	subb	a,#0x86
	mov	a,(_main_freq_1_68 + 2)
	subb	a,#0x01
	mov	a,(_main_freq_1_68 + 3)
	subb	a,#0x00
	jc	L013037?
	ljmp	L013019?
L013037?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:387: P2=lut[(freq/10000)%10];
	mov	__divulong_PARM_2,#0x10
	mov	(__divulong_PARM_2 + 1),#0x27
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,_main_freq_1_68
	mov	dph,(_main_freq_1_68 + 1)
	mov	b,(_main_freq_1_68 + 2)
	mov	a,(_main_freq_1_68 + 3)
	lcall	__divulong
	mov	_main_sloc3_1_0,dpl
	mov	(_main_sloc3_1_0 + 1),dph
	mov	(_main_sloc3_1_0 + 2),b
	mov	(_main_sloc3_1_0 + 3),a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__modulong
	mov	r6,dpl
	mov	a,r6
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:388: P3=disp[0];
	mov	_P3,_main_disp_1_68
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:389: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:390: P2=lut[((freq/10000)/10)%10];
	mov	__divulong_PARM_2,#0x0A
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:391: P2&=0B_11110111;
	anl	_P2,#0xF7
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:392: P3=disp[1];
	mov	_P3,(_main_disp_1_68 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:393: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:394: P2=lut[((freq/10000)/100)%10];
	mov	__divulong_PARM_2,#0x64
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_sloc3_1_0
	mov	dph,(_main_sloc3_1_0 + 1)
	mov	b,(_main_sloc3_1_0 + 2)
	mov	a,(_main_sloc3_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_68
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:395: P3=disp[2];
	mov	_P3,(_main_disp_1_68 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:396: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:397: P2=lut[3];
	mov	_P2,(_main_lut_1_68 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:398: P3=disp[3];
	mov	_P3,(_main_disp_1_68 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:399: wait2ms();
	lcall	_wait2ms
	ljmp	L013019?
L013016?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:403: count += 35;
	mov	a,#0x23
	add	a,_main_count_1_68
	mov	_main_count_1_68,a
	clr	a
	addc	a,(_main_count_1_68 + 1)
	mov	(_main_count_1_68 + 1),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:404: circle(j);
	mov	dpl,_main_j_1_68
	mov	dph,(_main_j_1_68 + 1)
	lcall	_circle
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:405: j++;
	inc	_main_j_1_68
	clr	a
	cjne	a,_main_j_1_68,L013038?
	inc	(_main_j_1_68 + 1)
L013038?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:406: if(j > 17)
	clr	c
	mov	a,#0x11
	subb	a,_main_j_1_68
	clr	a
	xrl	a,#0x80
	mov	b,(_main_j_1_68 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L013039?
	ljmp	L013019?
L013039?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:407: j=0;
	clr	a
	mov	_main_j_1_68,a
	mov	(_main_j_1_68 + 1),a
	ljmp	L013019?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Rref V RMS: %6.2fV Test V RMS: %6.2fV'
	db 0x09
	db 'Phase dif: %6.2f deg'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
