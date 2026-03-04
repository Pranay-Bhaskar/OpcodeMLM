#include <stdio.h>
#define SIZE 5

int buffer[SIZE], head = 0, tail = 0, count = 0;

void enqueue(int val) {
    if (count == SIZE) { printf("Buffer full\n"); return; }
    buffer[tail] = val;
    tail = (tail + 1) % SIZE;
    count++;
}

int dequeue() {
    if (count == 0) { printf("Buffer empty\n"); return -1; }
    int val = buffer[head];
    head = (head + 1) % SIZE;
    count--;
    return val;
}