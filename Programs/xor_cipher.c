#include <stdio.h>
#include <string.h>

// XOR cipher for simple encryption/decryption
int main() {
    char text[] = "secret";
    char key = 'K'; // single character key

    printf("Original text: %s\n", text);

    // Encrypt
    for (int i = 0; i < strlen(text); i++) {
        text[i] = text[i] ^ key;
    }
    printf("Encrypted text: %s\n", text);

    // Decrypt (XOR again with same key)
    for (int i = 0; i < strlen(text); i++) {
        text[i] = text[i] ^ key;
    }
    printf("Decrypted text: %s\n", text);

    return 0;
}