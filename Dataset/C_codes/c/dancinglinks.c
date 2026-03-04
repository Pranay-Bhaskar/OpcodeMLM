#include <stdio.h>
#include <stdlib.h>

// Node structure for Dancing Links
typedef struct Node {
    struct Node *left, *right, *up, *down;
    struct Column *col;
} Node;

typedef struct Column {
    Node node;
    int size;
    char name[10];
} Column;

Node head;
Column *columns[100];
int colCount = 0;

// Cover and uncover operations
void cover(Column *c) {
    c->node.right->left = c->node.left;
    c->node.left->right = c->node.right;
    for (Node *i = c->node.down; i != &c->node; i = i->down) {
        for (Node *j = i->right; j != i; j = j->right) {
            j->down->up = j->up;
            j->up->down = j->down;
            j->col->size--;
        }
    }
}

void uncover(Column *c) {
    for (Node *i = c->node.up; i != &c->node; i = i->up) {
        for (Node *j = i->left; j != i; j = j->left) {
            j->col->size++;
            j->down->up = j;
            j->up->down = j;
        }
    }
    c->node.right->left = &c->node;
    c->node.left->right = &c->node;
}

// Choose column with minimum size (heuristic)
Column* chooseColumn() {
    int min = 999999;
    Column *best = NULL;
    for (Node *c = head.right; c != &head; c = c->right) {
        Column *col = (Column*)c;
        if (col->size < min) {
            min = col->size;
            best = col;
        }
    }
    return best;
}

// Recursive search
Node *solution[100];
int solCount = 0;

void search(int k) {
    if (head.right == &head) {
        printf("Solution found with %d rows:\n", k);
        for (int i = 0; i < k; i++) {
            printf("Row %d chosen\n", i);
        }
        return;
    }
    Column *c = chooseColumn();
    cover(c);
    for (Node *r = c->node.down; r != &c->node; r = r->down) {
        solution[k] = r;
        for (Node *j = r->right; j != r; j = j->right) {
            cover(j->col);
        }
        search(k+1);
        for (Node *j = r->left; j != r; j = j->left) {
            uncover(j->col);
        }
    }
    uncover(c);
}

// Example setup: Exact cover for simple matrix
void setupExample() {
    // Build a small exact cover problem matrix
    // For simplicity, we’ll hardcode a 4x3 matrix
    // Rows: {1,0,1}, {1,1,0}, {0,1,1}, {1,0,0}
    // Columns: C1, C2, C3
    colCount = 3;
    for (int i = 0; i < colCount; i++) {
        columns[i] = (Column*)malloc(sizeof(Column));
        columns[i]->size = 0;
        sprintf(columns[i]->name, "C%d", i+1);
        columns[i]->node.col = columns[i];
        columns[i]->node.up = columns[i]->node.down = &columns[i]->node;
    }
    // Link columns horizontally
    head.right = &columns[0]->node;
    head.left = &columns[colCount-1]->node;
    columns[0]->node.left = &head;
    columns[colCount-1]->node.right = &head;
    for (int i = 0; i < colCount-1; i++) {
        columns[i]->node.right = &columns[i+1]->node;
        columns[i+1]->node.left = &columns[i]->node;
    }

    // Add rows manually
    int matrix[4][3] = {
        {1,0,1},
        {1,1,0},
        {0,1,1},
        {1,0,0}
    };
    for (int r = 0; r < 4; r++) {
        Node *rowStart = NULL;
        Node *prev = NULL;
        for (int c = 0; c < colCount; c++) {
            if (matrix[r][c]) {
                Node *node = (Node*)malloc(sizeof(Node));
                node->col = columns[c];
                // vertical link
                node->down = &columns[c]->node;
                node->up = columns[c]->node.up;
                columns[c]->node.up->down = node;
                columns[c]->node.up = node;
                columns[c]->size++;
                // horizontal link
                if (!rowStart) rowStart = node;
                if (prev) {
                    prev->right = node;
                    node->left = prev;
                }
                prev = node;
            }
        }
        if (rowStart && prev) {
            rowStart->left = prev;
            prev->right = rowStart;
        }
    }
}

int main() {
    setupExample();
    search(0);
    return 0;
}