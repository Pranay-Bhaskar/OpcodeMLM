#include <stdio.h>
#include <string.h>

void parseJSON(const char* json){
    char key[50], value[50];
    sscanf(json,"{\"%[^\"]\":\"%[^\"]\"}",key,value);
    printf("Key: %s, Value: %s\n",key,value);
}