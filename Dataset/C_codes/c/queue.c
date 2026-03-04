#include <stdio.h>
#define SIZE 5

// Simple queue implementation using array
int queue[SIZE], front = -1, rear = -1;

void enqueue(int value) {
    if (rear == SIZE - 1) {
        printf("Queue Overflow\n");
    } else {
        if (front == -1) front = 0;
        queue[++rear] = value;
        printf("%d enqueued\n", value);
    }
}

void dequeue() {
    if (front == -1 || front > rear) {
        printf("Queue Underflow\n");
    } else {
        printf("%d dequeued\n", queue[front++]);
    }
}

int main() {
    enqueue(10);
    enqueue(20);
    dequeue();
    enqueue(30);
    return 0;
}