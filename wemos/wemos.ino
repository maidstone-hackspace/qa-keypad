#include "weecfg.h"
#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>
#include <LiquidCrystal.h>
#include <WiFiClient.h>
#include <stdio.h>
//#include <wemos.h>

// LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
LiquidCrystal lcd(D2, D3, D5, D6, D7, D8);
#define LCD_COLUMNS 16
#define LCD_ROWS 2

// array indexes of form field values
// these should match the order in form_fields
#define cfg_device_id 0
#define cfg_wifi_ssid 1
#define cfg_wifi_key 2
#define cfg_server 3

const char *form_fields[] = {"device-id", "wifi-ssid", "wifi-key", "server"};
int number_of_fields = 3; // total form fields minus 1 because zero based arrays
char config[3][50] = {};


// Route to actually store the config file.
// server.on("/question", HTTP_GET,
//          [](AsyncWebServerRequest *request) { Serial.println(request); });

void send_payload() {
  StaticJsonDocument<200> doc;
  //{"ControllerId": "sample string 1"}

  doc["ControllerId"] = "IDHERE";
  //doc["device-id"] = "IDHERE";
  //doc["key-press"] = 1;
  doc["time"] = 1351824120;
  JsonArray data = doc.createNestedArray("data");
  data.add(48.756080);
  data.add(2.302038);
  serializeJson(doc, Serial);
  Serial.println();
  serializeJsonPretty(doc, Serial);

  char JSONmessageBuffer[200];
  serializeJsonPretty(doc, JSONmessageBuffer);

  HTTPClient http; // Declare object of class HTTPClient

  http.begin("http://ng.snapwire-portal.co.uk/api/Startup"); // Specify request url
  http.addHeader("Content-Type", "application/json"); // Specify content-type header

  int httpCode = http.POST(JSONmessageBuffer); // Send the request
  String payload = http.getString();           // Get the response payload

  Serial.println(httpCode); // Print HTTP return code
  Serial.println(payload);  // Print request response payload

  http.end(); // Close connection
}

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
  lcd.begin(LCD_COLUMNS, LCD_ROWS);
  lcd_print("Starting Up");

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
    // wifi connection failed fal back to access point mode
    config_access_point(form_fields, number_of_fields);
    return;
  }
  lcd_print("Connected.");
  send_payload();
  // continue setup here
}

void loop() {
  // put actual code here
  lcd.setCursor(0, 1);
  // print the number of seconds since reset:
  lcd.print(millis() / 1000);
}
