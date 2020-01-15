#ifndef weekeypad_setup_H
#define weekeypad_setup_H

#include <Keypad.h>


char char_map[] = " ABCDEFGHIJKL";
const int analogInPin = A0;  // ESP8266 Analog Pin ADC0 = A0

char customKey;

const byte ROWS = 4; 
const byte COLS = 3; 

char hexaKeys[ROWS][COLS] = {
  {'1', '2', '3'},
  {'4', '5', '6'},
  {'7', '8', '9'},
  {'*', '0', '#'}
};

byte rowPins[ROWS] = {D7, D0, D5, D6}; 
byte colPins[COLS] = {D8, D3, D4}; 

Keypad customKeypad = Keypad(makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

int read_keypad();
char read_keypad_character();

#endif
