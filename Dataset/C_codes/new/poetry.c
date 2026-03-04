#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define MAX_WORDS 10
#define MAX_LINE  100

// Word banks
const char *nouns[] = {"moon","river","dream","shadow","flame","forest","cloud","stone","song","silence"};
const char *verbs[] = {"whispers","flows","burns","wanders","falls","rises","sleeps","shines","calls","waits"};
const char *adjectives[] = {"silent","ancient","lonely","bright","dark","gentle","wild","fragile","eternal","hidden"};
const char *articles[] = {"the","a","one","this","that","each","every","some","any","no"};

void random_line(char *buffer) {
    // Build a line like: "the silent moon whispers"
    sprintf(buffer, "%s %s %s %s",
        articles[rand() % MAX_WORDS],
        adjectives[rand() % MAX_WORDS],
        nouns[rand() % MAX_WORDS],
        verbs[rand() % MAX_WORDS]);
}

int main() {
    srand(time(NULL));
    int lines = 5; // number of lines in poem
    char buffer[MAX_LINE];

    printf("Random Poem:\n\n");
    for (int i = 0; i < lines; i++) {
        random_line(buffer);
        printf("%s\n", buffer);
    }

    return 0;
}