#ifndef qaapi_H
#define qaapi_H
#include <ArduinoJson.h>

DynamicJsonDocument send_payload(String url, char *deviceid, char answer, int time);

#endif
