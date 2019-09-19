#include "setup.h"
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <stdio.h>

// array indexes of form field values
// these should match the order in form_fields
#define cfg_device_id 0
#define cfg_wifi_ssid 1
#define cfg_wifi_key 2
#define cfg_server 3

const char *form_fields[] = {"device-id", "wifi-ssid", "wifi-key", "server"};
int number_of_fields = 3; // total form fields minus 1 because zero based arrays
char config[3][50] = {};

bool setup_wifi(String hostname, char ssid[], char password[], int retrys) {
  Serial.print("Connecting to ");
  Serial.println(ssid);
  Serial.println(password);
  Serial.println(hostname);

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

void setup() {
  Serial.begin(115200);
  if (config_startup("/config.txt", form_fields, config, number_of_fields) ==
      0) {
    // config loaded
    if (setup_wifi("wemos", config[cfg_wifi_ssid], config[cfg_wifi_key], 20) ==
        false) {
      // could not connect so force access point mode
      config_access_point(form_fields, number_of_fields);
    }
  }

  // continue setup here
}

void loop() {
  // put actual code here
}
