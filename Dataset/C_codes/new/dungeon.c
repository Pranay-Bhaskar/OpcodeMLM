#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAP_SIZE 10

char map[MAP_SIZE][MAP_SIZE];
int playerX = 0, playerY = 0;

void initMap() {
    for (int i = 0; i < MAP_SIZE; i++) {
        for (int j = 0; j < MAP_SIZE; j++) {
            map[i][j] = '.';
        }
    }
    map[playerX][playerY] = 'P';
    map[MAP_SIZE-1][MAP_SIZE-1] = 'E'; // Exit
}

void showMap() {
    for (int i = 0; i < MAP_SIZE; i++) {
        for (int j = 0; j < MAP_SIZE; j++) {
            printf("%c ", map[i][j]);
        }
        printf("\n");
    }
}

void movePlayer(char dir) {
    map[playerX][playerY] = '.';
    if (dir == 'w' && playerX > 0) playerX--;
    if (dir == 's' && playerX < MAP_SIZE-1) playerX++;
    if (dir == 'a' && playerY > 0) playerY--;
    if (dir == 'd' && playerY < MAP_SIZE-1) playerY++;
    map[playerX][playerY] = 'P';
}

int main() {
    char move;
    initMap();
    while (1) {
        showMap();
        printf("Move (w/a/s/d): ");
        scanf(" %c", &move);
        movePlayer(move);
        if (playerX == MAP_SIZE-1 && playerY == MAP_SIZE-1) {
            printf("You reached the exit!\n");
            break;
        }
    }
    return 0;
}