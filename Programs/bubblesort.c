#include <stdio.h>

// Bubble sort implementation
int main() {
    int arr[5] = {64, 34, 25, 12, 22};
    int n = 5, i, j, temp;

    // Outer loop for passes
    for (i = 0; i < n-1; i++) {
        // Inner loop for comparisons
        for (j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                // Swap elements
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }

    // Print sorted array
    printf("Sorted array: ");
    for (i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}