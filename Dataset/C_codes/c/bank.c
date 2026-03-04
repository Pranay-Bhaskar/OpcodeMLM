#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ACC 50

typedef struct {
    int id;
    char name[50];
    float balance;
} Account;

Account accs[MAX_ACC];
int count=0;

// Save accounts to file
void save(const char* file){
    FILE* fp=fopen(file,"w");
    if(!fp){ perror("fopen"); return; }
    for(int i=0;i<count;i++){
        fprintf(fp,"%d,%s,%.2f\n",accs[i].id,accs[i].name,accs[i].balance);
    }
    fclose(fp);
    printf("Accounts saved.\n");
}

// Load accounts from file
void load(const char* file){
    FILE* fp=fopen(file,"r");
    if(!fp) return;
    count=0;
    while(fscanf(fp,"%d,%49[^,],%f\n",&accs[count].id,accs[count].name,&accs[count].balance)==3){
        count++;
    }
    fclose(fp);
    printf("Accounts loaded.\n");
}

// Create account
void create(){
    if(count>=MAX_ACC){ printf("Max accounts reached!\n"); return; }
    Account a;
    a.id=count+1;
    printf("Enter name: "); scanf("%s",a.name);
    printf("Enter initial balance: "); scanf("%f",&a.balance);
    accs[count++]=a;
    printf("Account created with ID %d.\n",a.id);
}

// List accounts
void list(){
    printf("\nID\tName\tBalance\n");
    for(int i=0;i<count;i++){
        printf("%d\t%s\t%.2f\n",accs[i].id,accs[i].name,accs[i].balance);
    }
}

// Deposit
void deposit(){
    int id; float amt;
    printf("Enter account ID: "); scanf("%d",&id);
    printf("Enter amount: "); scanf("%f",&amt);
    if(id<=0||id>count){ printf("Invalid ID.\n"); return; }
    accs[id-1].balance+=amt;
    printf("Deposited %.2f to %s.\n",amt,accs[id-1].name);
}

// Withdraw
void withdraw(){
    int id; float amt;
    printf("Enter account ID: "); scanf("%d",&id);
    printf("Enter amount: "); scanf("%f",&amt);
    if(id<=0||id>count){ printf("Invalid ID.\n"); return; }
    if(accs[id-1].balance>=amt){
        accs[id-1].balance-=amt;
        printf("Withdrew %.2f from %s.\n",amt,accs[id-1].name);
    } else printf("Insufficient funds.\n");
}

// Transfer
void transfer(){
    int f,t; float amt;
    printf("From ID: "); scanf("%d",&f);
    printf("To ID: "); scanf("%d",&t);
    printf("Amount: "); scanf("%f",&amt);
    if(f<=0||f>count||t<=0||t>count){ printf("Invalid IDs.\n"); return; }
    if(accs[f-1].balance>=amt){
        accs[f-1].balance-=amt;
        accs[t-1].balance+=amt;
        printf("Transferred %.2f from %s to %s.\n",amt,accs[f-1].name,accs[t-1].name);
    } else printf("Insufficient funds.\n");
}

int main(){
    char file[]="accounts.txt";
    load(file);

    int choice;
    while(1){
        printf("\n--- Banking Menu ---\n");
        printf("1. Create Account\n");
        printf("2. List Accounts\n");
        printf("3. Deposit\n");
        printf("4. Withdraw\n");
        printf("5. Transfer\n");
        printf("6. Save & Exit\n");
        printf("Choice: ");
        scanf("%d",&choice);

        switch(choice){
            case 1: create(); break;
            case 2: list(); break;
            case 3: deposit(); break;
            case 4: withdraw(); break;
            case 5: transfer(); break;
            case 6: save(file); printf("Exiting.\n"); return 0;
            default: printf("Invalid choice.\n");
        }
    }
}