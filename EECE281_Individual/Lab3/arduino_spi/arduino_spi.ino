#include <LiquidCrystal.h>
#include <SPI.h>
int temp_DE2, temp_ARD, state;
LiquidCrystal lcd(8, 9, 4, 5, 6, 7);
ISR (SPI_STC_vect){
  temp_DE2 = SPDR;
}

void setup(){
  Serial.begin (115200);   // debugging
 
  // have to send on master in, *slave out*
  pinMode(MISO, OUTPUT);
  
  // turn on SPI in slave mode
  SPCR |= _BV(SPE);
  
  // get ready for an interrupt 
  temp_DE2 = 0;
  temp_ARD = 0;  
  state = 0;
 
  // now turn on interrupts
  SPI.attachInterrupt();
}


void loop(){
  temp_ARD = getTemp();
  lcd.setCursor(0,0);
  lcd.print("DE2: ");
  lcd.print(temp_DE2);
  lcd.print("ARDUINO: ");
  lcd.print(temp_ARD);
  delay(100);
}

int getTemp(){
  return (analogRead(0)*500/1024)-273;  
}
