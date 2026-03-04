#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TASKS 100
#define MAX_NAME  100

typedef struct {
    int id;
    char name[MAX_NAME];
    int priority;
    int completed;
} Task;

Task tasks[MAX_TASKS];
int task_count = 0;

// Save tasks to file
void save_tasks(const char *filename) {
    FILE *fp = fopen(filename,"w");
    if (!fp) { perror("fopen"); return; }
    for (int i=0;i<task_count;i++) {
        fprintf(fp,"%d,%s,%d,%d\n",tasks[i].id,tasks[i].name,
                tasks[i].priority,tasks[i].completed);
    }
    fclose(fp);
    printf("Tasks saved to %s\n",filename);
}

// Load tasks from file
void load_tasks(const char *filename) {
    FILE *fp = fopen(filename,"r");
    if (!fp) return;
    task_count=0;
    while (fscanf(fp,"%d,%99[^,],%d,%d\n",&tasks[task_count].id,
                  tasks[task_count].name,&tasks[task_count].priority,
                  &tasks[task_count].completed)==4) {
        task_count++;
    }
    fclose(fp);
    printf("Loaded tasks from %s\n",filename);
}

// Add task
void add_task() {
    if (task_count>=MAX_TASKS) { printf("Task list full!\n"); return; }
    Task t;
    t.id=task_count+1;
    printf("Enter task name: ");
    fgets(t.name,MAX_NAME,stdin);
    t.name[strcspn(t.name,"\n")]=0;
    printf("Enter priority (1=high, 5=low): ");
    scanf("%d",&t.priority); getchar();
    t.completed=0;
    tasks[task_count++]=t;
    printf("Task added.\n");
}

// List tasks
void list_tasks() {
    printf("\nID\tName\t\tPriority\tStatus\n");
    for (int i=0;i<task_count;i++) {
        printf("%d\t%s\t\t%d\t\t%s\n",tasks[i].id,tasks[i].name,
               tasks[i].priority,tasks[i].completed?"Done":"Pending");
    }
}

// Mark task complete
void complete_task() {
    int id;
    printf("Enter task ID to mark complete: ");
    scanf("%d",&id); getchar();
    for (int i=0;i<task_count;i++) {
        if (tasks[i].id==id) {
            tasks[i].completed=1;
            printf("Task %d marked complete.\n",id);
            return;
        }
    }
    printf("Task not found.\n");
}

// Delete task
void delete_task() {
    int id;
    printf("Enter task ID to delete: ");
    scanf("%d",&id); getchar();
    for (int i=0;i<task_count;i++) {
        if (tasks[i].id==id) {
            for (int j=i;j<task_count-1;j++) tasks[j]=tasks[j+1];
            task_count--;
            printf("Task %d deleted.\n",id);
            return;
        }
    }
    printf("Task not found.\n");
}

// Sort tasks by priority
void sort_tasks() {
    for (int i=0;i<task_count-1;i++) {
        for (int j=i+1;j<task_count;j++) {
            if (tasks[i].priority>tasks[j].priority) {
                Task tmp=tasks[i]; tasks[i]=tasks[j]; tasks[j]=tmp;
            }
        }
    }
    printf("Tasks sorted by priority.\n");
}

int main() {
    char filename[]="tasks.txt";
    load_tasks(filename);

    int choice;
    while (1) {
        printf("\n--- Task Scheduler Menu ---\n");
        printf("1. Add Task\n");
        printf("2. List Tasks\n");
        printf("3. Complete Task\n");
        printf("4. Delete Task\n");
        printf("5. Sort Tasks by Priority\n");
        printf("6. Save & Exit\n");
        printf("Choice: ");
        scanf("%d",&choice); getchar();

        switch(choice) {
            case 1: add_task(); break;
            case 2: list_tasks(); break;
            case 3: complete_task(); break;
            case 4: delete_task(); break;
            case 5: sort_tasks(); break;
            case 6: save_tasks(filename); printf("Exiting.\n"); return 0;
            default: printf("Invalid choice.\n");
        }
    }
}