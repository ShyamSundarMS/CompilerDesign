%{
#include <stdio.h>
#include "PROGRAM.tab.h"
%}
%%
[a-zA-Z][0-9a-zA-Z]*   { return ID; }
[0-9]+                 { return DIG; }
[ \t]+                 { ; }
\n                      { return 0; }
.                       { return yytext[0]; }
%%

int yywrap() { return 1; }
