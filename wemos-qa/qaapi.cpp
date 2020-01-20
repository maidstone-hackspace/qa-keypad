#include "qaapi.h"
#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>

DynamicJsonDocument send_payload(String url, char *deviceid, char answer,
                                 int time) {
  StaticJsonDocument<200> doc;
  //Serial.println(url);

  // doc["time"] = 1351824120;

  // Build json object with available data
  if (sizeof(deviceid) > 0) {
    doc["ControllerId"] = deviceid;
    doc["timestamp"] = time;
    if (sizeof(answer) > 0) {
      doc["Answer"] = answer;
    }
  }

  serializeJson(doc, Serial);
  serializeJsonPretty(doc, Serial);

  char JSONmessageBuffer[200];
  serializeJsonPretty(doc, JSONmessageBuffer);

  HTTPClient http; // Declare object of class HTTPClient

  http.begin(url); // Specify request url
  http.addHeader("Content-Type",
                 "application/json"); // Specify content-type header

  int httpCode = http.POST(JSONmessageBuffer); // Send the request
  String payload = http.getString();           // Get the response payload

  //Serial.println("response"); // Print HTTP return code
  //Serial.println(httpCode);   // Print HTTP return code
  //Serial.println(payload);    // Print request response payload

  // computed from here arduinojson.org/v6/assistant
  Serial.println("response below");
  const size_t capacity = JSON_OBJECT_SIZE(20) + 60;
  DynamicJsonDocument response_json(capacity);

  DeserializationError error = deserializeJson(response_json, payload);

  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.c_str());
  }

  http.end(); // Close connection
  return response_json;
}
