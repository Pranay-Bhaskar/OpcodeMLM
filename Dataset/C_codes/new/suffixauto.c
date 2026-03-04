#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLEN 1000
#define ALPHABET 26

typedef struct State {
    int length;
    int link;
    int next[ALPHABET];
} State;

State st[2*MAXLEN];
int sz, last;

// Initialize automaton
void sa_init() {
    st[0].length = 0;
    st[0].link = -1;
    memset(st[0].next, -1, sizeof(st[0].next));
    sz = 1;
    last = 0;
}

// Extend automaton with character c
void sa_extend(char c) {
    int cur = sz++;
    st[cur].length = st[last].length + 1;
    memset(st[cur].next, -1, sizeof(st[cur].next));

    int p = last;
    int letter = c - 'a';
    while (p != -1 && st[p].next[letter] == -1) {
        st[p].next[letter] = cur;
        p = st[p].link;
    }
    if (p == -1) {
        st[cur].link = 0;
    } else {
        int q = st[p].next[letter];
        if (st[p].length + 1 == st[q].length) {
            st[cur].link = q;
        } else {
            int clone = sz++;
            st[clone].length = st[p].length + 1;
            memcpy(st[clone].next, st[q].next, sizeof(st[q].next));
            st[clone].link = st[q].link;
            while (p != -1 && st[p].next[letter] == q) {
                st[p].next[letter] = clone;
                p = st[p].link;
            }
            st[q].link = st[cur].link = clone;
        }
    }
    last = cur;
}

// Check if substring exists
int sa_contains(char *s) {
    int v = 0;
    for (int i = 0; s[i]; i++) {
        int c = s[i] - 'a';
        if (st[v].next[c] == -1) return 0;
        v = st[v].next[c];
    }
    return 1;
}

// Longest common substring between two strings
int sa_lcs(char *t) {
    int v = 0, l = 0, best = 0;
    for (int i = 0; t[i]; i++) {
        int c = t[i] - 'a';
        if (st[v].next[c] != -1) {
            v = st[v].next[c];
            l++;
        } else {
            while (v != -1 && st[v].next[c] == -1) v = st[v].link;
            if (v == -1) {
                v = 0; l = 0;
            } else {
                l = st[v].length + 1;
                v = st[v].next[c];
            }
        }
        if (l > best) best = l;
    }
    return best;
}

// Debugging: print automaton
void printAutomaton() {
    printf("\nSuffix Automaton States:\n");
    for (int i = 0; i < sz; i++) {
        printf("State %d: length=%d, link=%d, next=[", i, st[i].length, st[i].link);
        for (int c = 0; c < ALPHABET; c++) {
            if (st[i].next[c] != -1) {
                printf("%c->%d ", 'a'+c, st[i].next[c]);
            }
        }
        printf("]\n");
    }
}

// Menu
void menu() {
    char s[MAXLEN], t[MAXLEN];
    int choice;
    do {
        printf("\n--- Suffix Automaton Toolkit ---\n");
        printf("1. Build Automaton from String\n");
        printf("2. Check if Substring Exists\n");
        printf("3. Longest Common Substring with Another String\n");
        printf("4. Print Automaton\n");
        printf("0. Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);
        getchar();
        switch(choice) {
            case 1:
                printf("Enter string: ");
                fgets(s, MAXLEN, stdin);
                s[strcspn(s, "\n")] = 0;
                sa_init();
                for (int i = 0; s[i]; i++) sa_extend(s[i]);
                printf("Automaton built for string '%s'.\n", s);
                break;
            case 2:
                printf("Enter substring: ");
                fgets(t, MAXLEN, stdin);
                t[strcspn(t, "\n")] = 0;
                if (sa_contains(t)) printf("Substring '%s' exists.\n", t);
                else printf("Substring '%s' does not exist.\n", t);
                break;
            case 3:
                printf("Enter second string: ");
                fgets(t, MAXLEN, stdin);
                t[strcspn(t, "\n")] = 0;
                int lcs = sa_lcs(t);
                printf("Longest Common Substring length = %d\n", lcs);
                break;
            case 4:
                printAutomaton();
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