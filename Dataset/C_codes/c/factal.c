#include <stdio.h>

void drawTree(int depth, int indent) {
    if (depth == 0) return;
    for (int i = 0; i < indent; i++) printf(" ");
    printf("|\n");
    for (int i = 0; i < indent; i++) printf(" ");
    printf("+\n");
    drawTree(depth - 1, indent + 1);
    drawTree(depth - 1, indent + 2);
}

int main() {
    int depth = 5;
    drawTree(depth, 0);
    return 0;
}