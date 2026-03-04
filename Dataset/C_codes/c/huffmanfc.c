#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CHARS 256

typedef struct Node {
    char ch;
    int freq;
    struct Node *left, *right;
} Node;

typedef struct {
    Node *nodes[MAX_CHARS];
    int size;
} MinHeap;

typedef struct {
    char bits[256];
} Code;

Code codes[MAX_CHARS];

// Create new node
Node* newNode(char ch, int freq) {
    Node* node = (Node*)malloc(sizeof(Node));
    node->ch = ch;
    node->freq = freq;
    node->left = node->right = NULL;
    return node;
}

// MinHeap functions
MinHeap* createHeap() {
    MinHeap* heap = (MinHeap*)malloc(sizeof(MinHeap));
    heap->size = 0;
    return heap;
}

void swap(Node** a, Node** b) {
    Node* t = *a; *a = *b; *b = t;
}

void heapify(MinHeap* heap, int i) {
    int smallest = i;
    int l = 2*i+1, r = 2*i+2;
    if (l < heap->size && heap->nodes[l]->freq < heap->nodes[smallest]->freq)
        smallest = l;
    if (r < heap->size && heap->nodes[r]->freq < heap->nodes[smallest]->freq)
        smallest = r;
    if (smallest != i) {
        swap(&heap->nodes[i], &heap->nodes[smallest]);
        heapify(heap, smallest);
    }
}

Node* extractMin(MinHeap* heap) {
    Node* temp = heap->nodes[0];
    heap->nodes[0] = heap->nodes[heap->size-1];
    heap->size--;
    heapify(heap, 0);
    return temp;
}

void insertHeap(MinHeap* heap, Node* node) {
    heap->size++;
    int i = heap->size-1;
    heap->nodes[i] = node;
    while (i && heap->nodes[i]->freq < heap->nodes[(i-1)/2]->freq) {
        swap(&heap->nodes[i], &heap->nodes[(i-1)/2]);
        i = (i-1)/2;
    }
}

// Build Huffman tree
Node* buildHuffmanTree(int freq[]) {
    MinHeap* heap = createHeap();
    for (int i=0;i<MAX_CHARS;i++) {
        if (freq[i]>0) {
            insertHeap(heap, newNode((char)i, freq[i]));
        }
    }
    while (heap->size > 1) {
        Node* left = extractMin(heap);
        Node* right = extractMin(heap);
        Node* top = newNode('$', left->freq+right->freq);
        top->left = left;
        top->right = right;
        insertHeap(heap, top);
    }
    return extractMin(heap);
}

// Generate codes
void generateCodes(Node* root, char* str, int depth) {
    if (!root) return;
    if (root->ch != '$') {
        strcpy(codes[(unsigned char)root->ch].bits, str);
    }
    char left[256], right[256];
    strcpy(left, str); strcat(left, "0");
    strcpy(right, str); strcat(right, "1");
    generateCodes(root->left, left, depth+1);
    generateCodes(root->right, right, depth+1);
}

// Compress file
void compress(const char* infile, const char* outfile) {
    FILE* fp = fopen(infile,"r");
    if (!fp) { perror("fopen"); return; }
    int freq[MAX_CHARS]={0};
    int c;
    while ((c=fgetc(fp))!=EOF) freq[c]++;
    fclose(fp);

    Node* root = buildHuffmanTree(freq);
    generateCodes(root,"",0);

    fp = fopen(infile,"r");
    FILE* out = fopen(outfile,"w");
    while ((c=fgetc(fp))!=EOF) {
        fputs(codes[c].bits,out);
    }
    fclose(fp); fclose(out);
    printf("Compressed to %s\n",outfile);
}

// Decompress file
void decompress(const char* infile, const char* outfile, Node* root) {
    FILE* fp = fopen(infile,"r");
    FILE* out = fopen(outfile,"w");
    if (!fp||!out) { perror("fopen"); return; }
    Node* curr=root;
    int c;
    while ((c=fgetc(fp))!=EOF) {
        if (c=='0') curr=curr->left;
        else curr=curr->right;
        if (!curr->left && !curr->right) {
            fputc(curr->ch,out);
            curr=root;
        }
    }
    fclose(fp); fclose(out);
    printf("Decompressed to %s\n",outfile);
}

int main() {
    char infile[100], outfile[100];
    printf("Enter input file: ");
    scanf("%s", infile);
    printf("Enter compressed output file: ");
    scanf("%s", outfile);

    compress(infile,outfile);

    char decompressed[100];
    printf("Enter decompressed output file: ");
    scanf("%s", decompressed);

    // For simplicity, rebuild tree again
    FILE* fp=fopen(infile,"r");
    int freq[MAX_CHARS]={0},c;
    while ((c=fgetc(fp))!=EOF) freq[c]++;
    fclose(fp);
    Node* root=buildHuffmanTree(freq);

    decompress(outfile,decompressed,root);
    return 0;
}