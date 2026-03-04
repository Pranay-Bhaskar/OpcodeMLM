#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define WIDTH 40
#define HEIGHT 20

int ballX, ballY, ballDX, ballDY;
int paddleY;

void initGame() {
    ballX = WIDTH/2;
    ballY = HEIGHT/2;
    ballDX = 1;
    ballDY = 1;
    paddleY = HEIGHT/2;
}

void drawGame() {
    system("clear"); // use "cls" on Windows
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            if (x == ballX && y == ballY) printf("O");
            else if (x == WIDTH-1 && y >= paddleY-2 && y <= paddleY+2) printf("|");
            else printf(" ");
        }
        printf("\n");
    }
}

void updateGame() {
    ballX += ballDX;
    ballY += ballDY;
    if (ballY <= 0 || ballY >= HEIGHT-1) ballDY = -ballDY;
    if (ballX <= 0) ballDX = -ballDX;
    if (ballX == WIDTH-2 && ballY >= paddleY-2 && ballY <= paddleY+2) {
        ballDX = -ballDX;
    }
}

int main() {
    initGame();
    while (1) {
        drawGame();
        updateGame();
        usleep(100000);
    }
    return 0;
}