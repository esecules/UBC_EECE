;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Wed Mar 05 14:45:44 2014
;--------------------------------------------------------
$name lab5_code_v1
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
	public _getPhaseAngle
	public _getQuarterPeriod
	public _getHalfPeriod
	public _RMS
	public _voltage
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
_main_count_1_62:
	ds 2
_main_j_1_62:
	ds 2
_main_freq_1_62:
	ds 4
_main_lut_1_62:
	ds 10
_main_disp_1_62:
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
;i                         Allocated to registers r2 r3 
;count                     Allocated to registers r4 r5 
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:58: int i= 0;
	mov	r2,#0x00
	mov	r3,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:59: int count = 0;
	mov	r4,#0x00
	mov	r5,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:60: while(i < 9){
L005005?:
	clr	c
	mov	a,r2
	subb	a,#0x09
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jc	L005014?
	ret
L005014?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:61: count++; 
	inc	r4
	cjne	r4,#0x00,L005015?
	inc	r5
L005015?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:62: if(count == 166){
	cjne	r4,#0xA6,L005004?
	cjne	r5,#0x00,L005004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:63: i++;
	inc	r2
	cjne	r2,#0x00,L005018?
	inc	r3
L005018?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:64: if(i == 10)
	cjne	r2,#0x0A,L005002?
	cjne	r3,#0x00,L005002?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:65: i=0;
	mov	r2,#0x00
	mov	r3,#0x00
L005002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:66: P2=lut[i];
	mov	a,r2
	add	a,#_checkLED_lut_1_30
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:67: count=0;
	mov	r4,#0x00
	mov	r5,#0x00
L005004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:69: P3=disp[0];
	mov	_P3,_checkLED_disp_1_30
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:70: wait2ms();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:71: P3=disp[1];
	mov	_P3,(_checkLED_disp_1_30 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:72: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:73: P3=disp[2];
	mov	_P3,(_checkLED_disp_1_30 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:74: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:75: P3=disp[3];
	mov	_P3,(_checkLED_disp_1_30 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:76: wait2ms();
	lcall	_wait2ms
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	ljmp	L005005?
;------------------------------------------------------------
;Allocation info for local variables in function 'circle'
;------------------------------------------------------------
;step                      Allocated to registers r2 r3 
;lut                       Allocated with name '_circle_lut_1_34'
;disp                      Allocated with name '_circle_disp_1_34'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:79: void circle(int step){
;	-----------------------------------------
;	 function circle
;	-----------------------------------------
_circle:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:80: char lut[6] = {0B_11111110,0B_11111101,0B_11111011,0B_11101111,0B_11011111,0B_10111111};
	mov	_circle_lut_1_34,#0xFE
	mov	(_circle_lut_1_34 + 0x0001),#0xFD
	mov	(_circle_lut_1_34 + 0x0002),#0xFB
	mov	(_circle_lut_1_34 + 0x0003),#0xEF
	mov	(_circle_lut_1_34 + 0x0004),#0xDF
	mov	(_circle_lut_1_34 + 0x0005),#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:81: char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	mov	_circle_disp_1_34,#0xDF
	mov	(_circle_disp_1_34 + 0x0001),#0xBF
	mov	(_circle_disp_1_34 + 0x0002),#0x7F
	mov	(_circle_disp_1_34 + 0x0003),#0xEF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:82: switch(step){
	mov	a,r3
	jnb	acc.7,L006021?
	ret
L006021?:
	clr	c
	mov	a,#0x0D
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L006022?
	ret
L006022?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L006023?
	jmp	@a+dptr
L006023?:
	ljmp	L006001?
	ljmp	L006002?
	ljmp	L006003?
	ljmp	L006004?
	ljmp	L006005?
	ljmp	L006006?
	ljmp	L006007?
	ljmp	L006008?
	ljmp	L006009?
	ljmp	L006010?
	ljmp	L006011?
	ljmp	L006012?
	ljmp	L006013?
	ljmp	L006014?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:83: case 0:
L006001?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:84: P2=lut[0];
	mov	_P2,_circle_lut_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:85: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:86: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:87: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:88: case 1:
L006002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:89: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:90: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:91: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:92: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:93: case 2:
L006003?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:94: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:95: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:96: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:97: break;
	ljmp	_wait
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:98: case 3:
L006004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:99: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:100: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:101: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:102: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:103: case 4:
	ljmp	_wait
L006005?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:104: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:105: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:106: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:107: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:108: case 5:
	ljmp	_wait
L006006?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:109: P2=lut[1];
	mov	_P2,(_circle_lut_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:110: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:111: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:112: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:113: case 6:
	ljmp	_wait
L006007?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:114: P2=lut[2];
	mov	_P2,(_circle_lut_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:115: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:116: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:117: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:118: case 7:
	ljmp	_wait
L006008?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:119: P2=lut[3];
	mov	_P2,(_circle_lut_1_34 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:120: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:121: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:122: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:123: case 8:
	ljmp	_wait
L006009?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:124: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:125: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:126: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:127: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:128: case 9:
	ljmp	_wait
L006010?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:129: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:130: P3=disp[2];
	mov	_P3,(_circle_disp_1_34 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:131: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:132: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:133: case 10:
	ljmp	_wait
L006011?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:134: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:135: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:136: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:137: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:138: case 11:
	ljmp	_wait
L006012?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:139: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:140: P3=disp[1];
	mov	_P3,(_circle_disp_1_34 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:141: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:142: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:143: case 12:
	ljmp	_wait
L006013?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:144: P2=lut[4];
	mov	_P2,(_circle_lut_1_34 + 0x0004)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:145: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:146: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:147: break;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:148: case 13:
	ljmp	_wait
L006014?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:149: P2=lut[5];
	mov	_P2,(_circle_lut_1_34 + 0x0005)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:150: P3=disp[0];
	mov	_P3,_circle_disp_1_34
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:151: wait();
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:154: }
	ljmp	_wait
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:156: void SPIWrite( unsigned char value) 
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:158: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA 
	anl	_SPSTA,#0x7F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:159: SPDAT=value; 
	mov	_SPDAT,r2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:160: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end 
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:164: unsigned int GetADC(unsigned char channel) 
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:169: SPCON&=(~SPEN); // Disable SPI 
	anl	_SPCON,#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:170: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS; 
	mov	_SPCON,#0x3F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:171: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:172: P1_4=0; // Activate the MCP3004 ADC. 
	clr	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:173: SPIWrite(channel|0x18); // Send start bit, single/diff* bit, D2, D1, and D0 bits. 
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:174: for(adc=0; adc<10; adc++){}; // Wait for S/H to setup 
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:175: SPIWrite(0x55); // Read bits 9 down to 4 
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:176: adc=((SPDAT&0x3f)*0x100); 
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:177: SPIWrite(0x55); // Read bits 3 down to 0 
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:178: P1_4=1; // Deactivate the MCP3004 ADC. 
	setb	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:179: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:180: adc>>=4;
	swap	a
	xch	a,r2
	swap	a
	anl	a,#0x0f
	xrl	a,r2
	xch	a,r2
	anl	a,#0x0f
	xch	a,r2
	xrl	a,r2
	xch	a,r2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:182: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'voltage'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:185: float voltage (unsigned char channel) 
;	-----------------------------------------
;	 function voltage
;	-----------------------------------------
_voltage:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:187: return ( (GetADC(channel)*4.77)/1023.0 ); // VCC=4.77V (measured) 
	lcall	_GetADC
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
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'RMS'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:190: float RMS (unsigned char channel)
;	-----------------------------------------
;	 function RMS
;	-----------------------------------------
_RMS:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:192: return ( (GetADC(channel)/1.41421356237) ); //sqrt(2) = 1.41421356237
	lcall	_GetADC
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0xF3
	push	acc
	mov	a,#0x04
	push	acc
	mov	a,#0xB5
	push	acc
	mov	a,#0x3F
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
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getHalfPeriod'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;halfPeriodRef             Allocated to registers 
;halfPeriodTest            Allocated to registers 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:212: unsigned int getHalfPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getHalfPeriod
;	-----------------------------------------
_getHalfPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:216: if(channel==REF)
	mov	a,dpl
	mov	r2,a
	jnz	L011023?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:219: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:220: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:221: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:222: while(P1_0==1){} //Wait for the signal to be 0
L011001?:
	jb	_P1_0,L011001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:223: while(P1_0==0){} //Wait for the signal to be 1
L011004?:
	jnb	_P1_0,L011004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:224: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:225: while(P1_0==1){}
L011007?:
	jb	_P1_0,L011007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:226: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:228: halfPeriodRef=(TH0*0x100+TL0);	//Assumed period is unsigned int
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:230: return halfPeriodRef;
	ret
L011023?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:232: else if(channel==TEST)
	cjne	r2,#0x01,L011020?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:235: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:236: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:237: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:238: while(P1_1==1){} //Wait for the signal to be 0
L011010?:
	jb	_P1_1,L011010?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:239: while(P1_1==0){} //Wait for the signal to be 1
L011013?:
	jnb	_P1_1,L011013?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:240: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:241: while(P1_1==1){}
L011016?:
	jb	_P1_1,L011016?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:242: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:244: halfPeriodTest=(TH0*0x100+TL0);	//Assumed period is unsigned int
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:246: return halfPeriodTest;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:249: return -1;
	ret
L011020?:
	mov	dptr,#0xFFFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getQuarterPeriod'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:252: unsigned int getQuarterPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getQuarterPeriod
;	-----------------------------------------
_getQuarterPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:254: return getHalfPeriod(channel);
	ljmp	_getHalfPeriod
;------------------------------------------------------------
;Allocation info for local variables in function 'getPhaseAngle'
;------------------------------------------------------------
;phaseDifference           Allocated to registers r2 r3 
;phaseAngle                Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:256: float getPhaseAngle()
;	-----------------------------------------
;	 function getPhaseAngle
;	-----------------------------------------
_getPhaseAngle:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:260: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:261: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:262: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:263: while(P1_0==1){} //Wait for the reference signal to be 0
L013001?:
	jb	_P1_0,L013001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:264: while(P1_0==0){} //Wait for the reference signal to be 1
L013004?:
	jnb	_P1_0,L013004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:265: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:266: while(P1_1==0){}
L013007?:
	jnb	_P1_1,L013007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:267: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:269: phaseDifference=(TH0*0x100+TL0);
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:270: phaseAngle = phaseDifference*(1.0/(2.0*getHalfPeriod(0)))*360.0;
	mov	dpl,#0x00
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:271: return phaseAngle;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;count                     Allocated with name '_main_count_1_62'
;j                         Allocated with name '_main_j_1_62'
;freq                      Allocated with name '_main_freq_1_62'
;lut                       Allocated with name '_main_lut_1_62'
;disp                      Allocated with name '_main_disp_1_62'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;sloc3                     Allocated with name '_main_sloc3_1_0'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:273: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:275: int count = 0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:276: int j = 0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:277: unsigned long int freq=0;
	clr	a
	mov	_main_count_1_62,a
	mov	(_main_count_1_62 + 1),a
	mov	_main_j_1_62,a
	mov	(_main_j_1_62 + 1),a
	mov	_main_freq_1_62,a
	mov	(_main_freq_1_62 + 1),a
	mov	(_main_freq_1_62 + 2),a
	mov	(_main_freq_1_62 + 3),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:278: char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	mov	_main_lut_1_62,#0x88
	mov	(_main_lut_1_62 + 0x0001),#0xF9
	mov	(_main_lut_1_62 + 0x0002),#0x4C
	mov	(_main_lut_1_62 + 0x0003),#0x68
	mov	(_main_lut_1_62 + 0x0004),#0x39
	mov	(_main_lut_1_62 + 0x0005),#0x2A
	mov	(_main_lut_1_62 + 0x0006),#0x0A
	mov	(_main_lut_1_62 + 0x0007),#0xF8
	mov	(_main_lut_1_62 + 0x0008),#0x08
	mov	(_main_lut_1_62 + 0x0009),#0x38
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:279: char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	mov	_main_disp_1_62,#0xDF
	mov	(_main_disp_1_62 + 0x0001),#0xBF
	mov	(_main_disp_1_62 + 0x0002),#0x7F
	mov	(_main_disp_1_62 + 0x0003),#0xEF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:280: checkLED();
	lcall	_checkLED
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:281: TR0=0; // Disable timer/counter 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:282: TMOD=0B_00010101; // Set timer/counter 0 as 16-bit counter and timer2 as a 16bit timer
	mov	_TMOD,#0x15
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:283: while(1) 
L014019?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:285: if(count == 0){
	mov	a,_main_count_1_62
	orl	a,(_main_count_1_62 + 1)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:287: TL0=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:288: TH0=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:289: TH1=0;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:290: TL1=0;
	jnz	L014002?
	mov	_TL0,a
	mov	_TH0,a
	mov	_TH1,a
	mov	_TL1,a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:292: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:293: TR1=1;
	setb	_TR1
L014002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:296: count++;
	inc	_main_count_1_62
	clr	a
	cjne	a,_main_count_1_62,L014032?
	inc	(_main_count_1_62 + 1)
L014032?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:297: if(count == 71){
	mov	a,#0x47
	cjne	a,_main_count_1_62,L014033?
	clr	a
	cjne	a,(_main_count_1_62 + 1),L014033?
	sjmp	L014034?
L014033?:
	ljmp	L014004?
L014034?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:299: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:300: TR1=0;
	clr	_TR1
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:301: freq=(TH0*256+TL0);
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
	mov	_main_freq_1_62,_main_sloc1_1_0
	mov	a,(_main_sloc1_1_0 + 1)
	mov	(_main_freq_1_62 + 1),a
	rlc	a
	subb	a,acc
	mov	(_main_freq_1_62 + 2),a
	mov	(_main_freq_1_62 + 3),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:302: count=0;
	clr	a
	mov	_main_count_1_62,a
	mov	(_main_count_1_62 + 1),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:303: printf("Rref V RMS: %.2lf Test V RMS: %.2lf\tPhase dif: %.2lf deg\r",RMS(REF),RMS(TEST),getPhaseAngle());
	lcall	_getPhaseAngle
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	dpl,#0x01
	lcall	_RMS
	mov	_main_sloc3_1_0,dpl
	mov	(_main_sloc3_1_0 + 1),dph
	mov	(_main_sloc3_1_0 + 2),b
	mov	(_main_sloc3_1_0 + 3),a
	mov	dpl,#0x00
	lcall	_RMS
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
L014004?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:305: if(freq > 0 ){
	mov	a,_main_freq_1_62
	orl	a,(_main_freq_1_62 + 1)
	orl	a,(_main_freq_1_62 + 2)
	orl	a,(_main_freq_1_62 + 3)
	jnz	L014035?
	ljmp	L014016?
L014035?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:306: if(freq < 1000){ //0 Hz - 999 Hz	  	
	clr	c
	mov	a,_main_freq_1_62
	subb	a,#0xE8
	mov	a,(_main_freq_1_62 + 1)
	subb	a,#0x03
	mov	a,(_main_freq_1_62 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_62 + 3)
	subb	a,#0x00
	jc	L014036?
	ljmp	L014011?
L014036?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:307: P2=lut[freq%10];
	mov	__modulong_PARM_2,#0x0A
	clr	a
	mov	(__modulong_PARM_2 + 1),a
	mov	(__modulong_PARM_2 + 2),a
	mov	(__modulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_62
	mov	dph,(_main_freq_1_62 + 1)
	mov	b,(_main_freq_1_62 + 2)
	mov	a,(_main_freq_1_62 + 3)
	lcall	__modulong
	mov	r2,dpl
	mov	a,r2
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:308: P3=disp[0];
	mov	_P3,_main_disp_1_62
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:309: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:310: P2=lut[(freq/10)%10];
	mov	__divulong_PARM_2,#0x0A
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_62
	mov	dph,(_main_freq_1_62 + 1)
	mov	b,(_main_freq_1_62 + 2)
	mov	a,(_main_freq_1_62 + 3)
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:311: P3=disp[1];
	mov	_P3,(_main_disp_1_62 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:312: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:313: P2=lut[(freq/100)%10];
	mov	__divulong_PARM_2,#0x64
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_main_freq_1_62
	mov	dph,(_main_freq_1_62 + 1)
	mov	b,(_main_freq_1_62 + 2)
	mov	a,(_main_freq_1_62 + 3)
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:314: P3=disp[2];
	mov	_P3,(_main_disp_1_62 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:315: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:316: P2=lut[3];
	mov	_P2,(_main_lut_1_62 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:317: P3=disp[3];
	mov	_P3,(_main_disp_1_62 + 0x0003)
	ljmp	L014019?
L014011?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:319: else if(freq < 10000){ //1.00 kHz - 9.99 kHz
	clr	c
	mov	a,_main_freq_1_62
	subb	a,#0x10
	mov	a,(_main_freq_1_62 + 1)
	subb	a,#0x27
	mov	a,(_main_freq_1_62 + 2)
	subb	a,#0x00
	mov	a,(_main_freq_1_62 + 3)
	subb	a,#0x00
	jc	L014037?
	ljmp	L014008?
L014037?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:320: P2=lut[(freq/1000)%10];
	mov	__divulong_PARM_2,#0xE8
	mov	(__divulong_PARM_2 + 1),#0x03
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,_main_freq_1_62
	mov	dph,(_main_freq_1_62 + 1)
	mov	b,(_main_freq_1_62 + 2)
	mov	a,(_main_freq_1_62 + 3)
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:321: P2&=0B_11110111;
	anl	_P2,#0xF7
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:322: P3=disp[0];
	mov	_P3,_main_disp_1_62
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:323: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:324: P2=lut[((freq/1000)/10)%10];
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:325: P3=disp[1];
	mov	_P3,(_main_disp_1_62 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:326: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:327: P2=lut[((freq/1000)/100)%10];
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:328: P3=disp[2];
	mov	_P3,(_main_disp_1_62 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:329: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:330: P2=lut[3];
	mov	_P2,(_main_lut_1_62 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:331: P3=disp[3];
	mov	_P3,(_main_disp_1_62 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:332: wait2ms();
	lcall	_wait2ms
	ljmp	L014019?
L014008?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:334: else if(freq < 100000){ //10.0 kHz - 99.9 kHz
	clr	c
	mov	a,_main_freq_1_62
	subb	a,#0xA0
	mov	a,(_main_freq_1_62 + 1)
	subb	a,#0x86
	mov	a,(_main_freq_1_62 + 2)
	subb	a,#0x01
	mov	a,(_main_freq_1_62 + 3)
	subb	a,#0x00
	jc	L014038?
	ljmp	L014019?
L014038?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:335: P2=lut[(freq/10000)%10];
	mov	__divulong_PARM_2,#0x10
	mov	(__divulong_PARM_2 + 1),#0x27
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,_main_freq_1_62
	mov	dph,(_main_freq_1_62 + 1)
	mov	b,(_main_freq_1_62 + 2)
	mov	a,(_main_freq_1_62 + 3)
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:336: P3=disp[0];
	mov	_P3,_main_disp_1_62
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:337: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:338: P2=lut[((freq/10000)/10)%10];
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:339: P2&=0B_11110111;
	anl	_P2,#0xF7
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:340: P3=disp[1];
	mov	_P3,(_main_disp_1_62 + 0x0001)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:341: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:342: P2=lut[((freq/10000)/100)%10];
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
	add	a,#_main_lut_1_62
	mov	r0,a
	mov	_P2,@r0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:343: P3=disp[2];
	mov	_P3,(_main_disp_1_62 + 0x0002)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:344: wait2ms();
	lcall	_wait2ms
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:345: P2=lut[3];
	mov	_P2,(_main_lut_1_62 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:346: P3=disp[3];
	mov	_P3,(_main_disp_1_62 + 0x0003)
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:347: wait2ms();
	lcall	_wait2ms
	ljmp	L014019?
L014016?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:351: count += 35;
	mov	a,#0x23
	add	a,_main_count_1_62
	mov	_main_count_1_62,a
	clr	a
	addc	a,(_main_count_1_62 + 1)
	mov	(_main_count_1_62 + 1),a
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:352: circle(j);
	mov	dpl,_main_j_1_62
	mov	dph,(_main_j_1_62 + 1)
	lcall	_circle
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:353: j++;
	inc	_main_j_1_62
	clr	a
	cjne	a,_main_j_1_62,L014039?
	inc	(_main_j_1_62 + 1)
L014039?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:354: if(j > 13)
	clr	c
	mov	a,#0x0D
	subb	a,_main_j_1_62
	clr	a
	xrl	a,#0x80
	mov	b,(_main_j_1_62 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L014040?
	ljmp	L014019?
L014040?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:355: j=0;
	clr	a
	mov	_main_j_1_62,a
	mov	(_main_j_1_62 + 1),a
	ljmp	L014019?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Rref V RMS: %.2lf Test V RMS: %.2lf'
	db 0x09
	db 'Phase dif: %.2lf deg'
	db 0x0D
	db 0x00

	CSEG

end
