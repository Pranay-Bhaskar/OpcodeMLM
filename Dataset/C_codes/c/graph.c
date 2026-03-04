#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int dest;
    struct Node* next;
} Node;

typedef struct {
    Node* head;
} AdjList;

typedef struct {
    int V;
    AdjList* array;
} Graph;

Node* newNode(int dest) {
    Node* n = malloc(sizeof(Node));
    n->dest = dest; n->next = NULL;
    return n;
}

Graph* createGraph(int V) {
    Graph* g = malloc(sizeof(Graph));
    g->V = V;
    g->array = malloc(V * sizeof(AdjList));
    for (int i = 0; i < V; i++) g->array[i].head = NULL;
    return g;
}

void addEdge(Graph* g, int src, int dest) {
    Node* n = newNode(dest);
    n->next = g->array[src].head;
    g->array[src].head = n;
}