#include <stdio.h>
#include <dirent.h>
#include <string.h>

void listDir(const char *path, int depth) {
    DIR *dir = opendir(path);
    if (!dir) return;

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".")==0 || strcmp(entry->d_name, "..")==0) continue;
        for (int i=0; i<depth; i++) printf("  ");
        printf("%s\n", entry->d_name);

        if (entry->d_type == DT_DIR) {
            char newPath[1024];
            snprintf(newPath, sizeof(newPath), "%s/%s", path, entry->d_name);
            listDir(newPath, depth+1);
        }
    }
    closedir(dir);
}

int main(int argc, char *argv[]) {
    const char *path = (argc > 1) ? argv[1] : ".";
    listDir(path, 0);
    return 0;
}