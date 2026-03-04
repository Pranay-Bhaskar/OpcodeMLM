#include <stdio.h>

// Multiply two 2x2 matrices
int main() {
    int A[2][2] = {{1, 2}, {3, 4}};
    int B[2][2] = {{2, 0}, {1, 2}};
    int C[2][2] = {0}; // result matrix

    // Perform multiplication
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            C[i][j] = 0;
            for (int k = 0; k < 2; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    // Print result
    printf("Result matrix:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }
    return 0;
}