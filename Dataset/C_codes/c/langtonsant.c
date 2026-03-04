#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SIZE 40

int grid[SIZE][SIZE] = {0}; // 0 = white, 1 = black
int x = SIZE/2, y = SIZE/2;
int dx = 0, dy = -1; // facing up

void printGrid() {
    system("clear"); // use "cls" on Windows
    for (int i=0; i<SIZE; i++) {
        for (int j=0; j<SIZE; j++) {
            if (i==y && j==x) printf("A"); // ant
            else printf(grid[i][j] ? "#" : ".");
        }
        printf("\n");
    }
}

void step() {
    if (grid[y][x] == 0) { // white
        // turn right
        int tmp = dx; dx = -dy; dy = tmp;
        grid[y][x] = 1;
    } else { // black
        // turn left
        int tmp = dx; dx = dy; dy = -tmp;
        grid[y][x] = 0;
    }
    x = (x + dx + SIZE) % SIZE;
    y = (y + dy + SIZE) % SIZE;
}

int main() {
    for (int i=0; i<200; i++) {
        printGrid();
        step();
        usleep(100000);
    }
    return 0;
}