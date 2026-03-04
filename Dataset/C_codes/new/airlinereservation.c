#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FLIGHTS 50
#define MAX_SEATS 100

typedef struct {
    int seatNumber;
    int booked;
    char passengerName[50];
} Seat;

typedef struct {
    char flightCode[10];
    Seat seats[MAX_SEATS];
} Flight;

Flight flights[MAX_FLIGHTS];
int flightCount = 0;

void addFlight(char *code) {
    strcpy(flights[flightCount].flightCode, code);
    for (int i = 0; i < MAX_SEATS; i++) {
        flights[flightCount].seats[i].seatNumber = i + 1;
        flights[flightCount].seats[i].booked = 0;
    }
    flightCount++;
}

void bookSeat(char *code, int seat, char *name) {
    for (int i = 0; i < flightCount; i++) {
        if (strcmp(flights[i].flightCode, code) == 0) {
            if (!flights[i].seats[seat-1].booked) {
                flights[i].seats[seat-1].booked = 1;
                strcpy(flights[i].seats[seat-1].passengerName, name);
                printf("Seat %d booked for %s on flight %s\n", seat, name, code);
            } else {
                printf("Seat already booked!\n");
            }
            return;
        }
    }
    printf("Flight not found!\n");
}

void showFlight(char *code) {
    for (int i = 0; i < flightCount; i++) {
        if (strcmp(flights[i].flightCode, code) == 0) {
            printf("Flight %s seat map:\n", code);
            for (int j = 0; j < MAX_SEATS; j++) {
                printf("Seat %d: %s\n", flights[i].seats[j].seatNumber,
                       flights[i].seats[j].booked ? flights[i].seats[j].passengerName : "Available");
            }
            return;
        }
    }
    printf("Flight not found!\n");
}

int main() {
    addFlight("AI101");
    bookSeat("AI101", 10, "Pranay");
    bookSeat("AI101", 10, "Another Passenger");
    showFlight("AI101");
    return 0;
}