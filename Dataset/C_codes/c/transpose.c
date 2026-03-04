#include <stdio.h>

void transpose(int A[3][3],int B[3][3]){
    for(int i=0;i<3;i++)
        for(int j=0;j<3;j++)
            B[j][i]=A[i][j];
}

void inverse2x2(float A[2][2],float inv[2][2]){
    float det=A[0][0]*A[1][1]-A[0][1]*A[1][0];
    if(det==0){ printf("No inverse\n"); return; }
    inv[0][0]=A[1][1]/det;
    inv[0][1]=-A[0][1]/det;
    inv[1][0]=-A[1][0]/det;
    inv[1][1]=A[0][0]/det;
}