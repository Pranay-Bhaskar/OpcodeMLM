#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char *conditions[] = {"Sunny", "Rainy", "Cloudy", "Stormy", "Snowy"};

void simulateWeather(int days) {
    srand(time(NULL));
    for (int i = 1; i <= days; i++) {
        int temp = (rand() % 35) - 5; // -5 to 30°C
        char *cond = conditions[rand() % 5];
        printf("Day %d: %s, Temp: %d°C\n", i, cond, temp);
    }
}

int main() {
    int days;
    printf("Enter number of days to simulate: ");
    scanf("%d", &days);
    simulateWeather(days);
    return 0;
}