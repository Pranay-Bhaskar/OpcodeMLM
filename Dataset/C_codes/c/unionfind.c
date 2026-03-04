#include <stdio.h>

#define N 10
int parent[N], rankArr[N];

void makeSet() {
    for (int i = 0; i < N; i++) {
        parent[i] = i;
        rankArr[i] = 0;
    }
}

int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
}

void unionSet(int x, int y) {
    int rx = find(x), ry = find(y);
    if (rx == ry) return;
    if (rankArr[rx] < rankArr[ry]) parent[rx] = ry;
    else if (rankArr[rx] > rankArr[ry]) parent[ry] = rx;
    else { parent[ry] = rx; rankArr[rx]++; }
}