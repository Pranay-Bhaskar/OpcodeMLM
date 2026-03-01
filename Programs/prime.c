#include <stdio.h>

// Print prime numbers up to n
int main() {
    int n = 20;

    printf("Prime numbers up to %d:\n", n);
    for (int i = 2; i <= n; i++) {
        int isPrime = 1;
        for (int j = 2; j <= i/2; j++) {
            if (i % j == 0) {
                isPrime = 0;
                break;
            }
        }
        if (isPrime) {
            printf("%d ", i);
        }
    }
    return 0;
}