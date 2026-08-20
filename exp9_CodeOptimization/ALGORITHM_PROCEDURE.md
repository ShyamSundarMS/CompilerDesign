# Experiment 9

## Algorithm

1. Use FLEX to tokenize the input statements into identifiers, numbers and operators, passing them to BISON.
2. In BISON, define a grammar for assignment statements of the form `id = expr ;`
3. While reducing an `expr` production:
   - **Constant Folding**: if both operands are numeric constants, evaluate the operation immediately and replace it with the result.
   - **Algebraic Simplification**: apply rules such as `x + 0 -> x`, `x - 0 -> x`, `x * 1 -> x`, `x / 1 -> x`.
   - **Strength Reduction**: replace `x * 2` with `x + x`.
4. Print the optimized right-hand side once the statement is fully reduced.
5. Repeat for every statement until the input ends.

## Procedure

1. Create the FLEX file `PROGRAM.l` to tokenize identifiers, numbers, and the operators `+ - * / = ;`.
2. Create the BISON file `PROGRAM.y` with a grammar for assignment statements and expressions.
3. In the semantic actions for each `expr` rule, check whether constant folding, strength reduction, or algebraic simplification applies, and print a comment indicating which optimization fired.
4. Compile using:
   ```
   flex PROGRAM.l
   bison -d PROGRAM.y
   gcc lex.yy.c PROGRAM.tab.c -o optimize -lfl
   ```
5. Run `./optimize` and enter three-address-code-style statements ending with `;`, terminate input with Ctrl+D.
6. Verify that constants are folded, `x*1` / `x/1` / `x+0` / `x-0` are simplified, and `x*2` is converted to `x+x`.
7. Test with multiple statements to confirm all three optimization types are triggered correctly.
