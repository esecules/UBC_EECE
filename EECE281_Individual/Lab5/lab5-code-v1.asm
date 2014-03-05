;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (Dec 12 2012) (MSVC)
; This file was generated Tue Mar 04 22:40:13 2014
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
_main_sloc0_1_0:
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
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:29: void SPIWrite( unsigned char value) 
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:31: SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA 
	anl	_SPSTA,#0x7F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:32: SPDAT=value; 
	mov	_SPDAT,r2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:33: while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end 
L003001?:
	mov	a,#0x80
	anl	a,_SPSTA
	mov	r2,a
	cjne	r2,#0x80,L003001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:37: unsigned int GetADC(unsigned char channel) 
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:42: SPCON&=(~SPEN); // Disable SPI 
	anl	_SPCON,#0xBF
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:43: SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS; 
	mov	_SPCON,#0x3F
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:44: SPCON|=SPEN; // Enable SPI
	orl	_SPCON,#0x40
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:45: P1_4=0; // Activate the MCP3004 ADC. 
	clr	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:46: SPIWrite(channel|0x18); // Send start bit, single/diff* bit, D2, D1, and D0 bits. 
	mov	a,#0x18
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:47: for(adc=0; adc<10; adc++){}; // Wait for S/H to setup 
	mov	r2,#0x0A
	mov	r3,#0x00
L004003?:
	dec	r2
	cjne	r2,#0xff,L004009?
	dec	r3
L004009?:
	mov	a,r2
	orl	a,r3
	jnz	L004003?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:48: SPIWrite(0x55); // Read bits 9 down to 4 
	mov	dpl,#0x55
	lcall	_SPIWrite
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:49: adc=((SPDAT&0x3f)*0x100); 
	mov	a,#0x3F
	anl	a,_SPDAT
	mov	r3,a
	mov	r2,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:50: SPIWrite(0x55); // Read bits 3 down to 0 
	mov	dpl,#0x55
	push	ar2
	push	ar3
	lcall	_SPIWrite
	pop	ar3
	pop	ar2
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:51: P1_4=1; // Deactivate the MCP3004 ADC. 
	setb	_P1_4
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:52: adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	mov	a,#0xF0
	anl	a,_SPDAT
	mov	r4,a
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:53: adc>>=4;
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:55: return adc;
	mov	dpl,r2
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'voltage'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:58: float voltage (unsigned char channel) 
;	-----------------------------------------
;	 function voltage
;	-----------------------------------------
_voltage:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:60: return ( (GetADC(channel)*4.77)/1023.0 ); // VCC=4.77V (measured) 
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:63: float RMS (unsigned char channel)
;	-----------------------------------------
;	 function RMS
;	-----------------------------------------
_RMS:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:65: return ( (GetADC(channel)/1.41421356237) ); //sqrt(2) = 1.41421356237
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:85: unsigned int getHalfPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getHalfPeriod
;	-----------------------------------------
_getHalfPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:89: if(channel==REF)
	mov	a,dpl
	mov	r2,a
	jnz	L007023?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:92: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:93: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:94: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:95: while(P1_0==1){} //Wait for the signal to be 0
L007001?:
	jb	_P1_0,L007001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:96: while(P1_0==0){} //Wait for the signal to be 1
L007004?:
	jnb	_P1_0,L007004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:97: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:98: while(P1_0==1){}
L007007?:
	jb	_P1_0,L007007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:99: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:101: halfPeriodRef=(TH0*0x100+TL0);	//Assumed period is unsigned int
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:103: return halfPeriodRef;
	ret
L007023?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:105: else if(channel==TEST)
	cjne	r2,#0x01,L007020?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:108: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:109: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:110: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:111: while(P1_1==1){} //Wait for the signal to be 0
L007010?:
	jb	_P1_1,L007010?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:112: while(P1_1==0){} //Wait for the signal to be 1
L007013?:
	jnb	_P1_1,L007013?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:113: TR0=1;	//Start timing
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:114: while(P1_1==1){}
L007016?:
	jb	_P1_1,L007016?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:115: TR0=0;	//Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:117: halfPeriodTest=(TH0*0x100+TL0);	//Assumed period is unsigned int
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:119: return halfPeriodTest;
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:122: return -1;
	ret
L007020?:
	mov	dptr,#0xFFFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getQuarterPeriod'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:125: unsigned int getQuarterPeriod(unsigned char channel)
;	-----------------------------------------
;	 function getQuarterPeriod
;	-----------------------------------------
_getQuarterPeriod:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:127: return getHalfPeriod(channel);
	ljmp	_getHalfPeriod
;------------------------------------------------------------
;Allocation info for local variables in function 'getPhaseAngle'
;------------------------------------------------------------
;phaseDifference           Allocated to registers r2 r3 
;phaseAngle                Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:129: float getPhaseAngle()
;	-----------------------------------------
;	 function getPhaseAngle
;	-----------------------------------------
_getPhaseAngle:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:133: TR0=0; //Stop timer 0
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:134: TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	mov	_TMOD,#0x01
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:135: TH0=0; TL0=0; //Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:136: while(P1_0==1){} //Wait for the reference signal to be 0
L009001?:
	jb	_P1_0,L009001?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:137: while(P1_0==0){} //Wait for the reference signal to be 1
L009004?:
	jnb	_P1_0,L009004?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:138: TR0=1;
	setb	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:139: while(P1_1==0){}
L009007?:
	jnb	_P1_1,L009007?
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:140: TR0=0;
	clr	_TR0
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:142: phaseDifference=(TH0*0x100+TL0);
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:143: phaseAngle = phaseDifference*(1.0/(2.0*getHalfPeriod(0)))*360.0;
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
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:144: return phaseAngle;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:146: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:150: while(1) 
L010002?:
;	C:\Users\esecules\Documents\GitHub\UBC_EECE\EECE281_Individual\Lab5\lab5-code-v1.c:153: printf("Rref V RMS: %.2lf Phase angle: 0 deg\tTest V RMS: %.2lf Phase angle: %.2lf deg",RMS(REF),RMS(TEST),getPhaseAngle());
	lcall	_getPhaseAngle
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	dpl,#0x01
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_RMS
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	dpl,#0x00
	lcall	_RMS
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	sjmp	L010002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Rref V RMS: %.2lf Phase angle: 0 deg'
	db 0x09
	db 'Test V RMS: %.2lf Phase'
	db ' angle: %.2lf deg'
	db 0x00

	CSEG

end
