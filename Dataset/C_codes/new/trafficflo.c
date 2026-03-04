#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROAD_LENGTH 50
#define CARS 10
#define STEPS 20

typedef struct {
    int position;
    int speed;
} Car;

Car cars[CARS];

void initCars() {
    for (int i = 0; i < CARS; i++) {
        cars[i].position = i * 5;
        cars[i].speed = 1 + rand()%3;
    }
}

void updateTraffic() {
    for (int i = 0; i < CARS; i++) {
        cars[i].position += cars[i].speed;
        if (cars[i].position >= ROAD_LENGTH) {
            cars[i].position = 0; // loop road
        }
    }
}

void showRoad() {
    char road[ROAD_LENGTH];
    for (int i = 0; i < ROAD_LENGTH; i++) road[i] = '.';
    for (int i = 0; i < CARS; i++) {
        road[cars[i].position] = 'C';
    }
    for (int i = 0; i < ROAD_LENGTH; i++) printf("%c", road[i]);
    printf("\n");
}

int main() {
    srand(time(NULL));
    initCars();
    for (int step = 0; step < STEPS; step++) {
        printf("Step %d:\n", step);
        showRoad();
        updateTraffic();
    }
    return 0;
}