#include "weekeypad.h"
#include <ESP8266WiFi.h>


char char_map[] = " ABCDEFGHIJKL";
const int analogInPin=A0;

int read_keypad() {
  int reading = 0;
    // read the analog in value
  reading = analogRead(analogInPin);
  
  // map it to the range of the PWM out
  //reading = map(sensorValue, 0, 1024, 0, 255);
  if(reading>1000){return 1;}
  if(reading>950){return 2;}
  if(reading>850){return 3;}
  if(reading>800){return 4;}
  if(reading>740){return 5;}
  if(reading>675){return 6;}
  if(reading>650){return 7;}
  if(reading>600){return 8;}
  if(reading>550){return 9;}
  if(reading>525){return 10;}
  if(reading>500){return 11;}
  if(reading>450){return 12;}
  return 0;
  }



char read_keypad_character() {
  int value = read_keypad();
  if(value==0){return NULL;};
  Serial.print(char_map[value]);
  return char_map[value];
}
