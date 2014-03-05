#include <stdio.h> 
#include <at89lp51rd2.h>


// ~C51~
#define REF 0
#define TEST 1
#define CLK 22118400L 
#define BAUD 115200L 
#define BRG_VAL (0x100-(CLK/(32L*BAUD)))
unsigned char _c51_external_startup(void) 
{ 
	// Configure ports as a bidirectional with internal pull-ups. 
	P0M0=0; P0M1=0; 
	P1M0=0; P1M1=0;
	P2M0=0; P2M1=0; 
	P3M0=0; P3M1=0; 
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O 
	P4M0=0; P4M1=0; // The AT89LP51RB2 has a baud rate generator: 
	PCON|=0x80; 
	SCON = 0x52; 
	BDRCON=0; 
	BRL=BRG_VAL; 
	BDRCON=BRR|TBCK|RBCK|SPD;
	
	return 0;
}
void wait (void)
{
	_asm
	;For a 22.1184MHz crystal one machine cycle 
	;takes 12/22.1184MHz=0.5425347us
	mov R2, #2
	N3: mov R1, #250
	N2: mov R0, #184
	N1: djnz R0, N1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	djnz R1, N2 ; 200us*250=0.05s
	djnz R2, N3 ; 0.05s*20=1s
	ret
	_endasm;
}
void wait2ms (void)
{
	_asm
	;For a 22.1184MHz crystal one machine cycle 
	;takes 12/22.1184MHz=0.5425347us
	 mov R1, #10 ;200 us* 10 = 2 ms.
	M2: mov R0, #184
	M1: djnz R0, M1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	djnz R1, M2 ; 200us*250=0.05s
	ret
	_endasm;
}

void checkLED(void){
	char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	int i= 0;
	int count = 0;
	while(1){
		count++; 
		if(count == 166){
			i++;
			if(i == 10)
				i=0;
			P1=lut[i];
			count=0;
		}
		P3=0B_11000000;
	  	wait2ms();
	   	P3=0B_10100000;
	   	wait2ms();
		P3=0B_01100000;
		wait2ms();
	}
}
void circle(int step){
	char lut[6] = {0B_11111110,0B_11111101,0B_11111011,0B_11101111,0B_11011111,0B_10111111};
	char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	switch(step){
		case 0:
			P1=lut[0];
			P3=disp[0];
			wait();
			break;
		case 1:
			P1=lut[1];
			P3=disp[0];
			wait();
			break;
		case 2:
			P1=lut[2];
			P3=disp[0];
			wait();
			break;
		case 3:
			P1=lut[1];
			P3=disp[1];
			wait();
			break;
		case 4:
			P1=lut[2];
			P3=disp[1];
			wait();
			break;
		case 5:
			P1=lut[1];
			P3=disp[2];
			wait();
			break;
		case 6:
			P1=lut[2];
			P3=disp[2];
			wait();
			break;
		case 7:
			P1=lut[3];
			P3=disp[2];
			wait();
			break;
		case 8:
			P1=lut[4];
			P3=disp[2];
			wait();
			break;
		case 9:
			P1=lut[5];
			P3=disp[2];
			wait();
			break;
		case 10:
			P1=lut[4];
			P3=disp[1];
			wait();
			break;
		case 11:
			P1=lut[5];
			P3=disp[1];
			wait();
			break;
		case 12:
			P1=lut[4];
			P3=disp[0];
			wait();
			break;
		case 13:
			P1=lut[5];
			P3=disp[0];
			wait();
			break;
		default:
	}
}
void SPIWrite( unsigned char value) 
{ 
	SPSTA&=(~SPIF); // Clear the SPIF flag in SPSTA 
	SPDAT=value; 
	while((SPSTA & SPIF)!=SPIF); //Wait for transmission to end 
}

// Read 10 bits from the MCP3004 ADC converter 
unsigned int GetADC(unsigned char channel) 
{ 
	unsigned int adc;
	
	// initialize the SPI port to read the MCP3004 ADC attached to it. 
	SPCON&=(~SPEN); // Disable SPI 
	SPCON=MSTR|CPOL|CPHA|SPR1|SPR0|SSDIS; 
	SPCON|=SPEN; // Enable SPI
	P1_4=0; // Activate the MCP3004 ADC. 
	SPIWrite(channel|0x18); // Send start bit, single/diff* bit, D2, D1, and D0 bits. 
	for(adc=0; adc<10; adc++){}; // Wait for S/H to setup 
	SPIWrite(0x55); // Read bits 9 down to 4 
	adc=((SPDAT&0x3f)*0x100); 
	SPIWrite(0x55); // Read bits 3 down to 0 
	P1_4=1; // Deactivate the MCP3004 ADC. 
	adc+=(SPDAT&0xf0); // SPDR contains the low part of the result. 
	adc>>=4;
	
	return adc;
}

float voltage (unsigned char channel) 
{ 
	return ( (GetADC(channel)*4.77)/1023.0 ); // VCC=4.77V (measured) 
}

float RMS (unsigned char channel)
{
	return ( (GetADC(channel)/1.41421356237) ); //sqrt(2) = 1.41421356237
}

// Signal   LP51B    MCP3004
//--------------------------- 
// MISO  - P1.5  - pin 10 
// SCK   - P1.6  - pin 11 
// MOSI  - P1.7  - pin 9 
// CE*   - P1.4  - pin 8 
// 4.8V  - VCC   - pins 13, 14 
// 0V    - GND   - pins 7, 12 
// CH0   -		 - pin 1 
// CH1   -		 - pin 2 
// CH2   -		 - pin 3 
// CH3   -		 - pin 4





unsigned int getHalfPeriod(unsigned char channel)
{
	unsigned int halfPeriodRef, halfPeriodTest;
	
	if(channel==REF)
	{
		// Measure 1/2 period at P1.0 using Timer 0
		TR0=0; //Stop timer 0
		TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
		TH0=0; TL0=0; //Reset the timer
		while(P1_0==1){} //Wait for the signal to be 0
		while(P1_0==0){} //Wait for the signal to be 1
		TR0=1;	//Start timing
		while(P1_0==1){}
		TR0=0;	//Stop timer 0
		// [TH0,TL0] is half the period in multiples of 12/CLK, so: 
		halfPeriodRef=(TH0*0x100+TL0);	//Assumed period is unsigned int
	
		return halfPeriodRef;
	}
	else if(channel==TEST)
	{
		// Measure 1/2 period at P1.0 using Timer 0
		TR0=0; //Stop timer 0
		TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
		TH0=0; TL0=0; //Reset the timer
		while(P1_1==1){} //Wait for the signal to be 0
		while(P1_1==0){} //Wait for the signal to be 1
		TR0=1;	//Start timing
		while(P1_1==1){}
		TR0=0;	//Stop timer 0
		// [TH0,TL0] is half the period in multiples of 12/CLK, so: 
		halfPeriodTest=(TH0*0x100+TL0);	//Assumed period is unsigned int
	
		return halfPeriodTest;
	}
	else
		return -1;
}

unsigned int getQuarterPeriod(unsigned char channel)
{	
	return getHalfPeriod(channel);
}
float getPhaseAngle()
{
	unsigned int phaseDifference;
	float phaseAngle;
	TR0=0; //Stop timer 0
	TMOD=0B_0000_0001; //Set timer 0 as 16-bit timer
	TH0=0; TL0=0; //Reset the timer
	while(P1_0==1){} //Wait for the reference signal to be 0
	while(P1_0==0){} //Wait for the reference signal to be 1
	TR0=1;
	while(P1_1==0){}
	TR0=0;
	
	phaseDifference=(TH0*0x100+TL0);
	phaseAngle = phaseDifference*(1.0/(2.0*getHalfPeriod(0)))*360.0;
	return phaseAngle;
}
void main (void) 
{
	int count = 0;
	int j = 0;
	unsigned long int freq=0;
	char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	checkLED();
	TR0=0; // Disable timer/counter 0
	TMOD=0B_00000101; // Set timer/counter 0 as 16-bit counter
	while(1) 
	{ 		
	
		if(count == 0){
		// Reset the counter
		TL0=0;
		TH0=0;
		// Start counting
		TR0=1;
		// Wait one second
		}
		 count++;
		if(count == 71){
			// Stop counter 0, TH0-TL0 has the frequency!
			TR0=0;
			freq=TH0*256+TL0;
			count=0;
			printf("Rref V RMS: %.2lf Test V RMS: %.2lf\tPhase dif: %.2lf deg\r",RMS(REF),RMS(TEST),getPhaseAngle());
		}
		if(freq > 0 ){
			if(freq < 1000){ //0 Hz - 999 Hz	  	
		    	P1=lut[freq%10];
			   	P3=disp[0];
			   	wait2ms();
			   	P1=lut[(freq/10)%10];
			   	P3=disp[1];
			   	wait2ms();
			   	P1=lut[(freq/100)%10];
				P3=disp[2];
				wait2ms();
				P1=lut[3];
				P3=disp[3];
			}
			else if(freq < 10000){ //1.00 kHz - 9.99 kHz
				P1=lut[(freq/1000)%10];
				P1&=0B_11110111;
			   	P3=disp[0];
			   	wait2ms();
			   	P1=lut[((freq/1000)/10)%10];
			   	P3=disp[1];
			   	wait2ms();
			   	P1=lut[((freq/1000)/100)%10];
				P3=disp[2];
				wait2ms();
				P1=lut[3];
				P3=disp[3];
				wait2ms();
			}
			else if(freq < 100000){ //10.0 kHz - 99.9 kHz
	    		P1=lut[(freq/10000)%10];
			   	P3=disp[0];
			   	wait2ms();
			   	P1=lut[((freq/10000)/10)%10];
			   	P1&=0B_11110111;
			   	P3=disp[1];
			   	wait2ms();
			   	P1=lut[((freq/10000)/100)%10];
				P3=disp[2];
				wait2ms();
				P1=lut[3];
				P3=disp[3];
				wait2ms();
	    	}
	    }
	    else{
	    	count += 35;
	    	circle(j);
	    	j++;
	    	if(j > 13)
	    		j=0;
	    }
	}
}