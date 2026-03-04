#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINES 1000
#define MAX_LEN   256

char *lines[MAX_LINES];
int line_count = 0;

// Load file into memory
void load_file(const char *filename) {
    FILE *fp = fopen(filename, "r");
    if (!fp) { perror("fopen"); return; }
    char buffer[MAX_LEN];
    line_count = 0;
    while (fgets(buffer, MAX_LEN, fp) && line_count < MAX_LINES) {
        buffer[strcspn(buffer, "\n")] = 0;
        lines[line_count] = strdup(buffer);
        line_count++;
    }
    fclose(fp);
}

// Save memory back to file
void save_file(const char *filename) {
    FILE *fp = fopen(filename, "w");
    if (!fp) { perror("fopen"); return; }
    for (int i = 0; i < line_count; i++) {
        fprintf(fp, "%s\n", lines[i]);
    }
    fclose(fp);
}

// Insert line
void insert_line(int pos, const char *text) {
    if (line_count >= MAX_LINES) { printf("Buffer full!\n"); return; }
    if (pos < 0 || pos > line_count) { printf("Invalid position!\n"); return; }
    for (int i = line_count; i > pos; i--) {
        lines[i] = lines[i-1];
    }
    lines[pos] = strdup(text);
    line_count++;
}

// Delete line
void delete_line(int pos) {
    if (pos < 0 || pos >= line_count) { printf("Invalid position!\n"); return; }
    free(lines[pos]);
    for (int i = pos; i < line_count-1; i++) {
        lines[i] = lines[i+1];
    }
    line_count--;
}

// Search text
void search_text(const char *pattern) {
    for (int i = 0; i < line_count; i++) {
        if (strstr(lines[i], pattern)) {
            printf("Line %d: %s\n", i+1, lines[i]);
        }
    }
}

// Print all lines
void print_lines() {
    for (int i = 0; i < line_count; i++) {
        printf("%d: %s\n", i+1, lines[i]);
    }
}

int main() {
    char filename[100];
    printf("Enter filename: ");
    scanf("%s", filename);
    getchar(); // consume newline

    load_file(filename);

    int choice;
    char buffer[MAX_LEN];
    while (1) {
        printf("\n--- Text Editor Menu ---\n");
        printf("1. Print Lines\n");
        printf("2. Insert Line\n");
        printf("3. Delete Line\n");
        printf("4. Search Text\n");
        printf("5. Save & Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);
        getchar();

        switch(choice) {
            case 1: print_lines(); break;
            case 2:
                printf("Enter position: ");
                int pos; scanf("%d", &pos); getchar();
                printf("Enter text: ");
                fgets(buffer, MAX_LEN, stdin);
                buffer[strcspn(buffer,"\n")] = 0;
                insert_line(pos-1, buffer);
                break;
            case 3:
                printf("Enter position: ");
                scanf("%d", &pos); getchar();
                delete_line(pos-1);
                break;
            case 4:
                printf("Enter search pattern: ");
                fgets(buffer, MAX_LEN, stdin);
                buffer[strcspn(buffer,"\n")] = 0;
                search_text(buffer);
                break;
            case 5:
                save_file(filename);
                printf("Saved. Exiting.\n");
                for (int i=0;i<line_count;i++) free(lines[i]);
                return 0;
            default: printf("Invalid choice.\n");
        }
    }
}