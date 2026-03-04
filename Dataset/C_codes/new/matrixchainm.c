#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define MAX 50

// Utility to print optimal parenthesization
void printOptimalParens(int s[MAX][MAX], int i, int j) {
    if (i == j) {
        printf("A%d", i);
    } else {
        printf("(");
        printOptimalParens(s, i, s[i][j]);
        printOptimalParens(s, s[i][j]+1, j);
        printf(")");
    }
}

// Matrix Chain Multiplication DP
void matrixChainOrder(int p[], int n) {
    int m[MAX][MAX]; // cost table
    int s[MAX][MAX]; // split table

    for (int i = 1; i < n; i++) {
        m[i][i] = 0;
    }

    for (int L = 2; L < n; L++) { // chain length
        for (int i = 1; i < n-L+1; i++) {
            int j = i+L-1;
            m[i][j] = INT_MAX;
            for (int k = i; k <= j-1; k++) {
                int q = m[i][k] + m[k+1][j] + p[i-1]*p[k]*p[j];
                if (q < m[i][j]) {
                    m[i][j] = q;
                    s[i][j] = k;
                }
            }
        }
    }

    printf("\nMinimum number of multiplications: %d\n", m[1][n-1]);
    printf("Optimal Parenthesization: ");
    printOptimalParens(s, 1, n-1);
    printf("\n");

    // Debugging tables
    printf("\nCost Table (m):\n");
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < n; j++) {
            if (i > j) printf("    ");
            else printf("%4d ", m[i][j]);
        }
        printf("\n");
    }

    printf("\nSplit Table (s):\n");
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < n; j++) {
            if (i > j) printf("    ");
            else printf("%4d ", s[i][j]);
        }
        printf("\n");
    }
}

// Menu-driven interface
void menu() {
    int choice;
    do {
        printf("\n--- Matrix Chain Multiplication Toolkit ---\n");
        printf("1. Solve Matrix Chain Order\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1: {
                int n;
                printf("Enter number of matrices: ");
                scanf("%d", &n);
                int p[MAX];
                printf("Enter dimensions array (length %d):\n", n+1);
                for (int i = 0; i <= n; i++) {
                    scanf("%d", &p[i]);
                }
                matrixChainOrder(p, n+1);
                break;
            }
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