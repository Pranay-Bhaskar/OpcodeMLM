#include <stdio.h>
#define SIZE 5

// Simple stack implementation using array
int stack[SIZE], top = -1;

void push(int value) {
    if (top == SIZE - 1) {
        printf("Stack Overflow\n");
    } else {
        stack[++top] = value;
        printf("%d pushed\n", value);
    }
}

void pop() {
    if (top == -1) {
        printf("Stack Underflow\n");
    } else {
        printf("%d popped\n", stack[top--]);
    }
}

int main() {
    push(10);
    push(20);
    pop();
    push(30);
    return 0;
}