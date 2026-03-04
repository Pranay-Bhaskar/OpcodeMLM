#include <stdio.h>

// Perform binary search on a sorted array
int binarySearch(int arr[], int n, int key) {
    int low = 0, high = n - 1;

    while (low <= high) {
        int mid = (low + high) / 2;

        if (arr[mid] == key) return mid; // element found
        else if (arr[mid] < key) low = mid + 1; // search right half
        else high = mid - 1; // search left half
    }
    return -1; // not found
}

int main() {
    int arr[] = {2, 4, 6, 8, 10, 12};
    int n = 6, key = 10;

    int result = binarySearch(arr, n, key);

    if (result != -1)
        printf("Element found at index %d\n", result);
    else
        printf("Element not found\n");

    return 0;
}