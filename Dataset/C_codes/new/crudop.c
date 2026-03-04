#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME 50
#define MAX_RECORDS 100

typedef struct {
    int id;
    char name[MAX_NAME];
    int age;
} Record;

Record db[MAX_RECORDS];
int count = 0;

// Save database to file
void save_db(const char *filename) {
    FILE *fp = fopen(filename, "w");
    if (!fp) { perror("fopen"); return; }
    for (int i = 0; i < count; i++) {
        fprintf(fp, "%d,%s,%d\n", db[i].id, db[i].name, db[i].age);
    }
    fclose(fp);
}

// Load database from file
void load_db(const char *filename) {
    FILE *fp = fopen(filename, "r");
    if (!fp) return;
    count = 0;
    while (fscanf(fp, "%d,%49[^,],%d\n", &db[count].id, db[count].name, &db[count].age) == 3) {
        count++;
    }
    fclose(fp);
}

// Create record
void create_record() {
    if (count >= MAX_RECORDS) { printf("DB full!\n"); return; }
    Record r;
    printf("Enter ID: "); scanf("%d", &r.id);
    printf("Enter Name: "); scanf("%s", r.name);
    printf("Enter Age: "); scanf("%d", &r.age);
    db[count++] = r;
    printf("Record added.\n");
}

// Read records
void read_records() {
    printf("ID\tName\tAge\n");
    for (int i = 0; i < count; i++) {
        printf("%d\t%s\t%d\n", db[i].id, db[i].name, db[i].age);
    }
}

// Update record
void update_record() {
    int id;
    printf("Enter ID to update: "); scanf("%d", &id);
    for (int i = 0; i < count; i++) {
        if (db[i].id == id) {
            printf("Enter new Name: "); scanf("%s", db[i].name);
            printf("Enter new Age: "); scanf("%d", &db[i].age);
            printf("Record updated.\n");
            return;
        }
    }
    printf("Record not found.\n");
}

// Delete record
void delete_record() {
    int id;
    printf("Enter ID to delete: "); scanf("%d", &id);
    for (int i = 0; i < count; i++) {
        if (db[i].id == id) {
            for (int j = i; j < count-1; j++) {
                db[j] = db[j+1];
            }
            count--;
            printf("Record deleted.\n");
            return;
        }
    }
    printf("Record not found.\n");
}

int main() {
    char filename[] = "database.txt";
    load_db(filename);

    int choice;
    while (1) {
        printf("\n--- Text Database Menu ---\n");
        printf("1. Create Record\n");
        printf("2. Read Records\n");
        printf("3. Update Record\n");
        printf("4. Delete Record\n");
        printf("5. Save & Exit\n");
        printf("Choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1: create_record(); break;
            case 2: read_records(); break;
            case 3: update_record(); break;
            case 4: delete_record(); break;
            case 5: save_db(filename); printf("Saved. Exiting.\n"); return 0;
            default: printf("Invalid choice.\n");
        }
    }
}