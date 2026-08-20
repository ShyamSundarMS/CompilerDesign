# Experiment 8

## Algorithm

1. Start the program.
2. Use FLEX to tokenize keywords (`int`, `float`), identifiers, numbers and operators, passing them to BISON.
3. In BISON, define grammar rules for declaration statements and assignment statements.
4. On a declaration (e.g. `int a;`), insert the variable name and its type into the symbol table.
5. On an assignment (e.g. `a = b + c;`), look up the types of the result variable and operands in the symbol table. If a variable used is not found in the symbol table, report it as undefined.
6. If all types match, print "No type mismatch"; otherwise print "Type mismatch".
7. End the program.

## Procedure

1. Create FLEX File (`PROGRAM.l`):
   - Define patterns for keywords (`int`, `float`), identifiers, numbers, and operators.
   - Return these tokens to BISON for further processing.
2. Create BISON File (`PROGRAM.y`):
   - Define grammar rules for declarations and expressions.
   - Maintain a symbol table (array of name/type pairs) that is filled in on each declaration.
   - On each assignment, verify that the operand types and result type match and print the outcome.
3. Compile the FLEX and BISON files:
   ```
   flex PROGRAM.l
   bison -d PROGRAM.y
   gcc lex.yy.c PROGRAM.tab.c -o typecheck -lfl
   ```
4. Run the program: `./typecheck`
5. Input variable declarations and expressions, ending each statement with `;`.
6. Observe output showing the type-checking result.
7. Test with various inputs:
   - Correctly typed expressions.
   - Mismatched types (e.g., `int a; float b; a = b + 1;`).
   - Undeclared variables.
8. End the program.
