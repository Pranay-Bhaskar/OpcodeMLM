#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define POP_SIZE 20
#define MAX_GEN 100
#define TARGET "HELLO"

char population[POP_SIZE][10];

int fitness(char *s) {
    int score = 0;
    for (int i = 0; i < strlen(TARGET); i++) {
        if (s[i] == TARGET[i]) score++;
    }
    return score;
}

void mutate(char *s) {
    int pos = rand() % strlen(TARGET);
    s[pos] = 'A' + rand() % 26;
}

void crossover(char *a, char *b, char *child) {
    int point = rand() % strlen(TARGET);
    for (int i = 0; i < strlen(TARGET); i++) {
        child[i] = (i < point) ? a[i] : b[i];
    }
    child[strlen(TARGET)] = '\0';
}

int main() {
    srand(time(NULL));
    for (int i = 0; i < POP_SIZE; i++) {
        for (int j = 0; j < strlen(TARGET); j++)
            population[i][j] = 'A' + rand() % 26;
        population[i][strlen(TARGET)] = '\0';
    }

    for (int gen = 0; gen < MAX_GEN; gen++) {
        int best = 0;
        for (int i = 1; i < POP_SIZE; i++) {
            if (fitness(population[i]) > fitness(population[best]))
                best = i;
        }
        printf("Gen %d: %s (fitness=%d)\n", gen, population[best], fitness(population[best]));
        if (fitness(population[best]) == strlen(TARGET)) break;

        for (int i = 0; i < POP_SIZE; i++) {
            mutate(population[i]);
        }
    }
    return 0;
}