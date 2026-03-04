#include <stdio.h>
#include <stdbool.h>

#define N 9

// Print Sudoku grid
void printGrid(int grid[N][N]) {
    for (int row = 0; row < N; row++) {
        for (int col = 0; col < N; col++) {
            printf("%d ", grid[row][col]);
        }
        printf("\n");
    }
}

// Check if number is safe in given position
bool isSafe(int grid[N][N], int row, int col, int num) {
    for (int x = 0; x < N; x++)
        if (grid[row][x] == num) return false;

    for (int x = 0; x < N; x++)
        if (grid[x][col] == num) return false;

    int startRow = row - row % 3;
    int startCol = col - col % 3;
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            if (grid[i + startRow][j + startCol] == num) return false;

    return true;
}

// Backtracking solver
bool solveSudoku(int grid[N][N]) {
    int row = -1, col = -1;
    bool empty = false;
    for (int i = 0; i < N && !empty; i++) {
        for (int j = 0; j < N; j++) {
            if (grid[i][j] == 0) {
                row = i; col = j;
                empty = true;
                break;
            }
        }
    }

    if (!empty) return true; // solved

    for (int num = 1; num <= 9; num++) {
        if (isSafe(grid, row, col, num)) {
            grid[row][col] = num;
            if (solveSudoku(grid)) return true;
            grid[row][col] = 0; // backtrack
        }
    }
    return false;
}

// Validate initial grid
bool validateGrid(int grid[N][N]) {
    for (int row = 0; row < N; row++) {
        for (int col = 0; col < N; col++) {
            int num = grid[row][col];
            if (num != 0) {
                grid[row][col] = 0;
                if (!isSafe(grid, row, col, num)) {
                    grid[row][col] = num;
                    return false;
                }
                grid[row][col] = num;
            }
        }
    }
    return true;
}

int main() {
    int grid[N][N];
    printf("Enter Sudoku grid (0 for empty cells):\n");
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            scanf("%d", &grid[i][j]);
        }
    }

    printf("Initial Grid:\n");
    printGrid(grid);

    if (!validateGrid(grid)) {
        printf("Invalid Sudoku grid!\n");
        return 1;
    }

    if (solveSudoku(grid)) {
        printf("Solved Sudoku:\n");
        printGrid(grid);
    } else {
        printf("No solution exists.\n");
    }
    return 0;
}