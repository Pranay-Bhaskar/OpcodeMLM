#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define ALPHABET_SIZE 26

typedef struct TrieNode {
    struct TrieNode* children[ALPHABET_SIZE];
    bool isEndOfWord;
} TrieNode;

TrieNode* newNode() {
    TrieNode* node = malloc(sizeof(TrieNode));
    node->isEndOfWord = false;
    for (int i = 0; i < ALPHABET_SIZE; i++) node->children[i] = NULL;
    return node;
}

void insert(TrieNode* root, const char* word) {
    TrieNode* p = root;
    for (int i = 0; word[i]; i++) {
        int idx = word[i] - 'a';
        if (!p->children[idx]) p->children[idx] = newNode();
        p = p->children[idx];
    }
    p->isEndOfWord = true;
}

bool search(TrieNode* root, const char* word) {
    TrieNode* p = root;
    for (int i = 0; word[i]; i++) {
        int idx = word[i] - 'a';
        if (!p->children[idx]) return false;
        p = p->children[idx];
    }
    return p->isEndOfWord;
}