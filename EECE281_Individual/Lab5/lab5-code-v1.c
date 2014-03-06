#include <stdio.h> 
#include <at89lp51rd2.h>


// ~C51~
#define REF 1
#define TEST 0
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
	char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	int i= 0;
	int count = 0;
	while(i < 20){
		count++; 
		if(count == 166){
			i++;
			P2=lut[i%10];
			count=0;
		}
		P3=disp[0];
	  	wait2ms();
	   	P3=disp[1];
	   	wait2ms();
		P3=disp[2];
		wait2ms();
		P3=disp[3];
		wait2ms();
	}
}
void circle(int step){
	char lut[6] = {0B_11111110,0B_11111101,0B_11111011,0B_11101111,0B_11011111,0B_10111111};
char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
	switch(step){
		case 0:
			P2=lut[0];
			P3=disp[0];
			wait();
			break;
		case 1:
			P2=lut[1];
			P3=disp[0];
			wait();
			break;
		case 2:
			P2=lut[2];
			P3=disp[0];
			wait();
			break;
		case 3:
			P2=lut[1];
			P3=disp[1];
			wait();
			break;
		case 4:
			P2=lut[2];
			P3=disp[1];
			wait();
			break;
		case 5:
			P2=lut[1];
			P3=disp[2];
			wait();
			break;
		case 6:
			P2=lut[2];
			P3=disp[2];
			wait();
			break;
		case 7:
			P2=lut[1];
			P3=disp[3];
			wait();
			break;
		case 8:
			P2=lut[2];
			P3=disp[3];
			wait();
			break;
		case 9:
			P2=lut[3];
			P3=disp[3];
			wait();
			break;
		case 10:
			P2=lut[4];
			P3=disp[3];
			wait();
			break;
		case 11:
			P2=lut[5];
			P3=disp[3];
			wait();
			break;
		case 12:
			P2=lut[4];
			P3=disp[2];
			wait();
			break;
		case 13:
			P2=lut[5];
			P3=disp[2];
			wait();
			break;
		case 14:
			P2=lut[4];
			P3=disp[1];
			wait();
			break;
		case 15:
			P2=lut[5];
			P3=disp[1];
			wait();
			break;
		case 16:
			P2=lut[4];
			P3=disp[0];
			wait();
			break;
		case 17:
			P2=lut[5];
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
	SPIWrite(0xff); // Read bits 9 down to 4 
	adc=((SPDAT&0x3f)<<4); 
	//printf("%x\r\n",SPDAT);
	SPIWrite(0xff); // Read bits 3 down to 0
	//printf("%x\r\n",SPDAT); 
	P1_4=1; // Deactivate the MCP3004 ADC. 
	adc|=(SPDAT&0xf0)>>4; // SPDR contains the low part of the result. 
	
	return adc*4.77/1023;
}

//float voltage (unsigned char channel) 
//{ 
//	return ( (GetADC(channel)*4.77)/1023.0 ); // VCC=4.77V (measured) 
//}

//float RMS (unsigned char channel)
//{
//	float rms=0;
//	rms =  (oneShot(channel))/((float)*1.41421356237);
//	return rms; //sqrt(2) = 1.41421356237
//}

float oneShot(unsigned char channel)
{
	float temp = 0;
	float peak = 0;
	float rms = 0;
	if(channel==0)
	{
		while(P1_0==1){}
		while(P1_0==0){}
		while(P1_0==1)
		{
			temp = GetADC(channel);
			//printf("%f\r\n",temp);
			if(temp > peak) peak = temp;
		}
	}
	else if(channel==1)
	{
		while(P1_1==1){}
		while(P1_1==0){}
		while(P1_1==1)
		{
			temp = GetADC(channel);
			
			if(temp > peak) peak = temp;
		}
	}
	rms = (peak / 1.41421356237);
	return rms;
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
	
	if(channel==0)
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
	else if(channel==1)
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
	while(P1_1==1){} //Wait for the reference signal to be 0
	while(P1_1==0){} //Wait for the reference signal to be 1
	TR0=1;
	while(P1_0==0){}
	TR0=0;
	
	phaseDifference=(TH0*0x100+TL0);
	phaseAngle = phaseDifference*(1.0/(2.0*getHalfPeriod(REF)))*360.0;
	return phaseAngle;
}
void main (void) 
{
	int count = 0;
	int j = 0;
	unsigned long int freq=0;
	char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	char disp[4] = {0B_11011111,0B_10111111,0B_01111111,0B_11101111};
//	checkLED();
	TR0=0; // Disable timer/counter 0
	TMOD=0B_00010101; // Set timer/counter 0 as 16-bit counter and timer2 as a 16bit timer
	while(1) 
	{ 		
		if(count == 0){
		// Reset the counter
		TL0=0;
		TH0=0;
		TH1=0;
		TL1=0;
		// Start counting
		TR0=1;
		TR1=1;
		// Wait one second
		}
		 count++;
		if(count >= 71){
			// Stop counter 0, TH0-TL0 has the frequency!
			TR0=0;
			TR1=0;
			freq=(TH0*256+TL0);
			count=0;
			printf("Rref V RMS: %6.2fV Test V RMS: %6.2fV\tPhase dif: %6.2f deg\r\n",oneShot(REF),oneShot(TEST),getPhaseAngle());
		}
		if(freq > 0 ){
			if(freq < 1000){ //0 Hz - 999 Hz	  	
		    	P2=lut[freq%10];
			   	P3=disp[0];
			   	wait2ms();
			   	P2=lut[(freq/10)%10];
			   	P3=disp[1];
			   	wait2ms();
			   	P2=lut[(freq/100)%10];
				P3=disp[2];
				wait2ms();
				P2=lut[3];
				P3=disp[3];
			}
			else if(freq < 10000){ //1.00 kHz - 9.99 kHz
				P2=lut[(freq/1000)%10];
				P2&=0B_11110111;
			   	P3=disp[0];
			   	wait2ms();
			   	P2=lut[((freq/1000)/10)%10];
			   	P3=disp[1];
			   	wait2ms();
			   	P2=lut[((freq/1000)/100)%10];
				P3=disp[2];
				wait2ms();
				P2=lut[3];
				P3=disp[3];
				wait2ms();
			}
			else if(freq < 100000){ //10.0 kHz - 99.9 kHz
	    		P2=lut[(freq/10000)%10];
			   	P3=disp[0];
			   	wait2ms();
			   	P2=lut[((freq/10000)/10)%10];
			   	P2&=0B_11110111;
			   	P3=disp[1];
			   	wait2ms();
			   	P2=lut[((freq/10000)/100)%10];
				P3=disp[2];
				wait2ms();
				P2=lut[3];
				P3=disp[3];
				wait2ms();
	    	}
	    }
	    else{
	    	count += 35;
	    	circle(j);
	    	j++;
	    	if(j > 17)
	    		j=0;
	    }
	}
}