# Experiment 3

# Program

## PROGRAM.l

```lex
%{
#include <stdio.h>
#include "PROGRAM.tab.h"
%}
%%
[a-zA-Z][0-9a-zA-Z]*   { return ID; }
[0-9]+                 { return DIG; }
[ \t]+                 { ; }
\n                      { return 0; }
.                       { return yytext[0]; }
%%

int yywrap() { return 1; }
```

## PROGRAM.y

```yacc
%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *s);
%}
%token ID DIG
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
stmt: expn ;
expn: expn '+' expn
    | expn '-' expn
    | expn '*' expn
    | expn '/' expn
    | '-' expn %prec UMINUS
    | '(' expn ')'
    | DIG
    | ID
    ;
%%
int main() {
    printf("Enter the Expression\n");
    yyparse();
    printf("valid Expression\n");
    return 0;
}
int yyerror(char *s) {
    printf("Invalid Expression\n");
    exit(0);
}
```
