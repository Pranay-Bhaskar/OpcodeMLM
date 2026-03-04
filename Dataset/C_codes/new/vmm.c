#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int chunkID;
    int downloaded;
} Chunk;

#define TOTAL_CHUNKS 10
Chunk file[TOTAL_CHUNKS];

void initFile() {
    for (int i = 0; i < TOTAL_CHUNKS; i++) {
        file[i].chunkID = i;
        file[i].downloaded = 0;
    }
}

void downloadChunk(int id) {
    if (!file[id].downloaded) {
        file[id].downloaded = 1;
        printf("Chunk %d downloaded.\n", id);
    } else {
        printf("Chunk %d already downloaded.\n", id);
    }
}

void showProgress() {
    int count = 0;
    for (int i = 0; i < TOTAL_CHUNKS; i++) {
        if (file[i].downloaded) count++;
    }
    printf("Progress: %d/%d chunks downloaded.\n", count, TOTAL_CHUNKS);
}

int main() {
    initFile();
    downloadChunk(3);
    downloadChunk(7);
    showProgress();
    return 0;
}