#include <stdio.h>
#include <stdlib.h>

#define TAPE_SIZE 30000

void run_brainfuck(const char *code) {
    unsigned char tape[TAPE_SIZE] = {0};
    unsigned char *ptr = tape;
    const char *pc = code;

    while (*pc) {
        switch (*pc) {
            case '>': ptr++; break;
            case '<': ptr--; break;
            case '+': (*ptr)++; break;
            case '-': (*ptr)--; break;
            case '.': putchar(*ptr); break;
            case ',': *ptr = getchar(); break;
            case '[':
                if (!*ptr) {
                    int loop = 1;
                    while (loop) {
                        pc++;
                        if (*pc == '[') loop++;
                        else if (*pc == ']') loop--;
                    }
                }
                break;
            case ']':
                if (*ptr) {
                    int loop = 1;
                    while (loop) {
                        pc--;
                        if (*pc == ']') loop++;
                        else if (*pc == '[') loop--;
                    }
                }
                break;
        }
        pc++;
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <brainfuck code>\n", argv[0]);
        return 1;
    }
    run_brainfuck(argv[1]);
    return 0;
}