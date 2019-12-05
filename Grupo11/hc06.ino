#include <SoftwareSerial.h>

SoftwareSerial hc06(2,3);

void setup(){
  //Initialize Serial Monitor
  Serial.begin(4800);
  Serial.println("ENTER AT Commands:");
  //Initialize Bluetooth Serial Port                
  hc06.begin(4800);
}

void loop(){
  //Write from Serial Monitor to HC06
    for(int i=1;i<=10;i++){
      hc06.println(i);
    delay(3000);  
    

  }  
}
