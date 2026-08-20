# Experiment 5

# Program

## PROGRAM.l

```lex
%{
#include "PROGRAM.tab.h"
%}
%%
"if"        { return IF; }
"else"      { return ELSE; }
"for"       { return FOR; }
"while"     { return WHILE; }
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+                  { return NUM; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
":"         { return COLON; }
";"         { return SEMICOLON; }
"=="        { return EQ; }
"<="        { return LE; }
">="        { return GE; }
"<"         { return LT; }
">"         { return GT; }
"="         { return ASSIGN; }
[ \t\n]     { /* skip whitespace */ }
.           { return yytext[0]; }
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
%token IF ELSE FOR WHILE SWITCH CASE DEFAULT
%token ID NUM
%token LBRACE RBRACE LPAREN RPAREN COLON SEMICOLON
%token EQ LE GE LT GT ASSIGN
%%
program:
    stmt_list
    ;
stmt_list:
    stmt_list stmt
    | stmt
    ;
stmt:
    if_stmt
    | while_stmt
    | for_stmt
    | switch_stmt
    ;
if_stmt:
    IF LPAREN cond RPAREN stmt
    | IF LPAREN cond RPAREN stmt ELSE stmt
    ;
while_stmt:
    WHILE LPAREN cond RPAREN stmt
    ;
for_stmt:
    FOR LPAREN ID ASSIGN NUM SEMICOLON cond SEMICOLON ID ASSIGN ID RPAREN stmt
    ;
switch_stmt:
    SWITCH LPAREN ID RPAREN LBRACE case_list RBRACE
    ;
case_list:
    case_list CASE NUM COLON stmt
    | case_list DEFAULT COLON stmt
    | CASE NUM COLON stmt
    | DEFAULT COLON stmt
    ;
cond:
    ID relop NUM
    ;
relop:
    EQ | LE | GE | LT | GT
    ;
%%
int main() {
    printf("Enter a C control structure syntax:\n");
    yyparse();
    printf("Valid control structure syntax.\n");
    return 0;
}
int yyerror(char *s) {
    printf("Invalid control structure syntax.\n");
    return 0;
}
```
