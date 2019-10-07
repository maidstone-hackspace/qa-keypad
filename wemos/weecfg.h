#ifndef device_setup_H
#define device_setup_H

#define WEECFG_COMPRESSED ".gz"
#define WEECFG_NORMAL_MODE 0
#define WEECFG_ACCESS_POINT_MODE 1


bool loadConfig(String fileName, char (*config)[50], int number_of_elements);
bool handleRequestedPage(const char *form_fields[],  int number_of_fields);
void config_via_access_point();
int config_access_point(const char *form_fields[],  int number_of_fields);
int config_startup(String fileName, const char *fields[], char (*config)[50], int number_of_fields);

#endif
