#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <direct.h>   // for _chdir

#define MAX_LINE 1024
#define MAX_ARGS 64
#define HISTORY_SIZE 50

char *history[HISTORY_SIZE];
int history_count = 0;

// Add command to history
void add_history(const char *cmd) {
    if (history_count < HISTORY_SIZE) {
        history[history_count++] = _strdup(cmd);
    } else {
        free(history[0]);
        for (int i = 1; i < HISTORY_SIZE; i++) {
            history[i-1] = history[i];
        }
        history[HISTORY_SIZE-1] = _strdup(cmd);
    }
}

// Print history
void print_history() {
    for (int i = 0; i < history_count; i++) {
        printf("%d: %s\n", i+1, history[i]);
    }
}

// Parse input line into arguments
void parse_input(char *line, char **args) {
    int i = 0;
    char *token = strtok(line, " \t\n");
    while (token != NULL && i < MAX_ARGS - 1) {
        args[i++] = token;
        token = strtok(NULL, " \t\n");
    }
    args[i] = NULL;
}

// Built‑in command handler
int builtin_cmd(char **args) {
    if (args[0] == NULL) return 1;

    if (strcmp(args[0], "exit") == 0) {
        exit(0);
    } else if (strcmp(args[0], "cd") == 0) {
        if (args[1] == NULL) {
            fprintf(stderr, "cd: missing argument\n");
        } else {
            if (_chdir(args[1]) != 0) perror("cd failed");
        }
        return 1;
    } else if (strcmp(args[0], "history") == 0) {
        print_history();
        return 1;
    }
    return 0; // not a builtin
}

// Execute external command (Windows version)
void execute_cmd(char **args) {
    char cmdline[MAX_LINE] = "";
    for (int i = 0; args[i] != NULL; i++) {
        strcat(cmdline, args[i]);
        strcat(cmdline, " ");
    }

    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);
    ZeroMemory(&pi, sizeof(pi));

    if (CreateProcess(NULL, cmdline, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi)) {
        WaitForSingleObject(pi.hProcess, INFINITE);
        CloseHandle(pi.hProcess);
        CloseHandle(pi.hThread);
    } else {
        fprintf(stderr, "Failed to execute command: %s (Error %lu)\n", cmdline, GetLastError());
    }
}

int main() {
    char line[MAX_LINE];
    char *args[MAX_ARGS];

    while (1) {
        printf("tinyshell> ");
        if (fgets(line, MAX_LINE, stdin) == NULL) break;

        if (line[0] == '\n') continue;

        // Save command to history
        add_history(line);

        parse_input(line, args);

        if (!builtin_cmd(args)) {
            execute_cmd(args);
        }
    }

    // Free history
    for (int i = 0; i < history_count; i++) {
        free(history[i]);
    }

    return 0;
}