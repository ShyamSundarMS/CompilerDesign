# Experiment 2

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

1. Create a file with `.l` extension, `PROGRAM.l`, where you write the FLEX code.
2. Inside the file, define how to recognize tokens using regular expressions.
3. Use the `flex` command to convert your `.l` file into a C program (`lex.yy.c`).
4. Compile the generated C program using `gcc` to produce an executable.
5. Run the executable and give it input C code.
6. The output will show you which tokens were recognized (Keyword, Identifier, Number, Operator, Delimiter, etc.).
