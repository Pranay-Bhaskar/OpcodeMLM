#include <stdio.h>
#include <stdlib.h>
#include <conio.h>   // Windows; use ncurses on Linux
#include <windows.h> // for Sleep()

int width = 20, height = 10;
int x, y, fruitX, fruitY, score;
int tailX[100], tailY[100], nTail;
int gameOver;
enum eDirection { STOP=0, LEFT, RIGHT, UP, DOWN};
enum eDirection dir;

void setup() {
    gameOver = 0; dir = STOP;
    x = width / 2; y = height / 2;
    fruitX = rand() % width; fruitY = rand() % height;
    score = 0;
}

void draw() {
    system("cls");
    for (int i=0; i<width+2; i++) printf("#");
    printf("\n");
    for (int i=0; i<height; i++) {
        for (int j=0; j<width; j++) {
            if (j==0) printf("#");
            if (i==y && j==x) printf("O");
            else if (i==fruitY && j==fruitX) printf("F");
            else {
                int print=0;
                for (int k=0; k<nTail; k++)
                    if (tailX[k]==j && tailY[k]==i) { printf("o"); print=1; }
                if (!print) printf(" ");
            }
            if (j==width-1) printf("#");
        }
        printf("\n");
    }
    for (int i=0; i<width+2; i++) printf("#");
    printf("\nScore: %d\n", score);
}

void input() {
    if (_kbhit()) {
        switch (_getch()) {
            case 'a': dir = LEFT; break;
            case 'd': dir = RIGHT; break;
            case 'w': dir = UP; break;
            case 's': dir = DOWN; break;
            case 'x': gameOver = 1; break;
        }
    }
}

void logic() {
    int prevX = tailX[0], prevY = tailY[0];
    int prev2X, prev2Y;
    tailX[0] = x; tailY[0] = y;
    for (int i=1; i<nTail; i++) {
        prev2X = tailX[i]; prev2Y = tailY[i];
        tailX[i] = prevX; tailY[i] = prevY;
        prevX = prev2X; prevY = prev2Y;
    }
    switch (dir) {
        case LEFT: x--; break;
        case RIGHT: x++; break;
        case UP: y--; break;
        case DOWN: y++; break;
    }
    if (x<0 || x>=width || y<0 || y>=height) gameOver=1;
    for (int i=0; i<nTail; i++)
        if (tailX[i]==x && tailY[i]==y) gameOver=1;
    if (x==fruitX && y==fruitY) {
        score += 10;
        fruitX = rand() % width; fruitY = rand() % height;
        nTail++;
    }
}

int main() {
    setup();
    while (!gameOver) {
        draw(); input(); logic();
        Sleep(100);
    }
    return 0;
}
