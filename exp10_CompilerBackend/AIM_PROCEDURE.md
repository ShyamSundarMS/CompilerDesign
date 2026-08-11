# Experiment 10 — Compiler Back-End: TAC to 8086 Assembly

## Aim
To write a program using FLEX and BISON to implement the back-end of a compiler which takes three-address code (TAC) as input and generates equivalent 8086 assembly language code.

## Procedure
1. Use FLEX to tokenize each TAC line into identifiers and the operators `= + - * / ;`, passing tokens to BISON.
2. In BISON, define a grammar for assignment statements: `id = expr ;`
3. While reducing `expr`:
   - On the first operand, emit `MOV AX, operand`.
   - On `+`, emit `ADD AX, operand`; on `-`, emit `SUB AX, operand`.
   - On `*`, emit `MUL operand`; on `/`, emit `MOV DX,0` / `MOV BX,operand` / `DIV BX`.
4. When the full statement is reduced, emit `MOV result, AX`.
5. Repeat for every TAC statement in the input and print all generated instructions.
6. End.

Detailed steps:
1. Create the FLEX file `PROGRAM.l` to tokenize identifiers and operators from TAC lines.
2. Create the BISON file `PROGRAM.y` with a grammar for TAC assignment statements, embedding 8086 MOV/ADD/SUB/MUL/DIV instruction generation directly in the semantic actions.
3. Compile and run:
   ```
   flex PROGRAM.l
   bison -d PROGRAM.y
   gcc lex.yy.c PROGRAM.tab.c -o backend -lfl
   ./backend
   ```
4. Input TAC statements such as `t1 = a + b` followed by `x = t1`.
5. View the generated 8086 assembly code.
