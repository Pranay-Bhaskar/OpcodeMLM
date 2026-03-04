#include <stdio.h>
#define V 5

int adj[V][V];

void addEdge(int u,int v){ adj[u][v]=1; adj[v][u]=1; }

void BFS(int start) {
    int visited[V]={0}, queue[V], front=0,rear=0;
    visited[start]=1; queue[rear++]=start;
    while(front<rear) {
        int u=queue[front++];
        printf("%d ",u);
        for(int v=0;v<V;v++)
            if(adj[u][v] && !visited[v]) {
                visited[v]=1; queue[rear++]=v;
            }
    }
}

void DFSUtil(int u,int visited[]) {
    visited[u]=1; printf("%d ",u);
    for(int v=0;v<V;v++)
        if(adj[u][v] && !visited[v]) DFSUtil(v,visited);
}

void DFS(int start) {
    int visited[V]={0};
    DFSUtil(start,visited);
}