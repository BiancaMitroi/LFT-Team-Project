%{

    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"

    /*

    Functions convention:

    t - triangle
    s - square
    r - rectangle
    rt - right triangle
    
    cN - no color specified
    fN - unfilled shape
    sN - no size specified
    pN - no path file specified

    */

    /* Triangle functions */
    void t_cN_fN_sN_pN(); // command: triangle
    void t_cY_fN_sN_pN(char* c); // command: triangle red
    void t_cN_fY_sN_pN(); // command: triangle filled
    void t_cY_fY_sN_pN(char* c); // command: triangle red filled
    void t_cN_fN_sY_pN(int s); // command: triangle 6
    void t_cY_fN_sY_pN(char* c, int s); // command: triangle red 6
    void t_cN_fY_sY_pN(int s); // command: triangle filled 6
    void t_cY_fY_sY_pN(char* c, int s); // command: triangle red filled 6
    void t_cN_fN_sN_pY(char* p); // command: triangle myfile.txt
    void t_cN_fY_sN_pY(char* p); // command: triangle filled myfile.txt
    void t_cN_fN_sY_pY(int s, char* p); // command: triangle 6 myfile.txt
    void t_cN_fY_sY_pY(int s, char* p); // command: triangle filled 6 myfile.txt

    /* Square functions */
    void s_cN_fN_sN_pN(); // command: square
    void s_cY_fN_sN_pN(char* c); // command: square red
    void s_cN_fY_sN_pN(); // command: square filled
    void s_cY_fY_sN_pN(char* c); // command: square red filled
    void s_cN_fN_sY_pN(int s); // command: square 6
    void s_cY_fN_sY_pN(char* c, int s); // command: square red 6
    void s_cN_fY_sY_pN(int s); // command: square filled 6
    void s_cY_fY_sY_pN(char* c, int s); // command: square red filled 6
    void s_cN_fN_sN_pY(char* p); // command: square myfile.txt
    void s_cN_fY_sN_pY(char* p); // command: square filled myfile.txt
    void s_cN_fN_sY_pY(int s, char* p); // command: square 6 myfile.txt
    void s_cN_fY_sY_pY(int s, char* p); // command: square filled 6 myfile.txt

    /* Rectangle functions */
    void r_cN_fN_sN_pN(); // command: rectangle
    void r_cY_fN_sN_pN(char* c); // command: rectangle red
    void r_cN_fY_sN_pN(); // command: rectangle filled
    void r_cY_fY_sN_pN(char* c); // command: rectangle red filled
    void r_cN_fN_sY_pN(int a, int b); // command: rectangle 6 10
    void r_cY_fN_sY_pN(char* c, int a, int b); // command: rectangle red 6 10
    void r_cN_fY_sY_pN(int a, int b); // command: rectangle filled 6 10
    void r_cY_fY_sY_pN(char* c, int a, int b); // command: rectangle red filled 6 10
    void r_cN_fN_sN_pY(char* p); // command: rectangle myfile.txt
    void r_cN_fY_sN_pY(char* p); // command: rectangle filled myfile.txt
    void r_cN_fN_sY_pY(int a, int b, char* p); // command: rectangle 6 10 myfile.txt
    void r_cN_fY_sY_pY(int a, int b, char* p); // command: rectangle filled 6 10 myfile.txt

    /*Right triangle functions*/
    void rt_cN_fN_sN_pN(); // command: right
    void rt_cY_fN_sN_pN(char* c); // command: right red
    void rt_cN_fY_sN_pN(); // command: right filled
    void rt_cY_fY_sN_pN(char* c); // command: right red filled
    void rt_cN_fN_sY_pN(int s); // command: right 6 10
    void rt_cY_fN_sY_pN(char* c, int s); // command: right red 6 10
    void rt_cN_fY_sY_pN(int s); // command: right filled 6 10
    void rt_cY_fY_sY_pN(char* c, int s); // command: right red filled 6 10
    void rt_cN_fN_sN_pY(char* p); // command: right myfile.txt
    void rt_cN_fY_sN_pY(char* p); // command: right filled myfile.txt
    void rt_cN_fN_sY_pY(int s, char* p); // command: right 6 10 myfile.txt
    void rt_cN_fY_sY_pY(int s, char* p); // command: right filled 6 10 myfile.txt

    int yyparse();
    int yylex();
    int yyerror(const char *s);
    
%}

%union
{
    int int_v;
    char* string_v;
}

%token TRIANGLE SQUARE RECTANGLE COLOR SIZE FILE_PATH FILLED RIGHT COMMAND_END

%%
// Commands:
S : TRIANGLE COMMAND_END {t_cN_fN_sN_pN(); exit(0);} |
    TRIANGLE COLOR {t_cY_fN_sN_pN((char*) $<string_v>2); exit(0);} |
    TRIANGLE FILLED {t_cN_fY_sN_pN(); exit(0);} |
    TRIANGLE COLOR FILLED {t_cY_fY_sN_pN((char*) $<string_v>3); exit(0);} |
    TRIANGLE SIZE {t_cN_fN_sY_pN((int) $<int_v>2); exit(0);} |
    TRIANGLE COLOR SIZE {t_cY_fN_sY_pN((char*) $<string_v>2, (int) $<int_v>3); exit(0);} |
    TRIANGLE FILLED SIZE {t_cN_fY_sY_pN((int) $<int_v>3); exit(0);} |
    TRIANGLE COLOR FILLED SIZE {t_cY_fY_sY_pN((char*) $<string_v>2, (int) $<int_v>4); exit(0);} |
    TRIANGLE FILE_PATH {t_cN_fN_sN_pY((char*) $<string_v>2); exit(0);} |
    TRIANGLE FILLED FILE_PATH {t_cN_fY_sN_pY((char*) $<string_v>3); exit(0);} |
    TRIANGLE SIZE FILE_PATH {t_cN_fN_sY_pY((int) $<int_v>2, (char*) $<string_v>3); exit(0);} |
    TRIANGLE FILLED SIZE FILE_PATH {t_cN_fY_sY_pY((int) $<int_v>3, (char*) $<string_v>4); exit(0);} | 

    RIGHT COMMAND_END {rt_cN_fN_sN_pN(); exit(0);} |
    RIGHT COLOR {rt_cY_fN_sN_pN((char*) $<string_v>2); exit(0);} |
    RIGHT FILLED {rt_cN_fY_sN_pN(); exit(0);} |
    RIGHT COLOR FILLED {rt_cY_fY_sN_pN((char*) $<string_v>2); exit(0);} |
    RIGHT SIZE {rt_cN_fN_sY_pN((int) $<int_v>2); exit(0);} |
    RIGHT COLOR SIZE {rt_cY_fN_sY_pN((char*) $<string_v>2, (int) $<int_v>3); exit(0);} |
    RIGHT FILLED SIZE {rt_cN_fY_sY_pN((int) $<int_v>3); exit(0);} |
    RIGHT COLOR FILLED SIZE {rt_cY_fY_sY_pN((char*) $<string_v>2, (int) $<int_v>4); exit(0);} |
    RIGHT FILE_PATH {rt_cN_fN_sN_pY((char*) $<string_v>2); exit(0);} |
    RIGHT FILLED FILE_PATH {rt_cN_fY_sN_pY((char*) $<string_v>3); exit(0);} |
    RIGHT SIZE FILE_PATH {rt_cN_fN_sY_pY((int) $<int_v>2, (char*) $<string_v>3); exit(0);} |
    RIGHT FILLED SIZE FILE_PATH {rt_cN_fY_sY_pY((int) $<int_v>3, (char*) $<string_v>4); exit(0);} | 

    SQUARE COMMAND_END {s_cN_fN_sN_pN(); exit(0);} |
    SQUARE COLOR {s_cY_fN_sN_pN((char*) $<string_v>2); exit(0);} |
    SQUARE FILLED {s_cN_fY_sN_pN(); exit(0);} |
    SQUARE COLOR FILLED {s_cY_fY_sN_pN((char*) $<string_v>3); exit(0);} |
    SQUARE SIZE {s_cN_fN_sY_pN((int) $<int_v>2); exit(0);} |
    SQUARE COLOR SIZE {s_cY_fN_sY_pN((char*) $<string_v>2, (int) $<int_v>3); exit(0);} |
    SQUARE FILLED SIZE {s_cN_fY_sY_pN((int) $<int_v>3); exit(0);} |
    SQUARE COLOR FILLED SIZE {s_cY_fY_sY_pN((char*) $<string_v>2, (int) $<int_v>4); exit(0);} |
    SQUARE FILE_PATH {s_cN_fN_sN_pY((char*) $<string_v>2); exit(0);} |
    SQUARE FILLED FILE_PATH {s_cN_fY_sN_pY((char*) $<string_v>3); exit(0);} |
    SQUARE SIZE FILE_PATH {s_cN_fN_sY_pY((int) $<int_v>2, (char*) $<string_v>3); exit(0);} |
    SQUARE FILLED SIZE FILE_PATH {s_cN_fY_sY_pY((int) $<int_v>3, (char*) $<string_v>4); exit(0);} | 

    RECTANGLE COMMAND_END {r_cN_fN_sN_pN(); exit(0);} |
    RECTANGLE COLOR {r_cY_fN_sN_pN((char*) $<string_v>2); exit(0);} |
    RECTANGLE FILLED {r_cN_fY_sN_pN(); exit(0);} |
    RECTANGLE COLOR FILLED {r_cY_fY_sN_pN((char*) $<string_v>3); exit(0);} |
    RECTANGLE SIZE SIZE {r_cN_fN_sY_pN((int) $<int_v>2, (int) $<int_v>3); exit(0);} |
    RECTANGLE COLOR SIZE SIZE {r_cY_fN_sY_pN((char*) $<string_v>2, (int) $<int_v>3, (int) $<int_v>4); exit(0);} |
    RECTANGLE FILLED SIZE SIZE {r_cN_fY_sY_pN((int) $<int_v>3, (int) $<int_v>4); exit(0);} |
    RECTANGLE COLOR FILLED SIZE SIZE {r_cY_fY_sY_pN((char*) $<string_v>2, (int) $<int_v>4, (int) $<int_v>5); exit(0);} |
    RECTANGLE FILE_PATH {r_cN_fN_sN_pY((char*) $<string_v>2); exit(0);} |
    RECTANGLE FILLED FILE_PATH {r_cN_fY_sN_pY((char*) $<string_v>3); exit(0);} |
    RECTANGLE SIZE SIZE FILE_PATH {r_cN_fN_sY_pY((int) $<int_v>2, (int) $<int_v>3, (char*) $<string_v>4); exit(0);} |
    RECTANGLE FILLED SIZE SIZE FILE_PATH {r_cN_fY_sY_pY((int) $<int_v>3, (int) $<int_v>4, (char*) $<string_v>5); exit(0);} | 

%%

    /* Triangle functions */
    void t_cN_fN_sN_pN() // command: triangle
    {
        int i, j, k;
        int space = 10 - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*10; i=i+2) {
            for (k = 1; k <= space; k++) {
                printf(" "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                if(j == 1 || j == i || space == 0)
                    printf("*"); // Print asterisks
                else
                    printf(" ");
            }
            
            space--;
            printf("\n");
        }
    }
    void t_cY_fN_sN_pN(char* c) // command: triangle red
    {
        printf("%s", c);
        t_cN_fN_sN_pN();
        printf("\033[0m");
    }
    void t_cN_fY_sN_pN() // command: triangle filled
    {
        int i, j, k;
        int space = 10 - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*10; i=i+2) {
            for (k = 1; k <= space; k++) {
                printf(" "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                    printf("*"); // Print asterisks
            }
            
            space--;
            printf("\n");
        }
    }
    void t_cY_fY_sN_pN(char* c) // command: triangle red filled
    {
        printf("%s", c);
        t_cN_fY_sN_pN();
        printf("\033[0m");
    }
    void t_cN_fN_sY_pN(int s) // command: triangle 6
    {
        int i, j, k;
        int space = s - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*s; i=i+2) {
            for (k = 1; k <= space; k++) {
                printf(" "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                if(j == 1 || j == i || space == 0)
                    printf("*"); // Print asterisks
                else
                    printf(" ");
            }
            
            space--;
            printf("\n");
        }
    }
    void t_cY_fN_sY_pN(char* c, int s) // command: triangle red 6
    {
        printf("%s", c);
        t_cN_fN_sY_pN(s);
        printf("\033[0m");
    }
    void t_cN_fY_sY_pN(int s) // command: triangle filled 6
    {
        int i, j, k;
        int space = s - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*s; i=i+2) {
            for (k = 1; k <= space; k++) {
                printf(" "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                    printf("*"); // Print asterisks
            }
            
            space--;
            printf("\n");
        }
    }
    void t_cY_fY_sY_pN(char* c, int s) // command: triangle red filled 6
    {
        printf("%s", c);
        t_cN_fY_sY_pN(s);
        printf("\033[0m");
    }
    void t_cN_fN_sN_pY(char* p) // command: triangle myfile.txt
    {
        FILE* f = fopen(p, "w+");
        int i, j, k;
        int space = 10 - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*10; i=i+2) {
            for (k = 1; k <= space; k++) {
                fprintf(f, " "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                if(j == 1 || j == i || space == 0)
                    fprintf(f, "*"); // Print asterisks
                else
                    fprintf(f, " ");
            }
            
            space--;
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void t_cN_fY_sN_pY(char* p) // command: triangle filled myfile.txt
    {
        FILE* f = fopen(p, "w+");
        int i, j, k;
        int space = 10 - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*10; i=i+2) {
            for (k = 1; k <= space; k++) {
                fprintf(f, " "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                fprintf(f, "*"); // Print asterisks
            }
            
            space--;
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void t_cN_fN_sY_pY(int s, char* p) // command: triangle 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        int i, j, k;
        int space = s - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*s; i=i+2) {
            for (k = 1; k <= space; k++) {
                fprintf(f, " "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                if(j == 1 || j == i || space == 0)
                    fprintf(f, "*"); // Print asterisks
                else
                    fprintf(f, " ");
            }
            
            space--;
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void t_cN_fY_sY_pY(int s, char* p) // command: triangle filled 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        int i, j, k;
        int space = s - 1; // Start with maximum number of spaces

        for (i = 1; i <= 2*s; i=i+2) {
            for (k = 1; k <= space; k++) {
                fprintf(f, " "); // Print spaces
            }

            for (j = 1; j <= i; j++) {
                    fprintf(f, "*"); // Print asterisks
            }
            
            space--;
            fprintf(f, "\n");
        }
        fclose(f);
    }

    /* Square functions */
    void s_cN_fN_sN_pN() // command: square
    {
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","*                 *\n");
        printf( "%s","* * * * * * * * * *\n");
    }
    void s_cY_fN_sN_pN(char* c) // command: square red
    {
        printf("%s", c);
        s_cN_fN_sN_pN();
        printf("\033[0m");
    }
    void s_cN_fY_sN_pN() // command: square filled
    {
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
        printf( "%s","* * * * * * * * * *\n");
    }
    void s_cY_fY_sN_pN(char* c) // command: square red filled
    {
        printf("%s", c);
        s_cN_fY_sN_pN();
        printf("\033[0m");
    }
    void s_cN_fN_sY_pN(int s) // command: square 6
    {
        for(int i = 0; i < s - 1; i++)
            printf("%s", "* ");
        printf("%s", "*\n");
        for(int i = 1; i < s - 1; i++){
            printf("%c", '*');
            for(int j = 1; j < s - 1; j++)
                printf("%s", "  ");
            printf("%s", " *\n");
        }

        for(int i = 0; i < s - 1; i++)
            printf("%s", "* ");
        printf("%s", "*\n");
    }
    void s_cY_fN_sY_pN(char* c, int s) // command: square red 6
    {
        printf("%s", c);
        s_cN_fN_sY_pN(s);
        printf("\033[0m");
    }
    void s_cN_fY_sY_pN(int s) // command: square filled 6
    {
        for(int i = 0; i < s - 1; i++)
            printf("%s", "* ");
        printf("%s", "*\n");
        for(int i = 1; i < s - 1; i++){
            printf("%c", '*');
            for(int j = 1; j < s - 1; j++)
                printf("%s", " *");
            printf("%s", " *\n");
        }

        for(int i = 0; i < s - 1; i++)
            printf("%s", "* ");
        printf("%s", "*\n");
    }
    void s_cY_fY_sY_pN(char* c, int s) // command: square red filled 6
    {
        printf("%s", c);
        s_cN_fY_sY_pN(s);
        printf("\033[0m");
    }
    void s_cN_fN_sN_pY(char* p) // command: square myfile.txt
    {
        FILE* f = fopen(p, "w+");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "*                 *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fclose(f);
    }
    void s_cN_fY_sN_pY(char* p) // command: square filled myfile.txt
    {
        FILE* f = fopen(p, "w+");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fprintf(f, "%s", "* * * * * * * * * *\n");
        fclose(f);
    }
    void s_cN_fN_sY_pY(int s, char* p) // command: square 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for(int i = 0; i < s - 1; i++)
            fprintf(f, "%s", "* ");
        fprintf(f, "%s", "*\n");
        for(int i = 1; i < s - 1; i++){
            fprintf(f, "%c", '*');
            for(int j = 1; j < s - 1; j++)
                fprintf(f, "%s", "  ");
            fprintf(f, "%s", " *\n");
        }

        for(int i = 0; i < s - 1; i++)
            fprintf(f, "%s", "* ");
        fprintf(f, "%s", "*\n");
        fclose(f);
    }
    void s_cN_fY_sY_pY(int s, char* p) // command: square filled 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for(int i = 0; i < s - 1; i++)
            fprintf(f, "%s", "* ");
        fprintf(f, "%s", "*\n");
        for(int i = 1; i < s - 1; i++){
            fprintf(f, "%c", '*');
            for(int j = 1; j < s - 1; j++)
                fprintf(f, "%s", " *");
            fprintf(f, "%s", " *\n");
        }

        for(int i = 0; i < s - 1; i++)
            fprintf(f, "%s", "* ");
        fprintf(f, "%s", "*\n");
        fclose(f);
    }

    /* Rectangle functions */
    void r_cN_fN_sN_pN() // command: rectangle 
    {
        int height = 5;
        int width = 20;
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (i == 0 || i == height - 1 || j == 0 || j == width - 1) {
                    printf("*");
                } else {
                    printf(" ");
                }
            }
            printf("\n");
        }
    }
    void r_cY_fN_sN_pN(char* c) // command: rectangle red
    {
        printf("%s", c);
        r_cN_fN_sN_pN();
        printf("\033[0m");

    }
    void r_cN_fY_sN_pN() // command: rectangle filled
    {
        int height = 5;
        int width = 20;
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                printf("*");
            }
            printf("\n");
        }

    }
    void r_cY_fY_sN_pN(char* c) // command: rectangle red filled
    {
        printf("%s", c);
        r_cN_fY_sN_pN();
        printf("\033[0m");
    }
    void r_cN_fN_sY_pN(int a, int b) // command: rectangle 6 10
    {
        for (int i = 0; i < a; i++) {
            for (int j = 0; j < b; j++) {
                if (i == 0 || i == a - 1 || j == 0 || j == b - 1) {
                    printf("*");
                } else {
                    printf(" ");
                }
            }
            printf("\n");
        }    
    }
    void r_cY_fN_sY_pN(char* c, int a, int b) // command: rectangle red 6 10
    {
        printf("%s", c);
        r_cN_fN_sY_pN(a, b);
        printf("\033[0m");

    }
    void r_cN_fY_sY_pN(int a, int b) // command: rectangle filled 6 10
    {
        for (int i = 0; i < a; i++) {
            for (int j = 0; j < b; j++) {
                printf("*");
            }
            printf("\n");
        }    
    }
    void r_cY_fY_sY_pN(char* c, int a, int b) // command: rectangle red filled 6 10
    {
        printf("%s", c);
        r_cN_fY_sY_pN(a, b);
        printf("\033[0m");
    }
    void r_cN_fN_sN_pY(char* p) // command: rectangle myfile.txt
    {
        int height = 5;
        int width = 20;
        FILE* f = fopen(p, "w+");
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (i == 0 || i == height - 1 || j == 0 || j == width - 1) {
                    fprintf(f, "*");
                }
                else {
                    fprintf(f, " ");
                }
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void r_cN_fY_sN_pY(char* p) // command: rectangle filled myfile.txt
    {
        int height = 5;
        int width = 20;
        FILE* f = fopen(p, "w+");
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                fprintf(f, "*");
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void r_cN_fN_sY_pY(int a, int b, char* p) // command: rectangle 6 10 myfile.txt
    {
        int height = a;
        int width = b;
        FILE* f = fopen(p, "w+");
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (i == 0 || i == height - 1 || j == 0 || j == width - 1) {
                    fprintf(f, "*");
                }
                else {
                    fprintf(f, " ");
                }
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void r_cN_fY_sY_pY(int a, int b, char* p) // command: rectangle filled 6 10 myfile.txt
    {
        int height = a;
        int width = b;
        FILE* f = fopen(p, "w+");
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                fprintf(f, "*");
            }
            fprintf(f, "\n");
        }
        fclose(f);

    }

    /*Right triangle functions*/
    void rt_cN_fN_sN_pN() // command: right
    {
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= i; j++) {
                if(j == 1 || j == i || i == 10)
                    printf("* ");
                else
                    printf("  ");
            }
            printf("\n");
        
        }
    }
    void rt_cY_fN_sN_pN(char* c) // command: right red
    {
        printf("%s", c);
        rt_cN_fN_sN_pN();
        printf("\033[0m");
    }
    void rt_cN_fY_sN_pN() // command: right filled
    {
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= i; j++) {
                printf("* ");
            }
            printf("\n");
        
        }
    }
    void rt_cY_fY_sN_pN(char* c) // command: right red filled
    {
        printf("%s", c);
        rt_cN_fY_sN_pN();
        printf("\033[0m");
    }
    void rt_cN_fN_sY_pN(int s) // command: right 6
    {
        for (int i = 1; i <= s; i++) {
            for (int j = 1; j <= i; j++) {
                if(j == 1 || j == i || i == s)
                    printf("* ");
                else
                    printf("  ");
            }
            printf("\n");
        
        }
    }
    void rt_cY_fN_sY_pN(char* c, int s) // command: right red 6 
    {
        printf("%s", c);
        rt_cN_fN_sY_pN(s);
        printf("\033[0m");
    }
    void rt_cN_fY_sY_pN(int s) // command: right filled 6 
    {
        for (int i = 1; i <= s; i++) {
            for (int j = 1; j <= i; j++) {
                printf("* ");
            }
            printf("\n");
        
        }
    }
    void rt_cY_fY_sY_pN(char* c, int s) // command: right red filled 6 
    {
        printf("%s", c);
        rt_cN_fY_sY_pN(s);
        printf("\033[0m");
    }
    void rt_cN_fN_sN_pY(char* p) // command: right myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= i; j++) {
                if(j == 1 || j == i || i == 10)
                    fprintf(f, "* ");
                else
                    fprintf(f, "  ");
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void rt_cN_fY_sN_pY(char* p) // command: right filled myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= i; j++) {
                fprintf(f, "* ");
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void rt_cN_fN_sY_pY(int s, char* p) // command: right 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for (int i = 1; i <= s; i++) {
            for (int j = 1; j <= i; j++) {
                if(j == 1 || j == i || i == s)
                    fprintf(f, "* ");
                else
                    fprintf(f, "  ");
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }
    void rt_cN_fY_sY_pY(int s, char* p) // command: right filled 6 myfile.txt
    {
        FILE* f = fopen(p, "w+");
        for (int i = 1; i <= s; i++) {
            for (int j = 1; j <= i; j++) {
                fprintf(f, "* ");
            }
            fprintf(f, "\n");
        }
        fclose(f);
    }


int yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}