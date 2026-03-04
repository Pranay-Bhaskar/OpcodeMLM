#include <stdio.h>
#include <stdlib.h>

#define POOL_SIZE 1024
char memory[POOL_SIZE];
int used = 0;

void* mymalloc(size_t size) {
    if (used + size > POOL_SIZE) return NULL;
    void* ptr = &memory[used];
    used += size;
    return ptr;
}

void myfree(void* ptr) {
    // Simplified: does nothing (real allocator would track blocks)
}