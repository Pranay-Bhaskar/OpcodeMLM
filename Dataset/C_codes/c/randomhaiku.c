#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const char *five[] = {"Silent autumn breeze", "Whispers in the night", "Falling cherry leaves"};
const char *seven[] = {"Shadows dance across the moonlit river", "Lonely bird sings softly in the forest"};

int main() {
    srand(time(NULL));
    printf("%s\n", five[rand()%3]);
    printf("%s\n", seven[rand()%2]);
    printf("%s\n", five[rand()%3]);
    return 0;
}