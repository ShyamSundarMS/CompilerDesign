```
$ flex tac.l
$ bison -d tac.y
$ gcc tac.tab.c lex.yy.c -o tac -lfl
$ ./tac
Enter the expression:
a = b + c * d
t1 = c * d
t2 = b + t1
a = t2
```

## Result

Thus, the FLEX and BISON program to generate three-address code was executed and verified successfully.
