# Experiment 4 — Recognize a Valid Variable (FLEX + BISON)

## Aim
To write a program to recognize a valid variable which starts with a letter followed by any number of letters or digits using FLEX and BISON.

## Algorithm

### FLEX
1. Declare the required header file and variable declaration within `%{ ... %}`.
2. FLEX requires regular expressions/patterns to identify token of lexemes for recognizing a valid variable.
3. FLEX calls `yywrap()` after input is over. It should return 1 when work is done or 0 when more processing is required.

### BISON
1. Declare the required header file and variable declaration within `%{ ... %}`.
2. Define tokens in the first section and also define the associativity of the operations.
3. Mention the grammar productions and the action for each production.
4. `$$` refers to the top of the stack position while `$1` refers to the first value, `$2` for the second value in the stack.
5. Call `yyparse()` to initiate the parsing process.
6. `yyerror()` is called when none of the productions in the grammar match the input statement.

## Procedure
1. Create the FLEX file `valvar.l` using a text editor.
2. Define token patterns for letters and digits, and return them as `LET` and `DIG` tokens. Save and close the file.
3. Create the BISON file `valvar.y`.
4. Define grammar rules that recognize valid variable names (starting with a letter and followed by letters or digits). Save and close the BISON file.
5. Compile using:
   ```
   flex valvar.l
   bison -d valvar.y
   gcc lex.yy.c valvar.tab.c -o valvar -lfl
   ```
6. Run the program: `./valvar`
7. Enter test inputs like `abc1`, `var123`, `1abc` to test validation. Observe whether the variable is valid or invalid.

## Sample Output
```
Enter the variable:
add
Valid variable

Enter the variable:
add1
Valid variable

Enter the variable:
1add
Invalid variable
```

## Result
Thus the program to recognize a valid variable which starts with a letter followed by any number of letters or digits using FLEX and BISON was executed and verified successfully.
