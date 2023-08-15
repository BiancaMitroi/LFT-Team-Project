%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"

    #define KRED  "\x1B[31m"
    #define KGRN  "\x1B[32m"
    #define KYEL  "\x1B[33m"
    #define KBLU  "\x1B[34m"
%}

%%
^square\  { return SQUARE; };
^triangle\  { return TRIANGLE; };
^rectangle\  { return RECTANGLE; };
\ filled\  {return FILLED; };
right {return RIGHT;}
\ red\  { /* Recognize the red color, this parameter will be send to functions */
    yylval.string_v = KRED; return COLOR;
    };
\ yellow\  { /* Recognize the yellow color, this parameter will be send to functions */
    yylval.string_v = KYEL; return COLOR;
    };
\ green\  { /* Recognize the green color, this parameter will be send to functions */
    yylval.string_v = KGRN; return COLOR;
    };
\ blue\  { /* Recognize the blue color, this parameter will be send to functions */
    yylval.string_v = KBLU; return COLOR;
    };
\ [0-9]+\  { /* Recognize the measures of the shape, this parameter will be send to functions */
    yylval.int_v = atoi(yytext); return SIZE;
    };
\ [A-Za-z]+\.txt\  { /* Recognize the drawing file path, this parameter will be send to functions */
    yylval.string_v = strdup(yytext); return FILE_PATH; 
    }
\n  { return COMMAND_END; }
. ;
%%

int yywrap() {
    return 1;
}