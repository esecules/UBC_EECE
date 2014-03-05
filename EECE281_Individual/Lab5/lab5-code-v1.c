#include <stdio.h> 
#include <at89lp51rd2.h>
#include <math.h>

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

	
	while(1) 
	{ 
		
		printf("Rref V RMS: %.2lf Phase angle: 0 deg\tTest V RMS: %.2lf Phase angle: %.2lf deg",RMS(REF),RMS(TEST),getPhaseAngle());
	}
}