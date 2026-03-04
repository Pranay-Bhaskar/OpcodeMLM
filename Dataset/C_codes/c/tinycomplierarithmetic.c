#include <stdio.h>
#include <ctype.h>

int expr(const char **s);

int number(const char **s) {
    int val=0;
    while (isdigit(**s)) {
        val = val*10 + (**s - '0');
        (*s)++;
    }
    return val;
}

int factor(const char **s) {
    if (**s=='(') {
        (*s)++;
        int val = expr(s);
        (*s)++;
        return val;
    }
    return number(s);
}

int term(const char **s) {
    int val = factor(s);
    while (**s=='*' || **s=='/') {
        char op = *(*s)++;
        int f = factor(s);
        if (op=='*') val *= f;
        else val /= f;
    }
    return val;
}

int expr(const char **s) {
    int val = term(s);
    while (**s=='+' || **s=='-') {
        char op = *(*s)++;
        int t = term(s);
        if (op=='+') val += t;
        else val -= t;
    }
    return val;
}

int main() {
    const char *input = "(2+3)*4-5";
    printf("Result: %d\n", expr(&input));
    return 0;
}