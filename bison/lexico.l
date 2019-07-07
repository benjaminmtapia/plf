%{
#include <stdio.h>
#include <string.h>
#include "sintactico.tab.h"
extern int yyparse();
%}

%option noyywrap
SIMBOLO _?[^\"]
letra [a-zA-Z]
signo [+-]?
digito [0-9]
entero {digito}+
decimal {digito}?\.{digito}
exponente [eE]{signo}{entero}
real ({entero}|{decimal}){exponente}
identificador [_a-zA-Z][_0-9a-zA-Z]*
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
\'{SIMBOLO}\'	{return CONSTANTE_CARACTER;}
\"{SIMBOLO}*\"	{return CONSTANTE_CADENA;}
{real} {return REAL;}
{identificador} {return IDENTIFICADOR;}
<<EOF>> {yyterminate();}
.
%%
void yyerror(char * s) {
	printf("Error sint%cctico en la l%cnea: %d\n", 160,161,yylineno);
}


int main(int argc, char** argv)
{
  if(argc == 1){
    printf("Error: Falta par%cmetro.\n",160);
    printf("Uso: sintactico.exe archivo");
    exit(1);
  }
  else if(!fopen(argv[1],"r")){
    printf("Error: El archivo no existe.");
    exit(1);
  }
  else if(argc > 2){
    printf("Error: Demasiados par%cmetros",160);
    printf("Uso: sintactico.exe archivo");
    exit(1);
  }
  else if(argc == 2){
    yyin = fopen(argv[1],"r");
    int analizador_sintactico = yyparse();
    if(analizador_sintactico = 0){
      printf("An%clisis sint%cctico concluido.\n",160,160);
      fclose(yyin);
      exit(0);
    }
  }
}
