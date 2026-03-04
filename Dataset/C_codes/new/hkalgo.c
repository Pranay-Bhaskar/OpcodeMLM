#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100
#define INF 1e9

int U, V; // number of vertices in left (U) and right (V) sets
int adj[MAX][MAX]; // adjacency matrix for bipartite graph
int pairU[MAX], pairV[MAX], dist[MAX];

// BFS to build layers
int bfs() {
    int queue[MAX], front=0, rear=0;
    for (int u = 1; u <= U; u++) {
        if (pairU[u] == 0) {
            dist[u] = 0;
            queue[rear++] = u;
        } else {
            dist[u] = INF;
        }
    }
    int found = 0;
    while (front < rear) {
        int u = queue[front++];
        for (int v = 1; v <= V; v++) {
            if (adj[u][v]) {
                if (pairV[v] == 0) {
                    found = 1;
                } else if (dist[pairV[v]] == INF) {
                    dist[pairV[v]] = dist[u] + 1;
                    queue[rear++] = pairV[v];
                }
            }
        }
    }
    return found;
}

// DFS to find augmenting paths
int dfs(int u) {
    for (int v = 1; v <= V; v++) {
        if (adj[u][v]) {
            if (pairV[v] == 0 || (dist[pairV[v]] == dist[u]+1 && dfs(pairV[v]))) {
                pairU[u] = v;
                pairV[v] = u;
                return 1;
            }
        }
    }
    dist[u] = INF;
    return 0;
}

// Hopcroft-Karp main
int hopcroftKarp() {
    for (int u = 1; u <= U; u++) pairU[u] = 0;
    for (int v = 1; v <= V; v++) pairV[v] = 0;
    int matching = 0;
    while (bfs()) {
        for (int u = 1; u <= U; u++) {
            if (pairU[u] == 0 && dfs(u)) {
                matching++;
            }
        }
    }
    return matching;
}

// Utility to print matching
void printMatching() {
    printf("\nMaximum Matching:\n");
    for (int u = 1; u <= U; u++) {
        if (pairU[u] != 0) {
            printf("U%d - V%d\n", u, pairU[u]);
        }
    }
}

// Menu-driven interface
void menu() {
    int choice;
    do {
        printf("\n--- Hopcroft-Karp Bipartite Matching ---\n");
        printf("1. Enter Graph\n");
        printf("2. Run Hopcroft-Karp\n");
        printf("3. Print Matching\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1: {
                printf("Enter number of vertices in U and V: ");
                scanf("%d %d", &U, &V);
                memset(adj, 0, sizeof(adj));
                int edges;
                printf("Enter number of edges: ");
                scanf("%d", &edges);
                printf("Enter edges (u v):\n");
                for (int i = 0; i < edges; i++) {
                    int u,v;
                    scanf("%d %d", &u, &v);
                    adj[u][v] = 1;
                }
                break;
            }
            case 2: {
                int maxMatch = hopcroftKarp();
                printf("Maximum Matching Size = %d\n", maxMatch);
                break;
            }
            case 3:
                printMatching();
                break;
            case 0:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice!\n");
        }
    } while(choice != 0);
}

int main() {
    menu();
    return 0;
}