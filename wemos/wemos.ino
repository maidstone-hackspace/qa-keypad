#include "weecfg.h"
#include "qaapi.h"
#include "wemos.h"
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <LiquidCrystal.h>
#include <stdio.h>
#include "weekeypad.h"
#include "weelcd.h"


// LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
//LiquidCrystal lcd(D2, D3, D5, D6, D7, D8);

// array indexes of form field values
// these should match the order in form_fields
#define cfg_device_id 0
#define cfg_wifi_ssid 1
#define cfg_wifi_key 2
#define cfg_server 3

const char *form_fields[] = {"device-id", "wifi-ssid", "wifi-key", "server"};
int number_of_fields = 3; // total form fields minus 1 because zero based arrays
char config[3][50] = {};

bool qa_state = false;
int qa_timestamp = 0;
char qa_key = 0;


bool setup_wifi(String hostname, char ssid[], char password[], int retrys) {
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.persistent(false);
  WiFi.hostname(hostname);
  WiFi.begin(ssid, password);

  int retry_count = 0;
  // Might as well keep working if internet is unavailable
  while (WiFi.status() != WL_CONNECTED && retry_count < retrys) {
    delay(1000);
    Serial.print(".");
    retry_count += 1;
  }
  Serial.println("");

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("WiFi connected");
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());
    return true;
  }
  Serial.print("WiFi unable to connect with status of ");
  Serial.println(WiFi.status());
  WiFi.disconnect(true);
  delay(2000);
  return false;
}

void lcd_print(String msg) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(msg);
}

void setup() {
  Serial.begin(115200);
  lcdSetup();
  
  lcd.print("Starting...");
  delay(2000);

  // config_startup will return the mode it started in
  // either AP or normal mode
  if (config_startup("/config.txt", form_fields, config, number_of_fields) ==
      WEECFG_ACCESS_POINT_MODE) {
    lcd_print("Please setup.");
    return;
  }

  // config loaded
  if (setup_wifi("wemos", config[cfg_wifi_ssid], config[cfg_wifi_key], 20) ==
      false) {
    // wifi connection failed fall back to access point mode
    config_access_point(form_fields, number_of_fields);
    return;
  }
  lcd_print("Connected.");

  DynamicJsonDocument doc =  send_payload(API_STARTUP, config[cfg_device_id], ' ', 0);
  const char* controller_id = doc["ControllerId"];
  const char* users_name = doc["AssignedName"];
  Serial.println("started recieved data");
  Serial.println(controller_id);
  Serial.println(users_name);
  // continue setup here
}

void loop() {
  DynamicJsonDocument doc = send_payload(API_POLL, config[cfg_device_id], ' ', 0);
  qa_state = doc["ReadyToAcceptAnswers"];
  qa_timestamp = doc["Timestamp"];
  Serial.println("Poll");
  Serial.println(qa_state);
  Serial.println(qa_timestamp);
  //Serial.println(users_name);

  //get char from keypad
  char key = 'A'; //choce();

  if((bool)qa_state == false) {
    key = ' ';
    qa_key = ' ';
  }


  if ((bool)qa_state==true && key != qa_key && key!=' '){
    Serial.println("Sending");
    key = qa_key;
    DynamicJsonDocument doc = send_payload(API_ANSWER, config[cfg_device_id], qa_key, 0);
  }

  // put actual code here
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(millis() / 1000);

  //work out time passed instead of delay
  delay(ONE_SECOND); // one second
  qa_timestamp += ONE_SECOND;
}
