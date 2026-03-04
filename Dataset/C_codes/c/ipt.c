#include <stdio.h>
#include <stdlib.h>

#define MAX 256

int width,height,maxval;
int image[MAX][MAX];

void load_pgm(const char* file){
    FILE* fp=fopen(file,"r");
    char magic[3]; fscanf(fp,"%s",magic);
    fscanf(fp,"%d %d %d",&width,&height,&maxval);
    for(int i=0;i<height;i++) for(int j=0;j<width;j++) fscanf(fp,"%d",&image[i][j]);
    fclose(fp);
}
void save_pgm(const char* file){
    FILE* fp=fopen(file,"w");
    fprintf(fp,"P2\n%d %d\n%d\n",width,height,maxval);
    for(int i=0;i<height;i++){ for(int j=0;j<width;j++) fprintf(fp,"%d ",image[i][j]); fprintf(fp,"\n"); }
    fclose(fp);
}
void invert(){ for(int i=0;i<height;i++) for(int j=0;j<width;j++) image[i][j]=maxval-image[i][j]; }
void threshold(int t){ for(int i=0;i<height;i++) for(int j=0;j<width;j++) image[i][j]=(image[i][j]>t)?maxval:0; }

int main(){
    load_pgm("input.pgm");
    invert();
    threshold(maxval/2);
    save_pgm("output.pgm");
    return 0;
}