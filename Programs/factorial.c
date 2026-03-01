#include <stdio.h>

// This function calculates factorial recursively
int factorial(int n) {
    if (n == 0) return 1; // base case
    return n * factorial(n - 1); // recursive call
}

/* The main function starts here.
   It calls factorial(5) and prints the result. */
int main() {
    int num = 5;
    printf("Factorial of %d is %d\n", num, factorial(num));
    return 0;
}