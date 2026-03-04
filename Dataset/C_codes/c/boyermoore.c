#include <stdio.h>
#include <string.h>

#define ALPHABET 256
int max(int a, int b) { return (a > b) ? a : b; }
void badCharHeuristic(char* str,int size,int badchar[ALPHABET]){
    for(int i=0;i<ALPHABET;i++) badchar[i]=-1;
    for(int i=0;i<size;i++) badchar[(unsigned char)str[i]]=i;
}

void searchBM(char* txt,char* pat){
    int m=strlen(pat), n=strlen(txt);
    int badchar[ALPHABET];
    badCharHeuristic(pat,m,badchar);
    int s=0;
    while(s<=n-m){
        int j=m-1;
        while(j>=0 && pat[j]==txt[s+j]) j--;
        if(j<0){
            printf("Pattern found at %d\n",s);
            s+=(s+m<n)?m-badchar[(unsigned char)txt[s+m]]:1;
        } else {
            s+=max(1,j-badchar[(unsigned char)txt[s+j]]);
        }
    }
}