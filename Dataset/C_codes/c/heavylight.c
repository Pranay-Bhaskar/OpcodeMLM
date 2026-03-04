#include <stdio.h>
#include <stdlib.h>

#define MAXN 1000

// Tree adjacency
int adj[MAXN][MAXN];
int deg[MAXN];
int n;

// HLD arrays
int parent[MAXN], depth[MAXN], heavy[MAXN];
int head[MAXN], pos[MAXN];
int curPos;

// Segment tree
int segtree[4*MAXN], values[MAXN];

// DFS to compute sizes and heavy child
int dfs(int v) {
    int size = 1, maxSubtree = 0;
    for (int i=0; i<deg[v]; i++) {
        int u = adj[v][i];
        if (u != parent[v]) {
            parent[u] = v;
            depth[u] = depth[v]+1;
            int subtree = dfs(u);
            if (subtree > maxSubtree) {
                maxSubtree = subtree;
                heavy[v] = u;
            }
            size += subtree;
        }
    }
    return size;
}

// Decompose tree into chains
void decompose(int v, int h) {
    head[v] = h;
    pos[v] = curPos++;
    if (heavy[v] != -1) {
        decompose(heavy[v], h);
    }
    for (int i=0; i<deg[v]; i++) {
        int u = adj[v][i];
        if (u != parent[v] && u != heavy[v]) {
            decompose(u, u);
        }
    }
}

// Segment tree build
void build(int node, int l, int r) {
    if (l == r) {
        segtree[node] = values[l];
    } else {
        int mid = (l+r)/2;
        build(2*node,l,mid);
        build(2*node+1,mid+1,r);
        segtree[node] = segtree[2*node] + segtree[2*node+1];
    }
}

// Segment tree query
int querySeg(int node,int l,int r,int ql,int qr) {
    if (ql>r || qr<l) return 0;
    if (ql<=l && r<=qr) return segtree[node];
    int mid=(l+r)/2;
    return querySeg(2*node,l,mid,ql,qr)+querySeg(2*node+1,mid+1,r,ql,qr);
}

// Segment tree update
void updateSeg(int node,int l,int r,int idx,int val) {
    if (l==r) {
        segtree[node]=val;
    } else {
        int mid=(l+r)/2;
        if (idx<=mid) updateSeg(2*node,l,mid,idx,val);
        else updateSeg(2*node+1,mid+1,r,idx,val);
        segtree[node]=segtree[2*node]+segtree[2*node+1];
    }
}

// Query path sum using HLD
int queryPath(int a,int b) {
    int res=0;
    while (head[a]!=head[b]) {
        if (depth[head[a]]<depth[head[b]]) {
            int temp=a; a=b; b=temp;
        }
        res+=querySeg(1,0,n-1,pos[head[a]],pos[a]);
        a=parent[head[a]];
    }
    if (depth[a]>depth[b]) {
        int temp=a; a=b; b=temp;
    }
    res+=querySeg(1,0,n-1,pos[a],pos[b]);
    return res;
}

// Update node value
void updateNode(int v,int val) {
    updateSeg(1,0,n-1,pos[v],val);
}

// Menu
void menu() {
    int choice;
    do {
        printf("\n--- Heavy-Light Decomposition Toolkit ---\n");
        printf("1. Build Tree\n");
        printf("2. Query Path Sum\n");
        printf("3. Update Node Value\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d",&choice);
        switch(choice) {
            case 1: {
                printf("Enter number of nodes: ");
                scanf("%d",&n);
                for (int i=0;i<n;i++) {
                    deg[i]=0; heavy[i]=-1;
                }
                printf("Enter edges (u v):\n");
                for (int i=0;i<n-1;i++) {
                    int u,v;
                    scanf("%d %d",&u,&v);
                    adj[u][deg[u]++]=v;
                    adj[v][deg[v]++]=u;
                }
                parent[0]=-1; depth[0]=0;
                dfs(0);
                curPos=0;
                decompose(0,0);
                printf("Enter node values:\n");
                for (int i=0;i<n;i++) {
                    int val; scanf("%d",&val);
                    values[pos[i]]=val;
                }
                build(1,0,n-1);
                printf("Tree built with HLD.\n");
                break;
            }
            case 2: {
                int a,b;
                printf("Enter nodes a b: ");
                scanf("%d %d",&a,&b);
                printf("Path sum = %d\n",queryPath(a,b));
                break;
            }
            case 3: {
                int v,val;
                printf("Enter node and new value: ");
                scanf("%d %d",&v,&val);
                updateNode(v,val);
                printf("Node %d updated.\n",v);
                break;
            }
            case 0:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice!\n");
        }
    } while(choice!=0);
}

int main() {
    menu();
    return 0;
}