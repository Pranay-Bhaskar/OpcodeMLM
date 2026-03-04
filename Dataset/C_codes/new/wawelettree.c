#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXN 1000

// Wavelet Tree Node
typedef struct Node {
    int low, high;
    int *map; // bitvector mapping
    int size;
    struct Node *left, *right;
} Node;

// Build Wavelet Tree
Node* build(int arr[], int n, int low, int high) {
    if (low == high || n == 0) return NULL;
    Node* node = (Node*)malloc(sizeof(Node));
    node->low = low;
    node->high = high;
    node->size = n;
    node->map = (int*)malloc((n+1)*sizeof(int));
    node->map[0] = 0;

    int mid = (low+high)/2;
    int *leftArr = (int*)malloc(n*sizeof(int));
    int *rightArr = (int*)malloc(n*sizeof(int));
    int lsize=0, rsize=0;

    for (int i=0; i<n; i++) {
        if (arr[i] <= mid) {
            leftArr[lsize++] = arr[i];
            node->map[i+1] = node->map[i]+1;
        } else {
            rightArr[rsize++] = arr[i];
            node->map[i+1] = node->map[i];
        }
    }

    node->left = build(leftArr, lsize, low, mid);
    node->right = build(rightArr, rsize, mid+1, high);

    free(leftArr);
    free(rightArr);
    return node;
}

// Rank query: count of occurrences of c up to position idx
int rank(Node* node, int c, int idx) {
    if (!node || idx <= 0) return 0;
    if (node->low == node->high) return idx;
    int mid = (node->low+node->high)/2;
    if (c <= mid) {
        return rank(node->left, c, node->map[idx]);
    } else {
        return rank(node->right, c, idx - node->map[idx]);
    }
}

// Select query: position of k-th occurrence of c
int select(Node* node, int c, int k) {
    if (!node) return -1;
    if (node->low == node->high) return k;
    int mid = (node->low+node->high)/2;
    if (c <= mid) {
        return select(node->left, c, k);
    } else {
        return select(node->right, c, k);
    }
}

// Range query: count of numbers in [a,b] within [l,r]
int rangeCount(Node* node, int l, int r, int a, int b) {
    if (!node || l > r || b < node->low || a > node->high) return 0;
    if (a <= node->low && node->high <= b) return r-l+1;
    int leftL = node->map[l-1]+1;
    int leftR = node->map[r];
    int rightL = l - node->map[l-1];
    int rightR = r - node->map[r];
    return rangeCount(node->left, leftL, leftR, a, b) +
           rangeCount(node->right, rightL, rightR, a, b);
}

// Debugging: print structure
void printTree(Node* node, int depth) {
    if (!node) return;
    for (int i=0; i<depth; i++) printf("  ");
    printf("Node [%d,%d], size=%d\n", node->low, node->high, node->size);
    printTree(node->left, depth+1);
    printTree(node->right, depth+1);
}

// Menu
void menu() {
    int arr[MAXN], n;
    Node* root = NULL;
    int choice;
    do {
        printf("\n--- Wavelet Tree Toolkit ---\n");
        printf("1. Build Tree\n");
        printf("2. Rank Query\n");
        printf("3. Select Query\n");
        printf("4. Range Count Query\n");
        printf("5. Print Tree\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);
        switch(choice) {
            case 1:
                printf("Enter size of array: ");
                scanf("%d", &n);
                printf("Enter elements:\n");
                int min=1e9, max=-1e9;
                for (int i=0; i<n; i++) {
                    scanf("%d", &arr[i]);
                    if (arr[i]<min) min=arr[i];
                    if (arr[i]>max) max=arr[i];
                }
                root = build(arr,n,min,max);
                printf("Wavelet Tree built.\n");
                break;
            case 2: {
                int c, idx;
                printf("Enter character (int) and index: ");
                scanf("%d %d", &c, &idx);
                printf("Rank(%d,%d) = %d\n", c, idx, rank(root,c,idx));
                break;
            }
            case 3: {
                int c,k;
                printf("Enter character (int) and k: ");
                scanf("%d %d", &c, &k);
                printf("Select(%d,%d) = %d\n", c, k, select(root,c,k));
                break;
            }
            case 4: {
                int l,r,a,b;
                printf("Enter l r a b: ");
                scanf("%d %d %d %d", &l,&r,&a,&b);
                printf("RangeCount([%d,%d],[%d,%d]) = %d\n", l,r,a,b,
                       rangeCount(root,l,r,a,b));
                break;
            }
            case 5:
                printTree(root,0);
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