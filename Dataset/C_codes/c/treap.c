#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Treap Node
typedef struct Node {
    int key;
    int priority;
    struct Node *left, *right;
} Node;

// Utility: create node
Node* createNode(int key) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->key = key;
    node->priority = rand() % 100; // random priority
    node->left = node->right = NULL;
    return node;
}

// Right rotation
Node* rotateRight(Node* y) {
    Node* x = y->left;
    Node* T2 = x->right;
    x->right = y;
    y->left = T2;
    return x;
}

// Left rotation
Node* rotateLeft(Node* x) {
    Node* y = x->right;
    Node* T2 = y->left;
    y->left = x;
    x->right = T2;
    return y;
}

// Insert
Node* insert(Node* root, int key) {
    if (!root) return createNode(key);
    if (key < root->key) {
        root->left = insert(root->left, key);
        if (root->left->priority > root->priority)
            root = rotateRight(root);
    } else if (key > root->key) {
        root->right = insert(root->right, key);
        if (root->right->priority > root->priority)
            root = rotateLeft(root);
    }
    return root;
}

// Delete
Node* deleteNode(Node* root, int key) {
    if (!root) return root;
    if (key < root->key) root->left = deleteNode(root->left, key);
    else if (key > root->key) root->right = deleteNode(root->right, key);
    else {
        if (!root->left) {
            Node* temp = root->right;
            free(root);
            return temp;
        } else if (!root->right) {
            Node* temp = root->left;
            free(root);
            return temp;
        } else {
            if (root->left->priority > root->right->priority) {
                root = rotateRight(root);
                root->right = deleteNode(root->right, key);
            } else {
                root = rotateLeft(root);
                root->left = deleteNode(root->left, key);
            }
        }
    }
    return root;
}

// Search
Node* search(Node* root, int key) {
    if (!root || root->key == key) return root;
    if (key < root->key) return search(root->left, key);
    return search(root->right, key);
}

// Inorder traversal
void inorder(Node* root) {
    if (root) {
        inorder(root->left);
        printf("Key=%d Priority=%d\n", root->key, root->priority);
        inorder(root->right);
    }
}

// Menu-driven interface
void menu() {
    Node* root = NULL;
    int choice, key;
    do {
        printf("\n--- Treap Toolkit ---\n");
        printf("1. Insert Key\n");
        printf("2. Delete Key\n");
        printf("3. Search Key\n");
        printf("4. Print Inorder\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);
        switch(choice) {
            case 1:
                printf("Enter key to insert: ");
                scanf("%d", &key);
                root = insert(root, key);
                break;
            case 2:
                printf("Enter key to delete: ");
                scanf("%d", &key);
                root = deleteNode(root, key);
                break;
            case 3:
                printf("Enter key to search: ");
                scanf("%d", &key);
                if (search(root, key)) printf("Key %d found.\n", key);
                else printf("Key %d not found.\n", key);
                break;
            case 4:
                printf("Inorder Traversal:\n");
                inorder(root);
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
    srand(time(NULL));
    menu();
    return 0;
}