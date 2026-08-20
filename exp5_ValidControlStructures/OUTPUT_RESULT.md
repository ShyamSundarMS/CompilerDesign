```
$ flex control.l
$ bison -d control.y
$ gcc lex.yy.c control.tab.c -o control -lfl
$ ./control
Enter a C control structure syntax:
if (x < 5) { y = 10; }
Valid control structure syntax.
```

## Result

Thus, the FLEX and BISON program to recognize valid C control structures was executed and verified successfully.
