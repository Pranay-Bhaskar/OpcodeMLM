#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define POP_SIZE 100
#define DAYS 30

typedef struct {
    int infected;
    int recovered;
    int dead;
} Person;

Person population[POP_SIZE];

void initPopulation() {
    for (int i = 0; i < POP_SIZE; i++) {
        population[i].infected = (i == 0); // patient zero
        population[i].recovered = 0;
        population[i].dead = 0;
    }
}

void simulateDay(int day) {
    printf("Day %d:\n", day);
    for (int i = 0; i < POP_SIZE; i++) {
        if (population[i].infected && !population[i].dead) {
            int chance = rand() % 100;
            if (chance < 5) { // death
                population[i].dead = 1;
                population[i].infected = 0;
                printf("Person %d died.\n", i);
            } else if (chance < 20) { // recovery
                population[i].recovered = 1;
                population[i].infected = 0;
                printf("Person %d recovered.\n", i);
            } else { // spread
                int target = rand() % POP_SIZE;
                if (!population[target].infected && !population[target].recovered && !population[target].dead) {
                    population[target].infected = 1;
                    printf("Person %d infected person %d.\n", i, target);
                }
            }
        }
    }
}

void stats(int day) {
    int infected=0, recovered=0, dead=0;
    for (int i = 0; i < POP_SIZE; i++) {
        if (population[i].infected) infected++;
        if (population[i].recovered) recovered++;
        if (population[i].dead) dead++;
    }
    printf("Summary Day %d: Infected=%d, Recovered=%d, Dead=%d\n\n", day, infected, recovered, dead);
}

int main() {
    srand(time(NULL));
    initPopulation();
    for (int day = 1; day <= DAYS; day++) {
        simulateDay(day);
        stats(day);
    }
    return 0;
}