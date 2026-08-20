# Experiment 6

# Program

## PROGRAM.l

```lex
%{
#include "PROGRAM.tab.h"
#include <stdlib.h>
%}
DIGIT [0-9]+
%option noyywrap
%%
{DIGIT}   { yylval = atof(yytext); return NUM; }
\n|.       { return yytext[0]; }
%%
```

## PROGRAM.y

```yacc
%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double
int yylex(void);
int yyerror(char *s);
%}
%token NUM
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
Statment: E { printf("Answer: %g \n", $$); }
    | Statment '\n'
    ;
E : E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | NUM
  ;
%%
int main() {
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}
int yyerror(char *s) {
    printf("%s\n", s);
    return 0;
}
```
