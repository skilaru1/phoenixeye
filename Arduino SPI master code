// SPI for arc32 - Version: Latest 
#include <SPI.h>
//#include <SPI_registers.h>

/* Connection
MASTER           SLAVE
MISO      ->     MOSI   master out slave in p11
MOSI      ->     MISO   master in slave out p12
SCK       ->     SCK    clock p13?
D10(SS)   ->     D10(SS)  d10 is slave select
GND       ->     GND
*/

//#include <SPI.h>

#define DIM 5 //num of elements in array

void setup() {

  pinMode (SS, OUTPUT);
  digitalWrite(SS, HIGH); //
  SPI.begin();
 
}

void loop() {

  int x[5] ={0, 28, 36, 45, 70};
  digitalWrite(SS, LOW);    //low after spi.begin
  for (int i=0;i<DIM;i++){
    SPI.transfer(x[i]);
    delay(1);
  } 
  digitalWrite(SS,HIGH);
  delay(1000);
}


