```
$ flex symtab.l
$ gcc lex.yy.c -o symtab -lfl
$ cat input.c
int a = 10; // sum variable b = a + 5;
$ ./symtab input.c
Comment    : // sum variable Identifier : int
Identifier : a Constant  : 10 Operator  : = Identifier : b Identifier : a Operator  : +
Constant   : 5

SYMBOL TABLE
S.No    Name
int
a
b
```

## Result

Thus the FLEX program to develop a lexical analyzer recognizing identifiers, constants, comments and operators, and to build a symbol table, was executed and verified successfully.
