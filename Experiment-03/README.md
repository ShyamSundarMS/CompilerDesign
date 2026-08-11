# Experiment 3 — Recognize a Valid Arithmetic Expression (FLEX + BISON)

## Aim
To write a program to recognize a valid arithmetic expression that uses operators +, -, * and / using FLEX and BISON.

## Algorithm

### FLEX
1. Declare the required header file and variable declarations within `%{ ... %}`.
2. FLEX requires regular expressions to identify valid arithmetic expression tokens (lexemes).
3. FLEX calls `yywrap()` after input is over. It should return 1 when work is done, or 0 when more processing is required.

### BISON
1. Declare the required header file and variable declarations within `%{ ... %}`.
2. Define tokens in the first section and also define the associativity of the operations.
3. Mention the grammar productions and the action for each production.
4. `$$` refers to the top of the stack position while `$1`, `$2` refer to respective values in the stack.
5. Call `yyparse()` to initiate the parsing process.
6. `yyerror()` is called when no productions in the grammar match the input statement.

## Procedure
1. Open a text editor and write the FLEX source file `art_expr.l`.
2. Define regular expressions for identifiers, digits, operators, and ignore whitespace. Save and close the FLEX file.
3. Open another text file and write the BISON source file `art_expr.y`.
4. Define tokens and grammar rules to parse arithmetic expressions using +, -, *, and /. Save and close the BISON file.
5. Compile and run:
   ```
   flex art_expr.l
   bison -d art_expr.y
   gcc lex.yy.c art_expr.tab.c -o art_expr -lfl
   ./art_expr
   ```
6. Enter expressions as input. If the expression is valid, it displays "valid Expression", otherwise "Invalid Expression".

## Sample Output
```
Enter the Expression
a+b*c-d/e
valid Expression

Enter the Expression
a=b
Invalid Expression
```

## Result
Thus the program to recognize a valid arithmetic expression that uses operator +, -, * and / using FLEX and BISON was executed and verified successfully.
