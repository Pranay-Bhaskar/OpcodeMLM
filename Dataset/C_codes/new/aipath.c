#include <stdio.h>
#include <stdlib.h>

#define SIZE 5

int grid[SIZE][SIZE];
int visited[SIZE][SIZE];

typedef struct {
    int x, y;
} Point;

Point queue[SIZE*SIZE];
int front = 0, rear = 0;

void enqueue(Point p) { queue[rear++] = p; }
Point dequeue() { return queue[front++]; }
int isEmpty() { return front == rear; }

void bfs(Point start, Point end) {
    enqueue(start);
    visited[start.x][start.y] = 1;
    while (!isEmpty()) {
        Point cur = dequeue();
        if (cur.x == end.x && cur.y == end.y) {
            printf("Reached destination!\n");
            return;
        }
        int dx[] = {1,-1,0,0};
        int dy[] = {0,0,1,-1};
        for (int i = 0; i < 4; i++) {
            int nx = cur.x + dx[i], ny = cur.y + dy[i];
            if (nx>=0 && ny>=0 && nx<SIZE && ny<SIZE && !visited[nx][ny]) {
                visited[nx][ny] = 1;
                enqueue((Point){nx,ny});
            }
        }
    }
    printf("No path found.\n");
}

int main() {
    Point start = {0,0}, end = {4,4};
    bfs(start, end);
    return 0;
}