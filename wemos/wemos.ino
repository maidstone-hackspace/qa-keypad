#include "weecfg.h"
#include "qaapi.h"
#include "wemos.h"
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <LiquidCrystal.h>
#include <stdio.h>
#include "weekeypad.h"
#include "weelcd.h"

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
char qa_key = ' ';
// char users_name[12] = "";
char users_name[12] = "";
char controller_id[12] = "";

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

  DynamicJsonDocument doc = send_payload(API_STARTUP, config[cfg_device_id], ' ', 0);
  strcpy(controller_id, (const char *)doc["ControllerId"]);
  strcpy(users_name, (const char *)doc["AssignedName"]);
}

void loop() {
  qa_counter = millis() / 1000;
  if (qa_counter_start != qa_counter) {
    DynamicJsonDocument doc =
        send_payload(API_POLL, config[cfg_device_id], ' ', 0);
    qa_state = (bool)doc["ReadyToAcceptAnswers"];
    qa_timestamp = doc["Timestamp"];
    /* Serial.println("sending"); */
    /* Serial.println(qa_state); */
    /* Serial.println(qa_timestamp); */
    /* Serial.println(qa_key); */
    lcd_print(users_name);
    lcd_print_bottom(String(qa_key));
    qa_counter_start = qa_counter;
    qa_timestamp += ONE_SECOND;
  }

  /* Serial.println("Poll"); */
  /* Serial.println(qa_state); */
  /* Serial.println(qa_timestamp); */
  // Serial.println(users_name);

  // get char from keypad
  char key = customKeypad.getKey();
  // Serial.println(key);

  if ((bool)qa_state == false) {
    key = ' ';
    qa_key = ' ';
  }

  // if ((bool)qa_state==true && key != qa_key && key!=' '){

  if (key != NULL && key != ' ') {
    //if (key != NULL && key != qa_key && key != ' ') {
    Serial.println("Sending");
    Serial.println(String(key));
    Serial.println(String(qa_key));

    //strcpy(qa_key, (const char*)key);

    qa_key = key;
    // DynamicJsonDocument doc =
    //    send_payload(API_ANSWER, config[cfg_device_id], qa_key, qa_timestamp);
    //} else {
    // lcd_print_bottom(String(qa_state));
  }

  // run time counter
  // lcd_print_bottom(itoa((millis() / 1000), qa_counter, 10));

  // work out time passed instead of delay
  // delay(ONE_SECOND); // one second

  delay(1);
}
