#include <stdio.h>

// Demonstrate file write and read
int main() {
    FILE *fptr;

    // Write to file
    fptr = fopen("test.txt", "w");
    fprintf(fptr, "Hello, Binary MLM!\n");
    fclose(fptr);

    // Read from file
    fptr = fopen("test.txt", "r");
    char buffer[100];
    fgets(buffer, 100, fptr);
    printf("File content: %s", buffer);
    fclose(fptr);

    return 0;
}