#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SIZE 20

int grid[SIZE][SIZE];

void printGrid() {
    system("clear"); // use "cls" on Windows
    for (int i=0; i<SIZE; i++) {
        for (int j=0; j<SIZE; j++)
            printf(grid[i][j] ? "O" : ".");
        printf("\n");
    }
}

int countNeighbors(int x, int y) {
    int count=0;
    for (int i=-1; i<=1; i++)
        for (int j=-1; j<=1; j++) {
            if (i==0 && j==0) continue;
            int nx=x+i, ny=y+j;
            if (nx>=0 && nx<SIZE && ny>=0 && ny<SIZE)
                count += grid[nx][ny];
        }
    return count;
}

void step() {
    int newGrid[SIZE][SIZE] = {0};
    for (int i=0; i<SIZE; i++)
        for (int j=0; j<SIZE; j++) {
            int neighbors = countNeighbors(i,j);
            if (grid[i][j] && (neighbors==2 || neighbors==3))
                newGrid[i][j] = 1;
            else if (!grid[i][j] && neighbors==3)
                newGrid[i][j] = 1;
        }
    for (int i=0; i<SIZE; i++)
        for (int j=0; j<SIZE; j++)
            grid[i][j] = newGrid[i][j];
}

int main() {
    // Seed with a "glider"
    grid[1][2]=grid[2][3]=grid[3][1]=grid[3][2]=grid[3][3]=1;

    while (1) {
        printGrid();
        step();
        usleep(200000);
    }
    return 0;
}