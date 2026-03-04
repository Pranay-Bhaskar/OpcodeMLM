#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define MAX_TOKENS 100

typedef enum { NUMBER, PLUS, MINUS, MUL, DIV, LPAREN, RPAREN, END } TokenType;

typedef struct {
    TokenType type;
    int value;
} Token;

Token tokens[MAX_TOKENS];
int pos = 0;

// Tokenizer
void tokenize(const char *expr) {
    int i = 0, t = 0;
    while (expr[i] != '\0') {
        if (isspace(expr[i])) { i++; continue; }
        if (isdigit(expr[i])) {
            int val = 0;
            while (isdigit(expr[i])) {
                val = val*10 + (expr[i]-'0');
                i++;
            }
            tokens[t].type = NUMBER;
            tokens[t].value = val;
            t++;
        } else {
            switch(expr[i]) {
                case '+': tokens[t].type=PLUS; break;
                case '-': tokens[t].type=MINUS; break;
                case '*': tokens[t].type=MUL; break;
                case '/': tokens[t].type=DIV; break;
                case '(': tokens[t].type=LPAREN; break;
                case ')': tokens[t].type=RPAREN; break;
                default: printf("Unknown char: %c\n", expr[i]); exit(1);
            }
            tokens[t].value=0; t++; i++;
        }
    }
    tokens[t].type = END;
}

// Parser (recursive descent)
int expr(); // forward declarations
int term();
int factor();

Token current() { return tokens[pos]; }
void consume(TokenType type) {
    if (current().type == type) pos++;
    else { printf("Unexpected token\n"); exit(1); }
}

int factor() {
    if (current().type == NUMBER) {
        int val = current().value;
        consume(NUMBER);
        return val;
    } else if (current().type == LPAREN) {
        consume(LPAREN);
        int val = expr();
        consume(RPAREN);
        return val;
    } else {
        printf("Unexpected factor\n");
        exit(1);
    }
}

int term() {
    int val = factor();
    while (current().type == MUL || current().type == DIV) {
        if (current().type == MUL) {
            consume(MUL);
            val *= factor();
        } else {
            consume(DIV);
            int denom = factor();
            if (denom == 0) { printf("Division by zero!\n"); exit(1); }
            val /= denom;
        }
    }
    return val;
}

int expr() {
    int val = term();
    while (current().type == PLUS || current().type == MINUS) {
        if (current().type == PLUS) {
            consume(PLUS);
            val += term();
        } else {
            consume(MINUS);
            val -= term();
        }
    }
    return val;
}

int main() {
    char input[256];
    printf("Enter arithmetic expression: ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input,"\n")] = 0;

    tokenize(input);
    pos = 0;
    int result = expr();
    printf("Result = %d\n", result);
    return 0;
}