#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define WIDTH 21
#define HEIGHT 11

char maze[HEIGHT][WIDTH];

void init_maze() {
    for (int y = 0; y < HEIGHT; y++)
        for (int x = 0; x < WIDTH; x++)
            maze[y][x] = '#';
}

void carve(int x, int y) {
    int dirs[4][2] = {{0,-2},{0,2},{-2,0},{2,0}};
    for (int i = 0; i < 4; i++) {
        int r = rand() % 4;
        int tmpx = dirs[i][0]; dirs[i][0] = dirs[r][0]; dirs[r][0] = tmpx;
        int tmpy = dirs[i][1]; dirs[i][1] = dirs[r][1]; dirs[r][1] = tmpy;
    }
    for (int i = 0; i < 4; i++) {
        int nx = x + dirs[i][0], ny = y + dirs[i][1];
        if (nx > 0 && nx < WIDTH-1 && ny > 0 && ny < HEIGHT-1 && maze[ny][nx] == '#') {
            maze[ny][nx] = ' ';
            maze[y + dirs[i][1]/2][x + dirs[i][0]/2] = ' ';
            carve(nx, ny);
        }
    }
}

void print_maze() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            printf("%c", maze[y][x]);
        }
        printf("\n");
    }
}

int main() {
    srand(time(NULL));
    init_maze();
    maze[1][1] = ' ';
    carve(1,1);
    print_maze();
    return 0;
}