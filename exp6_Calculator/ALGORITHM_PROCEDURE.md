# Experiment 6

## Algorithm

1. Start the program.
2. In the definitions part of the FLEX file, include the regular definition for a digit.
3. In the rules part of the FLEX file, specify the pattern for a number and its action (return `NUM` with the numeric value in `yylval`) in `PROGRAM.l`.
4. In the BISON program, define grammar rules so that all the arithmetic operations +, -, *, / are evaluated using operator precedence.
5. Display error if the input does not match the grammar.
6. Provide the input.
7. Verify the output.
8. End.

## Procedure

1. Create a file named `PROGRAM.l` and define patterns to identify numbers using regular expressions. For matched digits, return the token `NUM` and store the number using `yylval`.
2. Create another file named `PROGRAM.y` to define grammar rules for arithmetic expressions using BISON. Include operator precedence and associativity using `%left` and `%right`.
3. Add rules to evaluate expressions like `E + E`, `E - E`, `E * E`, and `E / E`.
4. Compile both files using:
   ```
   flex PROGRAM.l
   bison -d PROGRAM.y
   gcc lex.yy.c PROGRAM.tab.c -o calc -lfl
   ```
5. Run the compiled program: `./calc`
6. Enter arithmetic expressions and view the result.
7. Test with multiple expressions to verify both valid and invalid cases.
