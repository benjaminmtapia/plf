%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintactico.tab.h"
	FILE* archivo = NULL;
%}

%option noyywrap
letra [a-zA-Z]
digito [0-9]
numero {digito}+
%%
\n
[(] {return '(';}
[)] {return ')';}
[*] {return '*';}
[=] {return '=';}
[{] {return '{';}
[}] {return '}';}
[:] {return ':';}
[?] {return '?';}
[,] {return ',';}
[;] {return ';';}
[.] {return '.';}
"-" {return '-';}
"&" {return '&';}
"!" {return '!';}
"+" {return '+';}
"/" {return '/';}
"~" {return '~';}
"|" {return '|';}
"^" {return '^';}
"||" {return OR;}
"<" {return '<';}
"<<" {return MENOR;}
">" {return '>';}
">>" {return MAYOR;}
"==" {return IGUAL;}
"!=" {return DISTINTO;}
"<=" {return MENOR_IGUAL;}
">=" {return MAYOR_IGUAL;}
"&&" {return AND;}
"--" {return DECREMENTO;}
"++" {return INCREMENTO;}
"main" {return MAIN;}
"auto" {return AUTO;}
"extern" {return EXTERN;}
"register" {return REGISTER;}
"static" {return STATIC;}
"break" {return BREAK;}
"continue" {return CONTINUE;}
"default" {return DEFAULT;}
"do" {return DO;}
"while" {return WHILE;}
"goto" {return GOTO;}
"if" {return IF;}
"else" {return ELSE;}
"return" {return RETURN;}
"short" {return SHORT;}
"int" {return INT;}
"unsigned" {return UNSIGNED;}
"long" {return LONG;}
"for" {return FOR;}
"float" {return FLOAT;}
"char" {return CHAR;}
"double" {return DOUBLE;}
"sizeof" {return SIZEOF;}
{digito}+ {return ENTERO;}
\'{letra}\' {return CONSTANTE_CARACTER;}
\"{letra}+\" {return CONSTANTE_CADENA;}
"E" {return E;}
<<EOF>> {yyterminate();}
.
%%
