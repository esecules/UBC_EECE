#include <stdio.h>
#include <at89lp51rd2.h>

#define CLK 22118400L
#define BAUD 115200L
#define TIMER_2_RELOAD (0x10000L-(CLK/(32L*BAUD)))

unsigned char _c51_external_startup(void)
{
	// Configure ports as a bidirectional with internal pull-ups.
	P0M0=0;	P0M1=0;
	P1M0=0;	P1M1=0;
	P2M0=0;	P2M1=0;
	P3M0=0;	P3M1=0;
	AUXR=0B_0001_0001; // 1152 bytes of internal XDATA, P4.4 is a general purpose I/O
	P4M0=0;	P4M1=0;
 
    setbaud_timer2(TIMER_2_RELOAD); // Initialize serial port using timer 2
    return 0;
}

void wait1s (void)
{
	_asm
	;For a 22.1184MHz crystal one machine cycle 
	;takes 12/22.1184MHz=0.5425347us
	mov R2, #20
	L3: mov R1, #250
	L2: mov R0, #184
	L1: djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	djnz R1, L2 ; 200us*250=0.05s
	djnz R2, L3 ; 0.05s*20=1s
	ret
	_endasm;
}
void wait (void)
{
	_asm
	;For a 22.1184MHz crystal one machine cycle 
	;takes 12/22.1184MHz=0.5425347us
	mov R2, #2
	N3: mov R1, #250
	N2: mov R0, #184
	N1: djnz R0, L1 ; 2 machine cycles-> 2*0.5425347us*184=200us
	djnz R1, L2 ; 200us*250=0.05s
	djnz R2, L3 ; 0.05s*20=1s
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
unsigned int getFreq (void)
{
	unsigned int frequency;
	//printf( "\r\nLP51B Frequency meter example\r\n" );
	
	// Reset the counter
	TL0=0;
	TH0=0;
	// Start counting
	TR0=1;
	// Wait one second
	 
	// Stop counter 0, TH0-TL0 has the frequency!
	TR0=0;
	frequency=TH0*256+TL0;
	// Send the frequency to the serial port
	//printf( "\rf=%5uHz" , frequency);
	return frequency;
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
void main (void)
{	
	int count = 0;
	int j = 0;
	int cap = 0;
	int Ra = 1670;
	int Rb = 1670;
	unsigned int freq=0;
	char lut[10] = {0B_10001000,0B_11111001,0B_01001100,0B_01101000,0B_00111001,0B_00101010,0B_00001010,0B_11111000,0B_00001000,0B_00111000};
	char disp[3] = {0B_11000000,0B_10100000,0B_01100000};
	//checkLED();
	TR0=0; // Disable timer/counter 0
	TMOD=0B_00000101; // Set timer/counter 0 as 16-bit counter
	while(1){
		// Reset the counter
		TL0=0;
		TH0=0;
		// Start counting
		TR0=1;
		// Wait one second
		count++; 
		if(count == 166){
			// Stop counter 0, TH0-TL0 has the frequency!
			TR0=0;
			freq=TH0*256+TL0;
			count=0;
		}
		if(freq > 0 ){
	    	cap = 1.44/(freq*(Ra+2*Rb));
	    	printf("Capicatance: %d\r\d",cap);  	
	    	P1=lut[cap%10];
		   	P3=disp[0];
		   	wait2ms();
		   	P1=lut[(cap/10)%10];
		   	P3=disp[1];
		   	wait2ms();
		   	P1=lut[(cap/100)%10];
			P3=disp[2];
			wait2ms();
	    }
	    else{
	    	circle(j);
	    	j++;
	    	if(j > 13)
	    		j=0;
	    }
	}	
}
