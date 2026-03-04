#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define MAX 100

int graph[MAX][MAX];
int vertices;

// Utility
void initGraph(int v) {
    vertices = v;
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++) {
            graph[i][j] = INT_MAX;
        }
    }
}

void addEdge(int u, int v, int w) {
    graph[u][v] = w;
    graph[v][u] = w; // undirected
}

void printGraph() {
    printf("\nAdjacency Matrix:\n");
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

// Bellman-Ford
void bellmanFord(int src) {
    int dist[MAX];
    for (int i = 0; i < vertices; i++) dist[i] = INT_MAX;
    dist[src] = 0;
    for (int k = 0; k < vertices-1; k++) {
        for (int u = 0; u < vertices; u++) {
            for (int v = 0; v < vertices; v++) {
                if (graph[u][v] != INT_MAX && dist[u] != INT_MAX &&
                    dist[u] + graph[u][v] < dist[v]) {
                    dist[v] = dist[u] + graph[u][v];
                }
            }
        }
    }
    printf("Bellman-Ford from %d:\n", src);
    for (int i = 0; i < vertices; i++) {
        printf("To %d: %d\n", i, dist[i]);
    }
}

// Floyd-Warshall
void floydWarshall() {
    int dist[MAX][MAX];
    for (int i = 0; i < vertices; i++)
        for (int j = 0; j < vertices; j++)
            dist[i][j] = graph[i][j];
    for (int k = 0; k < vertices; k++) {
        for (int i = 0; i < vertices; i++) {
            for (int j = 0; j < vertices; j++) {
                if (dist[i][k] != INT_MAX && dist[k][j] != INT_MAX &&
                    dist[i][k] + dist[k][j] < dist[i][j]) {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }
    printf("Floyd-Warshall All-Pairs Shortest Paths:\n");
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++) {
            if (dist[i][j] == INT_MAX) printf("INF ");
            else printf("%d ", dist[i][j]);
        }
        printf("\n");
    }
}

// Prim’s MST
void prims() {
    int parent[MAX], key[MAX], mstSet[MAX];
    for (int i = 0; i < vertices; i++) {
        key[i] = INT_MAX;
        mstSet[i] = 0;
    }
    key[0] = 0;
    parent[0] = -1;
    for (int count = 0; count < vertices-1; count++) {
        int u = -1;
        for (int i = 0; i < vertices; i++) {
            if (!mstSet[i] && (u==-1 || key[i] < key[u])) u = i;
        }
        mstSet[u] = 1;
        for (int v = 0; v < vertices; v++) {
            if (graph[u][v] != INT_MAX && !mstSet[v] && graph[u][v] < key[v]) {
                parent[v] = u;
                key[v] = graph[u][v];
            }
        }
    }
        printf("Prim’s MST:\n");
    for (int i = 1; i < vertices; i++) {
        printf("%d - %d : %d\n", parent[i], i, graph[i][parent[i]]);
    }
}

// Kruskal’s MST
typedef struct {
    int u, v, w;
} Edge;

Edge edges[MAX*MAX];
int edgeCount = 0;
int parent[MAX];

int find(int i) {
    if (parent[i] == i) return i;
    return parent[i] = find(parent[i]);
}

void unionSet(int u, int v) {
    parent[find(u)] = find(v);
}

void kruskal() {
    edgeCount = 0;
    for (int i = 0; i < vertices; i++) {
        for (int j = i+1; j < vertices; j++) {
            if (graph[i][j] != INT_MAX) {
                edges[edgeCount++] = (Edge){i,j,graph[i][j]};
            }
        }
    }
    // sort edges by weight
    for (int i = 0; i < edgeCount-1; i++) {
        for (int j = i+1; j < edgeCount; j++) {
            if (edges[i].w > edges[j].w) {
                Edge temp = edges[i];
                edges[i] = edges[j];
                edges[j] = temp;
            }
        }
    }
    for (int i = 0; i < vertices; i++) parent[i] = i;
    printf("Kruskal’s MST:\n");
    for (int i = 0; i < edgeCount; i++) {
        int u = edges[i].u, v = edges[i].v;
        if (find(u) != find(v)) {
            printf("%d - %d : %d\n", u, v, edges[i].w);
            unionSet(u,v);
        }
    }
}

// Menu
void menu() {
    int choice;
    do {
        printf("\n--- Graph Algorithms Toolkit ---\n");
        printf("1. Print Graph\n");
        printf("2. BFS\n");
        printf("3. DFS\n");
        printf("4. Dijkstra\n");
        printf("5. Bellman-Ford\n");
        printf("6. Floyd-Warshall\n");
        printf("7. Prim’s MST\n");
        printf("8. Kruskal’s MST\n");
        printf("0. Exit\n");
        printf("Enter choice: ");
        scanf("%d", &choice);
        switch(choice) {
            case 1: printGraph(); break;
            case 2: bfs(0); break;
            case 3: dfs(0); break;
            case 4: dijkstra(0); break;
            case 5: bellmanFord(0); break;
            case 6: floydWarshall(); break;
            case 7: prims(); break;
            case 8: kruskal(); break;
            case 0: printf("Exiting...\n"); break;
            default: printf("Invalid choice!\n");
        }
    } while(choice != 0);
}

int main() {
    // Example graph
    initGraph(5);
    addEdge(0,1,10);
    addEdge(0,4,5);
    addEdge(1,2,1);
    addEdge(2,3,4);
    addEdge(3,4,2);

    menu();
    return 0;
}