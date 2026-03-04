#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

#define MAX_PATH 1024

// Print indentation for tree view
void print_indent(int depth) {
    for (int i = 0; i < depth; i++) {
        printf("   ");
    }
}

// Recursively walk through directories
void walk(const char *path, int depth, int *file_count, int *dir_count) {
    DIR *dir;
    struct dirent *entry;
    char fullpath[MAX_PATH];

    if (!(dir = opendir(path))) {
        perror("opendir");
        return;
    }

    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
            continue;

        snprintf(fullpath, sizeof(fullpath), "%s/%s", path, entry->d_name);

        struct stat statbuf;
        if (stat(fullpath, &statbuf) == -1) {
            perror("stat");
            continue;
        }

        print_indent(depth);
        if (S_ISDIR(statbuf.st_mode)) {
            printf("[DIR] %s\n", entry->d_name);
            (*dir_count)++;
            walk(fullpath, depth + 1, file_count, dir_count);
        } else {
            printf("%s\n", entry->d_name);
            (*file_count)++;
        }
    }
    closedir(dir);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <directory>\n", argv[0]);
        return 1;
    }

    int file_count = 0, dir_count = 0;
    printf("Walking directory tree: %s\n", argv[1]);
    walk(argv[1], 0, &file_count, &dir_count);

    printf("\nSummary:\n");
    printf("Directories: %d\n", dir_count);
    printf("Files: %d\n", file_count);
    return 0;
}