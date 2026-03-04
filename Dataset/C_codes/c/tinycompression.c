#include <stdio.h>
#include <string.h>

void compress(const char *input) {
    int count = 1;
    for (int i=1; i<=strlen(input); i++) {
        if (input[i] == input[i-1]) {
            count++;
        } else {
            printf("%d%c", count, input[i-1]);
            count = 1;
        }
    }
    printf("\n");
}

int main() {
    const char *text = "aaabbccccd";
    compress(text);  // Output: 3a2b4c1d
    return 0;
}