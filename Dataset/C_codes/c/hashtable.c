#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

typedef struct Node {
    int key;
    struct Node* next;
} Node;

Node* table[SIZE];

int hash(int key) { return key % SIZE; }

void insert(int key) {
    int h = hash(key);
    Node* n = malloc(sizeof(Node));
    n->key = key; n->next = table[h];
    table[h] = n;
}