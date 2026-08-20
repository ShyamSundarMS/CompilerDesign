```
"art_expr.y" 33L, 372C written
[gomathy@rhel5 ~]$ flex art_expr.l
[gomathy@rhel5 ~]$ bison -d art_expr.y
[gomathy@rhel5 ~]$ gcc lex.yy.c art_expr.tab.c -o art_expr -lfl
[gomathy@rhel5 ~]$ ./art_expr
Enter the Expression
a+b*c-d/e
valid Expression
[gomathy@rhel5 ~]$ ./art_expr
Enter the Expression
a=b
Invalid Expression
[gomathy@rhel5 ~]$ _
```

## Result

Thus, the FLEX and BISON program to recognize a valid arithmetic expression was executed and verified successfully.
