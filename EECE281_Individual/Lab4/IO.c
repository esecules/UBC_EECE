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
	wait1s();
	// Stop counter 0, TH0-TL0 has the frequency!
	TR0=0;
	frequency=TH0*256+TL0;
	// Send the frequency to the serial port
	//printf( "\rf=%5uHz" , frequency);
	return frequency
}

void main (void)
{
	TR0=0; // Disable timer/counter 0
	TMOD=0B_00000101; // Set timer/counter 0 as 16-bit counter
	while(1){
		int cap = 0;
		int Ra = 1000;
		int Rb = 1000;
		int freq;
		freq = getFreq();
		if(freq > 0 ){
	    	cap = 1.44/(freq*(Ra+2*Rb));
	    	printf("Capicatance: %d\r\d",cap);
	    }
	    else{
	    	printf("ERROR\r\d");
	    }
	}
}
