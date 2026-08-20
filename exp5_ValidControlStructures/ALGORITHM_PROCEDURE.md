# Experiment 5

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

1. Write the `PROGRAM.l` file using FLEX to tokenize control structure keywords.
2. Write the `PROGRAM.y` file using BISON to define grammar rules for C control structures.
3. Compile and execute the program using:
   ```
   flex PROGRAM.l
   bison -d PROGRAM.y
   gcc lex.yy.c PROGRAM.tab.c -o control -lfl
   ./control
   ```
4. Input sample control structures in C-style syntax to check for validation.
