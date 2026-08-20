# Experiment 1

## Algorithm
1. Start the program by including the necessary headers within the FLEX definitions section (`%{ ... %}`).
2. Define regular expressions for:
   - Identifiers: `[a-zA-Z_][a-zA-Z0-9_]*`
   - Constants: `[0-9]+`
   - Comments: `//.*` and `/* ... */`
   - Operators: `+ - * / = < >`
3. Declare a symbol table array (structure with name and type fields) in the definitions section.
4. Write rules in the rules section of the FLEX (`.l`) file:
   - When an identifier is recognized, call `insert()` to add it to the symbol table if not already present.
   - Print or categorize constants, operators, and comments as they are matched.
5. Use `yylex()` actions to print matched tokens and perform symbol table insertion.
6. In `main()`, open the input file, call `yylex()`, then print the symbol table.
7. Compile the FLEX file using `flex` and `gcc`.
8. Execute the program with a sample C code input file. Stop.

## Procedure

1. Open a terminal and create a new FLEX file, `PROGRAM.l`.
2. In the definitions section, include headers and declare the symbol table array along with `insert()`/`lookup()` helper functions.
3. In the rules section, define patterns for identifiers, constants, comments, and operators. Use `{ printf(...) }` actions to print the recognized tokens and call `insert()` for identifiers.
4. Save and compile the file using:
   ```
   flex PROGRAM.l
   gcc lex.yy.c -o symtab -lfl
   ```
5. Run the executable:
   ```
   ./symtab input.c
   ```
6. Observe the output and verify the tokens and symbol table entries.
