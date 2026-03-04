#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i=2; i<=sqrt(n); i++)
        if (n % i == 0) return false;
    return true;
}

int main() {
    int size = 21;
    int x = size/2, y = size/2;
    int dx = 1, dy = 0, steps = 1, stepCount = 0, turn = 0;
    int num = 1;

    char grid[21][21];
    for (int i=0; i<size; i++)
        for (int j=0; j<size; j++) grid[i][j] = ' ';

    while (num < size*size) {
        if (isPrime(num)) grid[y][x] = '*';
        else grid[y][x] = '.';

        x += dx; y += dy; stepCount++; num++;

        if (stepCount == steps) {
            stepCount = 0;
            int tmp = dx; dx = -dy; dy = tmp; // rotate
            turn++;
            if (turn % 2 == 0) steps++;
        }
    }

    for (int i=0; i<size; i++) {
        for (int j=0; j<size; j++) printf("%c ", grid[i][j]);
        printf("\n");
    }
    return 0;
}