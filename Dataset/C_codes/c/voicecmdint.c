#include <stdio.h>
#include <string.h>

void executeCommand(char *cmd) {
    if (strcmp(cmd, "lights on") == 0) {
        printf("Turning lights on...\n");
    } else if (strcmp(cmd, "lights off") == 0) {
        printf("Turning lights off...\n");
    } else if (strcmp(cmd, "play music") == 0) {
        printf("Playing music...\n");
    } else {
        printf("Unknown command: %s\n", cmd);
    }
}

int main() {
    char input[100];
    printf("Enter voice command (simulate):\n");
    while (1) {
        fgets(input, sizeof(input), stdin);
        input[strcspn(input, "\n")] = 0;
        if (strcmp(input, "exit") == 0) break;
        executeCommand(input);
    }
    return 0;
}