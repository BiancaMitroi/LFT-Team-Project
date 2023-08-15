#!/bin/sh

clear
lex proiect.l
yacc -d proiect.y
gcc lex.yy.c y.tab.c -o proiect
./proiect