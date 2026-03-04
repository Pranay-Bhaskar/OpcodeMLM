#include <stdio.h>
#include <string.h>

typedef struct {
    char mnemonic[10];
    int opcode;
} Instruction;

Instruction table[] = {
    {"LOAD", 1},
    {"STORE", 2},
    {"ADD", 3},
    {"SUB", 4},
    {"JMP", 5}
};

void assemble(char *mnemonic) {
    for (int i = 0; i < 5; i++) {
        if (strcmp(table[i].mnemonic, mnemonic) == 0) {
            printf("Opcode: %d\n", table[i].opcode);
            return;
        }
    }
    printf("Unknown instruction\n");
}

void disassemble(int opcode) {
    for (int i = 0; i < 5; i++) {
        if (table[i].opcode == opcode) {
            printf("Mnemonic: %s\n", table[i].mnemonic);
            return;
        }
    }
    printf("Unknown opcode\n");
}

int main() {
    assemble("ADD");
    disassemble(2);
    return 0;
}