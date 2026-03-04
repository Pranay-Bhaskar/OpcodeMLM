#include <stdio.h>
#include <stdlib.h>

// Define node structure
struct Node {
    int data;
    struct Node* next;
};

// Function to print linked list
void printList(struct Node* head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

int main() {
    // Create nodes dynamically
    struct Node* head = malloc(sizeof(struct Node));
    struct Node* second = malloc(sizeof(struct Node));
    struct Node* third = malloc(sizeof(struct Node));

    head->data = 1; head->next = second;
    second->data = 2; second->next = third;
    third->data = 3; third->next = NULL;

    printList(head);

    // Free memory
    free(head); free(second); free(third);
    return 0;
}