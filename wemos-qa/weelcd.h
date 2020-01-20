#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define LCD_COLUMNS 16
#define LCD_ROWS 2

LiquidCrystal_I2C lcd(0x27, LCD_COLUMNS, LCD_ROWS );  // Set the LCD I2C address

void lcdSetup()
{
	lcd.init();                        // initialize the LCD Display 
	lcd.backlight();
}
