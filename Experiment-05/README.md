# Experiment 5 — Recognize Valid Control Structures of C (FLEX + BISON)

## Aim
To write a program to recognize a valid control structure syntax of C language (such as for loop, while loop, if-else, if-else-if, switch-case, etc.) using FLEX and BISON.

## Algorithm

### FLEX
1. Start the FLEX program with required header files and token declarations.
2. Define regular expressions for control keywords such as `if`, `else`, `for`, `while`, `switch`, `case`, etc.
3. Return appropriate tokens for each keyword to BISON.

### BISON
1. Include header files and token declarations.
2. Define grammar rules to match valid syntax for:
   - if statement
   - if-else and if-else-if ladder
   - while and for loops
   - switch-case structure
3. Implement `yyparse()` to start parsing and `yyerror()` for invalid inputs.

## Procedure
1. Write the `control.l` file using FLEX to tokenize control structure keywords.
2. Write the `control.y` file using BISON to define grammar rules for C control structures.
3. Compile and execute the program using:
   ```
   flex control.l
   bison -d control.y
   gcc lex.yy.c control.tab.c -o control -lfl
   ./control
   ```
4. Input sample control structures in C-style syntax to check for validation.

## Sample Output
```
Enter a C control structure syntax:
if (x < 5) { y = 10; }
Valid control structure syntax.
```

## Result
Thus the program to recognize a valid control structure syntax of C language (For loop, while loop, if-else, if-else-if, switch-case, etc.) using FLEX and BISON was executed and verified successfully.
