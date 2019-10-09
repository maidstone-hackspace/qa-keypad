#include "ESPAsyncWebServer.h"
//#include <ESP8266WebServer.h>
#include "weecfg.h"
#include <ArduinoJson.h>
#include <DNSServer.h>
#include <ESP8266WiFi.h>
#include <FS.h>
//#include <WiFiClient.h>
#include <stdio.h>

bool weecfg_compressed = "";
bool weecfg_debug = true;
bool config_mode = WEECFG_NORMAL_MODE;
AsyncWebServer server(80);

void debug(const char msg[]) {
  if (weecfg_debug == false)
    return;
  Serial.println(msg);
}

void info(const char msg[]) { Serial.println(msg); }

bool loadConfig(String fileName, const char *form_fields[], char (*config)[50],
                int number_of_fields) {
  SPIFFS.begin();
  File dataFile = SPIFFS.open(fileName, "r");
  // no file so fail loadings
  if (!dataFile)
    return false;
  char *config_key;
  char *config_value;

  while (dataFile.available()) {
    // Lets read line by line from the file
    String line = dataFile.readStringUntil('\n');
    char char_array[line.length()];
    // convert to char array so wee can string compare
    line.toCharArray(char_array, line.length());
    config_key = strtok(char_array, "=");
    config_value = strtok(NULL, "=");

    // if strtok does not find a character it returns a null pointer
    // so handle it and skip the rest of this iteration
    if (config_key == NULL || config_value == NULL) {
      continue;
    }
    for (int i = 0; i < number_of_fields + 1; i++) {
      if (strcmp(form_fields[i], config_key) == 0) {
        strcpy(config[i], config_value);
      }
    }
  }
  info("+++ Loaded configuration from config.txt");
  for (int i = 0; i <= number_of_fields; i++) {
    debug(form_fields[i]);
    debug(config[i]);
  }
  return true;
}

bool handlePayload(AsyncWebServerRequest *request, const char *form_fields[],
                   int number_of_fields) {
  if (request->args() != number_of_fields)
    request->send(404, "text/plain", "Missing params.");

  File dataFile = SPIFFS.open("/config.txt", "w");
  for (int i = 0; i < number_of_fields + 1; i++) {
    int str_len = request->argName(i).length() + 1;
    char char_array[str_len];
    request->argName(i).toCharArray(char_array, str_len);
    for (int f = 0; f < number_of_fields + 1; f++) {
      if (strcmp(form_fields[f], char_array) == 0) {
        dataFile.print(request->argName(i));
        dataFile.print("=");
        dataFile.println(request->arg(i));
      }
    }
  }

  dataFile.close();
  request->send(200, "text/plain", "success");
  info("Config saved restarting with new settings.");
  WiFi.softAPdisconnect(true);
  WiFi.disconnect(true);
  delay(2000);
  ESP.restart();
  return true;
}

int config_access_point(const char *form_fields[], int number_of_fields) {
  info("Access point launched, please connect to weeeecfg and configure "
       "device.");
  WiFi.disconnect();
  WiFi.hostname("WEECFGAP");
  WiFi.persistent(false);
  WiFi.mode(WIFI_AP);

  if (WiFi.softAP("weeeecfg", "weeeecfg") == false) // Start the access point
    debug("Failed to launch access point, values to short must be 8 chars or "
          "greater.");
  info("Config page available on IP address:\t");
  info(WiFi.softAPIP().toString().c_str());

  // access point configured to setup required routes
  server.rewrite("/", "/index.html");
  server.serveStatic("/index.html", SPIFFS, "/index.html" WEECFG_COMPRESSED);
  server.serveStatic("/tachyon.css", SPIFFS, "/tachyon.css" WEECFG_COMPRESSED);
  server.serveStatic("/all.min.css", SPIFFS, "/all.min.css" WEECFG_COMPRESSED);
  server.serveStatic("/form.edn", SPIFFS, "/form.edn" WEECFG_COMPRESSED);
  server.serveStatic("/main.js", SPIFFS, "/main.js" WEECFG_COMPRESSED);
  server.serveStatic("/dev-main.js", SPIFFS, "/dev-main.js" WEECFG_COMPRESSED);
  server.serveStatic("/faavicon.ico", SPIFFS, "/favicon.ico" WEECFG_COMPRESSED);
  server.serveStatic("/webfonts/fa-solid-900.woff2", SPIFFS,
                     "/fa-solid-900.woff2" WEECFG_COMPRESSED);
  // only serve the config file in debug mode
  if (weecfg_debug == true)
    server.serveStatic("/config.txt", SPIFFS, "/config.txt");

  // Route to actually store the config file.
  server.on("/save", HTTP_GET,
            [form_fields, number_of_fields](AsyncWebServerRequest *request) {
              handlePayload(request, form_fields, number_of_fields);
            });

  server.begin();
  config_mode = WEECFG_ACCESS_POINT_MODE;
  return config_mode;
}

int config_startup(String fileName, const char *fields[], char (*config)[50],
                   int number_of_fields) {
  SPIFFS.begin();
  if (loadConfig(fileName, fields, config, number_of_fields) == true) {
    info("Configuration file detected and loaded.");
    return config_mode;
  }
  config_mode = WEECFG_ACCESS_POINT_MODE;
  config_access_point(fields, number_of_fields);
  return config_mode;
}
