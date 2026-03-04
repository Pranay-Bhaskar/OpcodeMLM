#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 1000

// ---------------- KMP Algorithm ----------------
void computeLPSArray(char* pat, int M, int* lps) {
    int len = 0;
    lps[0] = 0;
    int i = 1;
    while (i < M) {
        if (pat[i] == pat[len]) {
            len++;
            lps[i] = len;
            i++;
        } else {
            if (len != 0) {
                len = lps[len-1];
            } else {
                lps[i] = 0;
                i++;
            }
        }
    }
}

void KMPSearch(char* pat, char* txt) {
    int M = strlen(pat);
    int N = strlen(txt);
    int lps[M];
    computeLPSArray(pat, M, lps);

    int i = 0, j = 0;
    while (i < N) {
        if (pat[j] == txt[i]) {
            j++; i++;
        }
        if (j == M) {
            printf("KMP: Found pattern at index %d\n", i-j);
            j = lps[j-1];
        } else if (i < N && pat[j] != txt[i]) {
            if (j != 0) j = lps[j-1];
            else i++;
        }
    }
}

// ---------------- Boyer-Moore Algorithm ----------------
#define NO_OF_CHARS 256

void badCharHeuristic(char *str, int size, int badchar[NO_OF_CHARS]) {
    for (int i = 0; i < NO_OF_CHARS; i++) badchar[i] = -1;
    for (int i = 0; i < size; i++) badchar[(int) str[i]] = i;
}

void boyerMooreSearch(char *txt, char *pat) {
    int m = strlen(pat);
    int n = strlen(txt);

    int badchar[NO_OF_CHARS];
    badCharHeuristic(pat, m, badchar);

    int s = 0; // shift
    while (s <= (n - m)) {
        int j = m-1;
        while (j >= 0 && pat[j] == txt[s+j]) j--;
        if (j < 0) {
            printf("Boyer-Moore: Found pattern at index %d\n", s);
            s += (s+m < n) ? m-badchar[txt[s+m]] : 1;
        } else {
            s += (j - badchar[txt[s+j]] > 1) ? j - badchar[txt[s+j]] : 1;
        }
    }
}

// ---------------- Menu & Benchmark ----------------
void runAlgorithms(char *text, char *pattern) {
    printf("\nRunning KMP...\n");
    KMPSearch(pattern, text);
    printf("\nRunning Boyer-Moore...\n");
    boyerMooreSearch(text, pattern);
}

void menu() {
    char text[MAX], pattern[MAX];
    int choice;
    do {
        printf("\n--- String Search Suite ---\n");
        printf("1. Enter Text & Pattern\n");
        printf("2. Run KMP\n");
        printf("3. Run Boyer-Moore\n");
        printf("4. Run Both\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);
        getchar();
        switch(choice) {
            case 1:
                printf("Enter text: ");
                fgets(text, MAX, stdin);
                text[strcspn(text, "\n")] = 0;
                printf("Enter pattern: ");
                fgets(pattern, MAX, stdin);
                pattern[strcspn(pattern, "\n")] = 0;
                break;
            case 2:
                KMPSearch(pattern, text);
                break;
            case 3:
                boyerMooreSearch(text, pattern);
                break;
            case 4:
                runAlgorithms(text, pattern);
                break;
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