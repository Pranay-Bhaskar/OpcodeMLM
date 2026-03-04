#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_TOKENS 100
#define MAX_VARS   50

typedef enum { NUMBER, IDENT, ASSIGN, PLUS, MINUS, MUL, DIV, SEMI, END } TokenType;

typedef struct {
    TokenType type;
    char text[50];
    int value;
} Token;

typedef struct {
    char name[50];
    int value;
} Variable;

Token tokens[MAX_TOKENS];
int pos=0;
Variable vars[MAX_VARS];
int var_count=0;

// Tokenizer
void tokenize(const char *src) {
    int i=0,t=0;
    while(src[i]) {
        if (isspace(src[i])) { i++; continue; }
        if (isdigit(src[i])) {
            int val=0; while(isdigit(src[i])) { val=val*10+(src[i]-'0'); i++; }
            tokens[t].type=NUMBER; tokens[t].value=val; t++;
        } else if (isalpha(src[i])) {
            char buf[50]; int j=0;
            while(isalnum(src[i])) buf[j++]=src[i++];
            buf[j]=0;
            tokens[t].type=IDENT; strcpy(tokens[t].text,buf); t++;
        } else {
            switch(src[i]) {
                case '=': tokens[t].type=ASSIGN; break;
                case '+': tokens[t].type=PLUS; break;
                case '-': tokens[t].type=MINUS; break;
                case '*': tokens[t].type=MUL; break;
                case '/': tokens[t].type=DIV; break;
                case ';': tokens[t].type=SEMI; break;
                default: printf("Unknown char %c\n",src[i]); exit(1);
            }
            tokens[t].text[0]=src[i]; tokens[t].text[1]=0; t++; i++;
        }
    }
    tokens[t].type=END;
}

// Symbol table
Variable* lookup(const char *name) {
    for(int i=0;i<var_count;i++) if(strcmp(vars[i].name,name)==0) return &vars[i];
    return NULL;
}
Variable* add_var(const char *name) {
    strcpy(vars[var_count].name,name);
    vars[var_count].value=0;
    return &vars[var_count++];
}

// Parser
Token current(){ return tokens[pos]; }
void consume(TokenType type){ if(current().type==type) pos++; else {printf("Unexpected token\n"); exit(1);} }

int factor(){
    if(current().type==NUMBER){ int v=current().value; consume(NUMBER); return v;}
    else if(current().type==IDENT){ Variable* v=lookup(current().text); if(!v){printf("Undefined var %s\n",current().text); exit(1);} consume(IDENT); return v->value;}
    else {printf("Unexpected factor\n"); exit(1);}
}
int term(){
    int val=factor();
    while(current().type==MUL||current().type==DIV){
        if(current().type==MUL){ consume(MUL); val*=factor();}
        else { consume(DIV); int d=factor(); if(d==0){printf("Div by zero\n"); exit(1);} val/=d;}
    }
    return val;
}
int expr(){
    int val=term();
    while(current().type==PLUS||current().type==MINUS){
        if(current().type==PLUS){ consume(PLUS); val+=term();}
        else { consume(MINUS); val-=term();}
    }
    return val;
}
void statement(){
    if(current().type==IDENT){
        char name[50]; strcpy(name,current().text); consume(IDENT);
        consume(ASSIGN);
        int val=expr();
        consume(SEMI);
        Variable* v=lookup(name); if(!v) v=add_var(name);
        v->value=val;
        printf("%s = %d\n",name,val);
    } else { printf("Invalid statement\n"); exit(1);}
}

int main(){
    char input[256];
    printf("Enter program (end with ;):\n");
    fgets(input,sizeof(input),stdin);
    tokenize(input);
    pos=0;
    while(current().type!=END) statement();
    return 0;
}