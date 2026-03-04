#include <stdio.h>
#include <stdlib.h>
#include <time.h>   // Needed for srand(time(NULL))

#define MAXN 1000   // Define maximum number of nodes

// Node structure for Link-Cut Tree
typedef struct Node {
    struct Node *left, *right, *parent;
    int value;
    int sum; // aggregate value for path queries
    int rev; // lazy reversal flag
} Node;

// Utility: create node
Node* createNode(int val) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->left = node->right = node->parent = NULL;
    node->value = val;
    node->sum = val;
    node->rev = 0;
    return node;
}

// Push down reversal
void push(Node* x) {
    if (x && x->rev) {
        Node* tmp = x->left;
        x->left = x->right;
        x->right = tmp;
        if (x->left) x->left->rev ^= 1;
        if (x->right) x->right->rev ^= 1;
        x->rev = 0;
    }
}

// Update sum
void update(Node* x) {
    if (!x) return;
    x->sum = x->value;
    if (x->left) x->sum += x->left->sum;
    if (x->right) x->sum += x->right->sum;
}

// Check if node is root of splay
int isRoot(Node* x) {
    return !x->parent || (x->parent->left != x && x->parent->right != x);
}

// Rotate
void rotate(Node* x) {
    Node* p = x->parent;
    Node* g = p->parent;
    push(p); push(x);
    if (x == p->left) {
        p->left = x->right;
        if (x->right) x->right->parent = p;
        x->right = p;
    } else {
        p->right = x->left;
        if (x->left) x->left->parent = p;
        x->left = p;
    }
    p->parent = x;
    x->parent = g;
    if (g) {
        if (g->left == p) g->left = x;
        else if (g->right == p) g->right = x;
    }
    update(p); update(x);
}

// Splay
void splay(Node* x) {
    push(x);
    while (!isRoot(x)) {
        Node* p = x->parent;
        Node* g = p->parent;
        if (!isRoot(p)) {
            if ((p->left == x) ^ (g->left == p)) rotate(x);
            else rotate(p);
        }
        rotate(x);
    }
}

// Access
Node* access(Node* x) {
    Node* last = NULL;
    for (Node* y = x; y; y = y->parent) {
        splay(y);
        y->right = last;
        update(y);
        last = y;
    }
    splay(x);
    return last;
}

// Make root
void makeRoot(Node* x) {
    access(x);
    x->rev ^= 1;
    push(x);
}

// Find root
Node* findRoot(Node* x) {
    access(x);
    while (x->left) {
        push(x);
        x = x->left;
    }
    splay(x);
    return x;
}

// Link
void link(Node* x, Node* y) {
    makeRoot(x);
    if (findRoot(y) != x) {
        x->parent = y;
    }
}

// Cut
void cut(Node* x, Node* y) {
    makeRoot(x);
    access(y);
    if (y->left == x && !x->right) {
        y->left = NULL;
        x->parent = NULL;
        update(y);
    }
}

// Path sum query
int query(Node* x, Node* y) {
    makeRoot(x);
    access(y);
    return y->sum;
}

// Menu
void menu() {
    Node* nodes[MAXN] = {NULL}; // Initialize array
    int choice, n = 0;
    do {
        printf("\n--- Link-Cut Tree Toolkit ---\n");
        printf("1. Create Nodes\n");
        printf("2. Link Nodes\n");
        printf("3. Cut Nodes\n");
        printf("4. Query Path Sum\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d",&choice);
        switch(choice) {
            case 1:
                printf("Enter number of nodes: ");
                scanf("%d",&n);
                for (int i=0;i<n;i++) {
                    int val;
                    printf("Value of node %d: ",i);
                    scanf("%d",&val);
                    nodes[i]=createNode(val);
                }
                printf("Nodes created.\n");
                break;
            case 2: {
                int u,v;
                printf("Enter nodes u v to link: ");
                scanf("%d %d",&u,&v);
                if (nodes[u] && nodes[v]) {
                    link(nodes[u],nodes[v]);
                    printf("Linked %d -> %d\n",u,v);
                } else {
                    printf("Invalid nodes.\n");
                }
                break;
            }
            case 3: {
                int u,v;
                printf("Enter nodes u v to cut: ");
                scanf("%d %d",&u,&v);
                if (nodes[u] && nodes[v]) {
                    cut(nodes[u],nodes[v]);
                    printf("Cut edge %d - %d\n",u,v);
                } else {
                    printf("Invalid nodes.\n");
                }
                break;
            }
            case 4: {
                int u,v;
                printf("Enter nodes u v to query path sum: ");
                scanf("%d %d",&u,&v);
                if (nodes[u] && nodes[v]) {
                    printf("Path sum = %d\n",query(nodes[u],nodes[v]));
                } else {
                    printf("Invalid nodes.\n");
                }
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
    srand(time(NULL));
    menu();
    return 0;
}