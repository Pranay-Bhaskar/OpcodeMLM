#include <stdio.h>

#define FRAME_SIZE 3
#define REF_LEN 12

int main() {
    int ref[REF_LEN] = {1,2,3,4,1,2,5,1,2,3,4,5};
    int frames[FRAME_SIZE];
    int front = 0, count = 0, faults = 0;

    for (int i = 0; i < REF_LEN; i++) {
        int hit = 0;
        for (int j = 0; j < count; j++) {
            if (frames[j] == ref[i]) { hit = 1; break; }
        }
        if (!hit) {
            if (count < FRAME_SIZE) {
                frames[count++] = ref[i];
            } else {
                frames[front] = ref[i];
                front = (front + 1) % FRAME_SIZE;
            }
            faults++;
        }
        printf("Step %d: ", i+1);
        for (int j = 0; j < count; j++) printf("%d ", frames[j]);
        printf("\n");
    }
    printf("Total Page Faults = %d\n", faults);
    return 0;
}