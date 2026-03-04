#include <stdio.h>
#include <stdlib.h>

#define MEMORY_SIZE 1024

char memory[MEMORY_SIZE];
int used[MEMORY_SIZE];

void *my_malloc(int size) {
    for (int i = 0; i < MEMORY_SIZE - size; i++) {
        int free = 1;
        for (int j = 0; j < size; j++) {
            if (used[i+j]) { free = 0; break; }
        }
        if (free) {
            for (int j = 0; j < size; j++) used[i+j] = 1;
            return &memory[i];
        }
    }
    return NULL;
}

void my_free(void *ptr, int size) {
    int index = (char*)ptr - memory;
    for (int i = 0; i < size; i++) used[index+i] = 0;
}

int main() {
    char *block1 = (char*)my_malloc(100);
    char *block2 = (char*)my_malloc(200);
    if (block1 && block2) {
        printf("Allocated blocks!\n");
    }
    my_free(block1, 100);
    printf("Freed block1\n");
    return 0;
}