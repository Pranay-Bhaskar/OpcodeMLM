#include <stdio.h>

#define BLOCKS 10

int disk[BLOCKS] = {1,-1,2,-1,3,-1,4,-1,5,-1};

void defragment() {
    int compact[BLOCKS], j = 0;
    for (int i = 0; i < BLOCKS; i++) {
        if (disk[i] != -1) compact[j++] = disk[i];
    }
    while (j < BLOCKS) compact[j++] = -1;
    for (int i = 0; i < BLOCKS; i++) disk[i] = compact[i];
}

void showDisk() {
    for (int i = 0; i < BLOCKS; i++) {
        if (disk[i] == -1) printf("[ ] ");
        else printf("[%d] ", disk[i]);
    }
    printf("\n");
}

int main() {
    printf("Before defragmentation:\n");
    showDisk();
    defragment();
    printf("After defragmentation:\n");
    showDisk();
    return 0;
}