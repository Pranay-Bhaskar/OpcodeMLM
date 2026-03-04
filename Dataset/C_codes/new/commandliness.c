#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ROWS 20
#define MAX_COLS 10
#define MAX_LEN  100

typedef struct {
    char value[MAX_LEN];
} Cell;

Cell sheet[MAX_ROWS][MAX_COLS];

// Print spreadsheet
void print_sheet() {
    printf("\n--- Spreadsheet ---\n");
    for (int r = 0; r < MAX_ROWS; r++) {
        for (int c = 0; c < MAX_COLS; c++) {
            if (strlen(sheet[r][c].value) > 0)
                printf("%s\t", sheet[r][c].value);
            else
                printf(".\t");
        }
        printf("\n");
    }
}

// Edit cell
void edit_cell(int row, int col, const char *val) {
    if (row < 0 || row >= MAX_ROWS || col < 0 || col >= MAX_COLS) {
        printf("Invalid cell!\n");
        return;
    }
    strncpy(sheet[row][col].value, val, MAX_LEN-1);
    sheet[row][col].value[MAX_LEN-1] = '\0';
}

// Evaluate simple formula (SUM row)
int eval_formula(const char *formula) {
    if (strncmp(formula,"SUM",3)==0) {
        int row;
        sscanf(formula,"SUM%d",&row);
        if (row<0 || row>=MAX_ROWS) return 0;
        int sum=0;
        for (int c=0;c<MAX_COLS;c++) {
            if (strlen(sheet[row][c].value)>0) {
                sum += atoi(sheet[row][c].value);
            }
        }
        return sum;
    }
    return atoi(formula);
}

// Save spreadsheet
void save_sheet(const char *filename) {
    FILE *fp = fopen(filename,"w");
    if (!fp) { perror("fopen"); return; }
    for (int r=0;r<MAX_ROWS;r++) {
        for (int c=0;c<MAX_COLS;c++) {
            fprintf(fp,"%s,",sheet[r][c].value);
        }
        fprintf(fp,"\n");
    }
    fclose(fp);
    printf("Saved to %s\n",filename);
}

// Load spreadsheet
void load_sheet(const char *filename) {
    FILE *fp = fopen(filename,"r");
    if (!fp) { perror("fopen"); return; }
    char buffer[MAX_LEN*MAX_COLS];
    int r=0;
    while (fgets(buffer,sizeof(buffer),fp) && r<MAX_ROWS) {
        char *token=strtok(buffer,",");
        int c=0;
        while (token && c<MAX_COLS) {
            strncpy(sheet[r][c].value,token,MAX_LEN-1);
            sheet[r][c].value[MAX_LEN-1]='\0';
            token=strtok(NULL,",");
            c++;
        }
        r++;
    }
    fclose(fp);
    printf("Loaded from %s\n",filename);
}

int main() {
    char cmd[MAX_LEN];
    while (1) {
        printf("\nCommands: print, edit r c val, eval formula, save file, load file, quit\n> ");
        if (!fgets(cmd,MAX_LEN,stdin)) break;
        cmd[strcspn(cmd,"\n")]=0;

        if (strcmp(cmd,"quit")==0) break;
        else if (strcmp(cmd,"print")==0) print_sheet();
        else if (strncmp(cmd,"edit",4)==0) {
            int r,c; char val[MAX_LEN];
            if (sscanf(cmd,"edit %d %d %s",&r,&c,val)==3) {
                edit_cell(r,c,val);
            } else printf("Usage: edit row col value\n");
        }
        else if (strncmp(cmd,"eval",4)==0) {
            char formula[MAX_LEN];
            if (sscanf(cmd,"eval %s",formula)==1) {
                int result=eval_formula(formula);
                printf("Result = %d\n",result);
            }
        }
        else if (strncmp(cmd,"save",4)==0) {
            char file[MAX_LEN];
            if (sscanf(cmd,"save %s",file)==1) save_sheet(file);
        }
        else if (strncmp(cmd,"load",4)==0) {
            char file[MAX_LEN];
            if (sscanf(cmd,"load %s",file)==1) load_sheet(file);
        }
        else printf("Unknown command.\n");
    }
    return 0;
}