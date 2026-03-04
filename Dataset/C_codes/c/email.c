#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_USERS 10
#define MAX_EMAILS 100
#define MAX_LEN 256

typedef struct {
    char from[50];
    char to[50];
    char subject[100];
    char body[500];
} Email;

typedef struct {
    char username[50];
    Email inbox[MAX_EMAILS];
    int email_count;
} User;

User users[MAX_USERS];
int user_count = 0;

// Find user by name
User* find_user(const char *name) {
    for (int i=0;i<user_count;i++) {
        if (strcmp(users[i].username,name)==0) return &users[i];
    }
    return NULL;
}

// Register new user
void register_user() {
    if (user_count>=MAX_USERS) { printf("Max users reached!\n"); return; }
    char name[50];
    printf("Enter username: ");
    scanf("%s",name);
    if (find_user(name)) { printf("User already exists.\n"); return; }
    strcpy(users[user_count].username,name);
    users[user_count].email_count=0;
    user_count++;
    printf("User %s registered.\n",name);
}

// Compose email
void compose_email(const char *from) {
    char to[50], subject[100], body[500];
    printf("To: "); scanf("%s",to); getchar();
    printf("Subject: "); fgets(subject,100,stdin);
    subject[strcspn(subject,"\n")]=0;
    printf("Body: "); fgets(body,500,stdin);
    body[strcspn(body,"\n")]=0;

    User *recipient=find_user(to);
    if (!recipient) { printf("Recipient not found.\n"); return; }
    if (recipient->email_count>=MAX_EMAILS) { printf("Inbox full!\n"); return; }

    Email e;
    strcpy(e.from,from);
    strcpy(e.to,to);
    strcpy(e.subject,subject);
    strcpy(e.body,body);

    recipient->inbox[recipient->email_count++]=e;
    printf("Email sent to %s.\n",to);
}

// View inbox
void view_inbox(const char *user) {
    User *u=find_user(user);
    if (!u) { printf("User not found.\n"); return; }
    printf("\nInbox of %s:\n",user);
    for (int i=0;i<u->email_count;i++) {
        printf("%d. From: %s | Subject: %s\n",i+1,u->inbox[i].from,u->inbox[i].subject);
    }
}

// Read email
void read_email(const char *user) {
    User *u=find_user(user);
    if (!u) { printf("User not found.\n"); return; }
    int id;
    printf("Enter email number: ");
    scanf("%d",&id); getchar();
    if (id<1||id>u->email_count) { printf("Invalid ID.\n"); return; }
    Email e=u->inbox[id-1];
    printf("\n--- Email ---\n");
    printf("From: %s\nTo: %s\nSubject: %s\nBody:\n%s\n",e.from,e.to,e.subject,e.body);
}

// Delete email
void delete_email(const char *user) {
    User *u=find_user(user);
    if (!u) { printf("User not found.\n"); return; }
    int id;
    printf("Enter email number to delete: ");
    scanf("%d",&id); getchar();
    if (id<1||id>u->email_count) { printf("Invalid ID.\n"); return; }
    for (int i=id-1;i<u->email_count-1;i++) {
        u->inbox[i]=u->inbox[i+1];
    }
    u->email_count--;
    printf("Email deleted.\n");
}

int main() {
    char current[50];
    int choice;
    while (1) {
        printf("\n--- Email Client Menu ---\n");
        printf("1. Register User\n");
        printf("2. Login\n");
        printf("3. Exit\n");
        printf("Choice: ");
        scanf("%d",&choice); getchar();

        if (choice==1) register_user();
        else if (choice==2) {
            printf("Enter username: ");
            scanf("%s",current); getchar();
            if (!find_user(current)) { printf("User not found.\n"); continue; }
            int sub;
            while (1) {
                printf("\n--- User Menu (%s) ---\n",current);
                printf("1. Compose Email\n");
                printf("2. View Inbox\n");
                printf("3. Read Email\n");
                printf("4. Delete Email\n");
                printf("5. Logout\n");
                printf("Choice: ");
                scanf("%d",&sub); getchar();
                if (sub==1) compose_email(current);
                else if (sub==2) view_inbox(current);
                else if (sub==3) read_email(current);
                else if (sub==4) delete_email(current);
                else if (sub==5) break;
                else printf("Invalid choice.\n");
            }
        }
        else if (choice==3) { printf("Exiting.\n"); break; }
        else printf("Invalid choice.\n");
    }
    return 0;
}