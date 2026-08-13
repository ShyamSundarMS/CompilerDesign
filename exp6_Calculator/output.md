```
$ flex cal.l
$ bison -d cal.y
$ gcc lex.yy.c cal.tab.c -o calc -lfl
$ ./calc
Enter the expression:
2+2
Answer: 4
```
