#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <LiquidCrystal.h>
#include <stdio.h>
#include "qaapi.h"
#include "weecfg.h"
#include "weekeypad.h"
#include "weelcd.h"
#include "wemos.h"

// array indexes of form field values
// these should match the order in form_fields
#define cfg_device_id 0
#define cfg_wifi_ssid 1
#define cfg_wifi_key 2
#define cfg_server 3

const char *form_fields[] = {"device-id", "wifi-ssid", "wifi-key", "server"};
int number_of_fields = 3; // total form fields minus 1 because zero based arrays
char config[3][50] = {};

bool qa_state_ready = false;
int qa_timestamp = 0;
char qa_key[1] = "";
char qa_last_key[1] = "";
// char users_name[12] = "";
char users_name[12] = "";
char controller_id[12] = "";

char qa_lcd_top[16] = "";
char qa_lcd_bottom[16] = "";
char qa_counter_string[7];
int qa_counter = 0;
int qa_counter_start = 0;

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

void lcd_print_bottom(String msg) {
  // lcd.clear();
  lcd.setCursor(0, 1);
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

  DynamicJsonDocument doc =
      send_payload(API_STARTUP, config[cfg_device_id], ' ', 0);
  strcpy(controller_id, (const char *)doc["ControllerId"]);
  strcpy(users_name, (const char *)doc["AssignedName"]);
}

void redraw(String top, String bottom){
  lcd_print(top);
  lcd_print_bottom(bottom);
}

void loop() {
  qa_counter = millis() / 1000;
  // get char from keypad
  qa_key[0] = customKeypad.getKey();

  //reset everything
  if(qa_state_ready==0){
    qa_key[0]=NULL;
    qa_last_key[0]=NULL;
  }

  if (qa_counter_start != qa_counter) {
    DynamicJsonDocument doc =
         send_payload(API_POLL, config[cfg_device_id], ' ', 0);
    qa_state_ready = (bool)doc["ReadyToAcceptAnswers"];
    qa_timestamp = doc["Timestamp"]; 

    qa_counter_start = qa_counter;
    qa_timestamp += ONE_SECOND;

    if(qa_state_ready==1){
      if(qa_last_key[0]){
    Serial.println("--last key");
    Serial.println(qa_last_key);
        strcpy(qa_lcd_bottom, qa_last_key);
      }else{
        strcpy(qa_lcd_bottom, (const char *)"Press answer.");
      }
    }
    if(qa_state_ready==0){
      strcpy(qa_lcd_bottom, (const char *)"Locked waiting...");
    }

    Serial.println("++++++");
    Serial.println(qa_lcd_bottom);
    redraw((String)users_name,(String)qa_lcd_bottom);
  }

  // if a key is pressed work out what todo
  if (qa_key[0]) {
    if(qa_state_ready==1){
      strcpy(qa_last_key, qa_key);
      strcpy(qa_lcd_bottom, qa_last_key);
      redraw((String)users_name,(String)qa_lcd_bottom);
      DynamicJsonDocument doc =
        send_payload(API_ANSWER, config[cfg_device_id], qa_key[0], qa_timestamp);
    }
  }


  /* if ((bool)qa_state_ready == false) { */
  /*   key = ' '; */
  /*   qa_key = ' '; */
  /* } */

  // if ((bool)qa_state_ready==true && key != qa_key && key!=' '){


    // strcpy(qa_key, (const char*)key);

    // DynamicJsonDocument doc =
    //    send_payload(API_ANSWER, config[cfg_device_id], qa_key, qa_timestamp);
    //} else {
    // lcd_print_bottom(String(qa_state_ready));

  // run time counter
  // lcd_print_bottom(itoa((millis() / 1000), qa_counter, 10));

  // work out time passed instead of delay
  // delay(ONE_SECOND); // one second

  delay(1);
}
