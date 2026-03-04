#include <stdio.h>
#include <string.h>

typedef struct { int offset,length; char next; } Token;

void lz77_compress(const char* input,Token* tokens,int* count){
    int n=strlen(input), i=0, t=0;
    while(i<n){
        int bestLen=0,bestOffset=0;
        for(int j=1;j<=i;j++){
            int len=0;
            while(i+len<n && input[i+len]==input[i-j+len]) len++;
            if(len>bestLen){ bestLen=len; bestOffset=j; }
        }
        tokens[t].offset=bestOffset;
        tokens[t].length=bestLen;
        tokens[t].next=input[i+bestLen];
        i+=bestLen+1; t++;
    }
    *count=t;
}