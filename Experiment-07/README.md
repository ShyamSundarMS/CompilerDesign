# Experiment 7 — Generate Three Address Code using LEX and YACC

## Aim
To write a program using FLEX and BISON to generate three-address code (TAC) for a simple arithmetic expression.

## Algorithm

### FLEX
1. Include required headers and define tokens for identifiers, numbers, and operators.
2. Use regular expressions to identify identifiers and numeric constants.
3. Return appropriate tokens to BISON for parsing.

### BISON
1. Declare tokens and define associativity for operators.
2. Use grammar rules to parse arithmetic expressions (e.g., `a = b + c * d`).
3. Generate three-address code during the parsing actions.
4. Maintain a temporary variable counter to represent intermediate results (e.g., `t1 = b * d`).

## Procedure
1. Create the FLEX file `tac.l`:
   - Tokenize input using patterns for identifiers, numbers, and operators.
   - Pass tokens to BISON.
2. Create the BISON file `tac.y`:
   - Parse arithmetic expressions.
   - Generate three-address code using temporary variables (t1, t2, etc.) during parsing.
3. Compile and run:
   ```
   flex tac.l
   bison -d tac.y
   gcc tac.tab.c lex.yy.c -o tac -lfl
   ./tac
   ```
4. Input an arithmetic expression like:
   ```
   a = b + c * d
   ```
5. View generated three-address code.

## Sample Output
```
Enter the expression:
a = b + c * d
t1 = c * d
t2 = b + t1
a = t2
```

## Result
Thus, the program to generate three-address code using FLEX and BISON was executed and verified successfully.
