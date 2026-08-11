# Experiment 2 — Implement a Lexical Analyzer using LEX Tool

## Aim
The goal is to create a program that reads a C source code file and identifies individual tokens such as identifiers, keywords, constants, operators, preprocessor directives, header files and delimiters, using FLEX and its built-in regular expression matching.

## Algorithm
1. Start by defining patterns (using regular expressions) for each type of token (keywords, identifiers, numbers, operators, delimiters, etc.).
2. Set up a FLEX (`.l`) file with three parts:
   - Definitions
   - Rules
   - C code (main function)
3. In the rules section, match each pattern with an action (e.g., print "Keyword" if a keyword is found).
4. Compile the FLEX program using the `flex` and `gcc` commands.
5. Run the compiled program and give it some C code as input. The program will scan the input and print out each token type.
6. Stop after all tokens are processed.

## Procedure
1. Create a file with `.l` extension, `lexer.l`, where you write the FLEX code.
2. Inside the file, define how to recognize tokens using regular expressions.
3. Use the `flex` command to convert your `.l` file into a C program (`lex.yy.c`).
4. Compile the generated C program using `gcc` to produce an executable.
5. Run the executable and give it input C code.
6. The output will show you which tokens were recognized (Keyword, Identifier, Number, Operator, Delimiter, etc.).

## Sample Input (iplex.c)
```c
#include<stdio.h>
void main()
{
int x; x = 10;
}
```

## Sample Output
```
Preprocessor Directive : #include
Header File: <stdio.h>
Keyword: void
Identifier: main
Delimiter: (
Delimiter: )
Delimiter: {
Keyword: int
Identifier: x
Delimiter: ;
Identifier: x
Operator: =
Number: 10
Delimiter: ;
Delimiter: }

End of file
```

## Result
Thus, the FLEX program for implementation of a Lexical Analyzer was executed and verified successfully.
