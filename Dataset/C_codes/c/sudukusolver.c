#include <stdio.h>
#define N 9

int grid[N][N] = {
    {5,3,0,0,7,0,0,0,0},
    {6,0,0,1,9,5,0,0,0},
    {0,9,8,0,0,0,0,6,0},
    {8,0,0,0,6,0,0,0,3},
    {4,0,0,8,0,3,0,0,1},
    {7,0,0,0,2,0,0,0,6},
    {0,6,0,0,0,0,2,8,0},
    {0,0,0,4,1,9,0,0,5},
    {0,0,0,0,8,0,0,7,9}
};

int isSafe(int row, int col, int num) {
    for (int x=0; x<N; x++)
        if (grid[row][x]==num || grid[x][col]==num) return 0;
    int startRow=row-row%3, startCol=col-col%3;
    for (int i=0; i<3; i++)
        for (int j=0; j<3; j++)
            if (grid[i+startRow][j+startCol]==num) return 0;
    return 1;
}

int solve() {
    for (int row=0; row<N; row++)
        for (int col=0; col<N; col++)
            if (grid[row][col]==0) {
                for (int num=1; num<=9; num++) {
                    if (isSafe(row,col,num)) {
                        grid[row][col]=num;
                        if (solve()) return 1;
                        grid[row][col]=0;
                    }
                }
                return 0;
            }
    return 1;
}

int main() {
    if (solve()) {
        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) printf("%d ", grid[i][j]);
            printf("\n");
        }
    } else printf("No solution exists\n");
    return 0;
}