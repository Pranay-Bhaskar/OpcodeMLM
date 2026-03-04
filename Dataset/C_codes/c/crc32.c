#include <stdio.h>
#include <stdint.h>

uint32_t crc32(uint8_t *data,size_t len){
    uint32_t crc=0xFFFFFFFF;
    for(size_t i=0;i<len;i++){
        crc^=data[i];
        for(int j=0;j<8;j++)
            crc=(crc>>1)^(0xEDB88320 & -(crc&1));
    }
    return ~crc;
}