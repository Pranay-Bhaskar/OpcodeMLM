#include <stdio.h>
#include <string.h>

static const char table[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

void base64encode(const unsigned char* input,int len,char* output){
    int i,j;
    for(i=0,j=0;i<len;){
        unsigned octet_a=i<len?input[i++]:0;
        unsigned octet_b=i<len?input[i++]:0;
        unsigned octet_c=i<len?input[i++]:0;
        unsigned triple=(octet_a<<16)|(octet_b<<8)|octet_c;
        output[j++]=table[(triple>>18)&63];
        output[j++]=table[(triple>>12)&63];
        output[j++]=i>len+1?'=':table[(triple>>6)&63];
        output[j++]=i>len?'=':table[triple&63];
    }
    output[j]='\0';
}