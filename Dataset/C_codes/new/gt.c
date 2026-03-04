#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define MAX 100

int graph[MAX][MAX];
int vertices;

void addEdge(int u, int v, int w) {
    graph[u][v] = w;
    graph[v][u] = w; // undirected
}

void printGraph() {
    printf("Adjacency Matrix:\n");
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++) {
            if (graph[i][j] == INT_MAX) printf("INF ");
            else printf("%d ", graph[i][j]);
        }
        printf("\n");
    }
}

// BFS
void bfs(int start) {
    int visited[MAX] = {0};
    int queue[MAX], front=0, rear=0;
    visited[start] = 1;
    queue[rear++] = start;
    printf("BFS: ");
    while (front < rear) {
        int u = queue[front++];
        printf("%d ", u);
        for (int v = 0; v < vertices; v++) {
            if (graph[u][v] != INT_MAX && !visited[v]) {
                visited[v] = 1;
                queue[rear++] = v;
            }
        }
    }
    printf("\n");
}

// DFS
void dfsUtil(int u, int visited[]) {
    visited[u] = 1;
    printf("%d ", u);
    for (int v = 0; v < vertices; v++) {
        if (graph[u][v] != INT_MAX && !visited[v]) {
            dfsUtil(v, visited);
        }
    }
}

void dfs(int start) {
    int visited[MAX] = {0};
    printf("DFS: ");
    dfsUtil(start, visited);
    printf("\n");
}

// Dijkstra
void dijkstra(int src) {
    int dist[MAX], visited[MAX];
    for (int i = 0; i < vertices; i++) {
        dist[i] = INT_MAX;
        visited[i] = 0;
    }
    dist[src] = 0;
    for (int count = 0; count < vertices-1; count++) {
        int u = -1;
        for (int i = 0; i < vertices; i++) {
            if (!visited[i] && (u==-1 || dist[i] < dist[u])) u = i;
        }
        visited[u] = 1;
        for (int v = 0; v < vertices; v++) {
            if (graph[u][v] != INT_MAX && dist[u] + graph[u][v] < dist[v]) {
                dist[v] = dist[u] + graph[u][v];
            }
        }
    }
    printf("Dijkstra from %d:\n", src);
    for (int i = 0; i < vertices; i++) {
        printf("To %d: %d\n", i, dist[i]);
    }
}

int main() {
    vertices = 5;
    for (int i = 0; i < vertices; i++)
        for (int j = 0; j < vertices; j++)
            graph[i][j] = INT_MAX;

    addEdge(0,1,10);
    addEdge(0,4,5);
    addEdge(1,2,1);
    addEdge(2,3,4);
    addEdge(3,4,2);

    printGraph();
    bfs(0);
    dfs(0);
    dijkstra(0);

    return 0;
}