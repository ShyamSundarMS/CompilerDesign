# Experiment 10 — Compiler Back-End: TAC to 8086 Assembly

## Aim
To write a program using FLEX and BISON to implement the back-end of a compiler which takes three-address code (TAC) as input and generates equivalent 8086 assembly language code.

## Algorithm
1. Use FLEX to tokenize each TAC line into identifiers and the operators `= + - * / ;`, passing tokens to BISON.
2. In BISON, define a grammar for assignment statements: `id = expr ;`
3. While reducing `expr`:
   - On the first operand, emit `MOV AX, operand`.
   - On `+`, emit `ADD AX, operand`; on `-`, emit `SUB AX, operand`.
   - On `*`, emit `MUL operand`; on `/`, emit `MOV DX,0` / `MOV BX,operand` / `DIV BX`.
4. When the full statement is reduced, emit `MOV result, AX`.
5. Repeat for every TAC statement in the input and print all generated instructions.
6. End.

## Procedure
1. Create the FLEX file `backend.l` to tokenize identifiers and operators from TAC lines.
2. Create the BISON file `backend.y` with a grammar for TAC assignment statements, embedding 8086 MOV/ADD/SUB/MUL/DIV instruction generation directly in the semantic actions.
3. Compile and run:
   ```
   flex backend.l
   bison -d backend.y
   gcc lex.yy.c backend.tab.c -o backend -lfl
   ./backend
   ```
4. Input TAC statements such as `t1 = a + b` followed by `x = t1`.
5. View the generated 8086 assembly code.

## Sample Input
```
t1 = a + b; t2 = t1 - c; t3 = t2 * d; t4 = t3 / e; x = t4;
```

## Sample Output
```
Enter TAC statements (end with Ctrl+D):
MOV AX, a
ADD AX, b
MOV t1, AX

MOV AX, t1
SUB AX, c
MOV t2, AX

MOV AX, t2
MUL d
MOV t3, AX

MOV AX, t3
MOV DX, 0
MOV BX, e
DIV BX
MOV t4, AX

MOV AX, t4
MOV x, AX
```

## Result
Thus, the back-end of the compiler was successfully implemented using FLEX and BISON to translate three-address code into equivalent 8086 assembly language code.
