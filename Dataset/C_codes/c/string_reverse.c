#include <stdio.h>
#include <string.h>

// Reverse a string using loop
int main() {
    char str[] = "hello";
    int len = strlen(str);

    printf("Original string: %s\n", str);

    // Swap characters from both ends
    for (int i = 0; i < len / 2; i++) {
        char temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }

    printf("Reversed string: %s\n", str);
    return 0;
}