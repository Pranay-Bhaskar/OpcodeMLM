#include <stdio.h>
#include <stdlib.h>

#define FLOORS 10
#define ELEVATORS 2
#define REQUESTS 5

typedef struct {
    int currentFloor;
    int targetFloor;
    int moving;
} Elevator;

Elevator elevators[ELEVATORS];

void initElevators() {
    for (int i = 0; i < ELEVATORS; i++) {
        elevators[i].currentFloor = 0;
        elevators[i].targetFloor = -1;
        elevators[i].moving = 0;
    }
}

void assignRequest(int floor) {
    int chosen = 0;
    int minDist = abs(elevators[0].currentFloor - floor);
    for (int i = 1; i < ELEVATORS; i++) {
        int dist = abs(elevators[i].currentFloor - floor);
        if (dist < minDist) {
            minDist = dist;
            chosen = i;
        }
    }
    elevators[chosen].targetFloor = floor;
    elevators[chosen].moving = 1;
    printf("Request for floor %d assigned to elevator %d\n", floor, chosen);
}

void moveElevators() {
    for (int i = 0; i < ELEVATORS; i++) {
        if (elevators[i].moving) {
            if (elevators[i].currentFloor < elevators[i].targetFloor) elevators[i].currentFloor++;
            else if (elevators[i].currentFloor > elevators[i].targetFloor) elevators[i].currentFloor--;
            else {
                elevators[i].moving = 0;
                printf("Elevator %d arrived at floor %d\n", i, elevators[i].currentFloor);
            }
        }
    }
}

void showStatus() {
    for (int i = 0; i < ELEVATORS; i++) {
        printf("Elevator %d: Floor %d %s\n", i, elevators[i].currentFloor,
               elevators[i].moving ? "Moving" : "Idle");
    }
}

int main() {
    initElevators();
    int requests[REQUESTS] = {3,7,2,9,5};
    for (int r = 0; r < REQUESTS; r++) {
        assignRequest(requests[r]);
        for (int step = 0; step < 10; step++) {
            moveElevators();
            showStatus();
        }
    }
    return 0;
}