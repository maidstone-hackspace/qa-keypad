#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>
#include "qaapi.h"


void send_payload(String url, char *deviceid) {
  StaticJsonDocument<200> doc;
  doc["ControllerId"] = deviceid;
  doc["time"] = 1351824120;

  serializeJson(doc, Serial);
  Serial.println();
  serializeJsonPretty(doc, Serial);

  char JSONmessageBuffer[200];
  serializeJsonPretty(doc, JSONmessageBuffer);

  HTTPClient http; // Declare object of class HTTPClient

  http.begin("url"); // Specify request url
  http.addHeader("Content-Type", "application/json"); // Specify content-type header

  int httpCode = http.POST(JSONmessageBuffer); // Send the request
  String payload = http.getString();           // Get the response payload

  Serial.println(httpCode); // Print HTTP return code
  Serial.println(payload);  // Print request response payload

  http.end(); // Close connection
}
