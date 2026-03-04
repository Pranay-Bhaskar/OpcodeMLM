#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

#define SIZE 10
#define ITERATIONS 20

struct shmseg {
    int buffer[SIZE];
    int in, out;
};

int main() {
    HANDLE hMapFile, hEmpty, hFull, hMutex;
    struct shmseg *shm;

    // Create shared memory
    hMapFile = CreateFileMapping(
        INVALID_HANDLE_VALUE,    // use paging file
        NULL,                    // default security
        PAGE_READWRITE,          // read/write access
        0,
        sizeof(struct shmseg),
        "Global\\MySharedMemory"
    );

    if (hMapFile == NULL) {
        printf("Could not create file mapping object (%lu).\n", GetLastError());
        return 1;
    }

    shm = (struct shmseg*) MapViewOfFile(
        hMapFile,
        FILE_MAP_ALL_ACCESS,
        0,
        0,
        sizeof(struct shmseg)
    );

    if (shm == NULL) {
        printf("Could not map view of file (%lu).\n", GetLastError());
        CloseHandle(hMapFile);
        return 1;
    }

    // Initialize shared memory
    shm->in = shm->out = 0;

    // Create semaphores
    hEmpty = CreateSemaphore(NULL, SIZE, SIZE, "Global\\Empty");
    hFull  = CreateSemaphore(NULL, 0, SIZE, "Global\\Full");
    hMutex = CreateMutex(NULL, FALSE, "Global\\Mutex");

    if (!hEmpty || !hFull || !hMutex) {
        printf("Could not create synchronization objects.\n");
        return 1;
    }

    // Producer loop
    for (int i = 0; i < ITERATIONS; i++) {
        WaitForSingleObject(hEmpty, INFINITE); // wait for empty slot
        WaitForSingleObject(hMutex, INFINITE); // lock buffer

        shm->buffer[shm->in] = i;
        printf("Produced %d at index %d\n", i, shm->in);
        shm->in = (shm->in + 1) % SIZE;

        ReleaseMutex(hMutex);                  // unlock buffer
        ReleaseSemaphore(hFull, 1, NULL);      // signal full slot

        Sleep(500); // simulate work
    }

    // Consumer loop (for demo purposes in same process)
    for (int i = 0; i < ITERATIONS; i++) {
        WaitForSingleObject(hFull, INFINITE);  // wait for full slot
        WaitForSingleObject(hMutex, INFINITE); // lock buffer

        int item = shm->buffer[shm->out];
        printf("Consumed %d from index %d\n", item, shm->out);
        shm->out = (shm->out + 1) % SIZE;

        ReleaseMutex(hMutex);                  // unlock buffer
        ReleaseSemaphore(hEmpty, 1, NULL);     // signal empty slot

        Sleep(700); // simulate slower consumer
    }

    // Cleanup
    UnmapViewOfFile(shm);
    CloseHandle(hMapFile);
    CloseHandle(hEmpty);
    CloseHandle(hFull);
    CloseHandle(hMutex);

    return 0;
}