#include <stdio.h>
#include <stdlib.h>

#define WIDTH 20
#define HEIGHT 10
#define STEPS 30

// States: 0=empty, 1=conductor, 2=head, 3=tail
int grid[HEIGHT][WIDTH];

void print_grid() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            char c = '.';
            if (grid[y][x] == 1) c = '#';
            else if (grid[y][x] == 2) c = 'H';
            else if (grid[y][x] == 3) c = 't';
            printf("%c", c);
        }
        printf("\n");
    }
    printf("\n");
}

int count_heads(int y, int x) {
    int count = 0;
    for (int dy=-1; dy<=1; dy++)
        for (int dx=-1; dx<=1; dx++) {
            if (dy==0 && dx==0) continue;
            int ny=y+dy, nx=x+dx;
            if (ny>=0 && ny<HEIGHT && nx>=0 && nx<WIDTH) {
                if (grid[ny][nx]==2) count++;
            }
        }
    return count;
}

void step() {
    int newgrid[HEIGHT][WIDTH];
    for (int y=0;y<HEIGHT;y++)
        for (int x=0;x<WIDTH;x++) {
            if (grid[y][x]==0) newgrid[y][x]=0;
            else if (grid[y][x]==1) {
                int heads = count_heads(y,x);
                if (heads==1 || heads==2) newgrid[y][x]=2;
                else newgrid[y][x]=1;
            } else if (grid[y][x]==2) newgrid[y][x]=3;
            else if (grid[y][x]==3) newgrid[y][x]=1;
        }
    for (int y=0;y<HEIGHT;y++)
        for (int x=0;x<WIDTH;x++)
            grid[y][x]=newgrid[y][x];
}

int main() {
    // Simple wire with a head
    for (int x=5;x<15;x++) grid[5][x]=1;
    grid[5][7]=2;

    for (int i=0;i<STEPS;i++) {
        print_grid();
        step();
    }
    return 0;
}