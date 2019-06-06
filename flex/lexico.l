%{
	#include <stdio.h>
	#include <stdlib.h>

	FILE* archivo = NULL;
%}

%option noyywrap
letra [a-zA-Z]
digito [0-9]
numero {digito}+
operador_unario "*"|"&"|"-"|"~"|"|"
operador_relacional "=="|"!="|"<"|">"|"<="|">="
operador_logico "&&"|"||"|"!"
operador_aritmetico "*"|"-"|"+"|"/"|"%"
operador_nivel_bit "&"|"|"|"^"|"<<"|">>"
operador_incremento "++"
operador_decremento "--"
%%
\n
[(] {fprintf(archivo,"%s\n","(");}
[)] {fprintf(archivo,"%s\n",")");}
[*] {fprintf(archivo,"%s\n","*");}
[=] {fprintf(archivo,"%s\n","=");}
[{] {fprintf(archivo,"%s\n","{");}
[}] {fprintf(archivo,"%s\n","}");}
[:] {fprintf(archivo,"%s\n",":");}
[?] {fprintf(archivo,"%s\n","?");}
[,] {fprintf(archivo,"%s\n",",");}
[;] {fprintf(archivo,"%s\n",";");}
"main" {fprintf(archivo,"%s\n","MAIN");}
"auto" {fprintf(archivo,"%s\n","AUTO");}
"extern" {fprintf(archivo,"%s\n","EXTERN");}
"register" {fprintf(archivo,"%s\n","REGISTER");}
"static" {fprintf(archivo,"%s\n","STATIC");}
"break" {fprintf(archivo,"%s\n","BREAK");}
"continue" {fprintf(archivo,"%s\n","CONTINUE");}
"default" {fprintf(archivo,"%s\n","DEFAULT");}
"do" {fprintf(archivo,"%s\n","DO");}
"while" {fprintf(archivo,"%s\n","WHILE");}
"goto" {fprintf(archivo,"%s\n","GOTO");}
"if" {fprintf(archivo,"%s\n","IF");}
"else" {fprintf(archivo,"%s\n","ELSE");}
"return" {fprintf(archivo,"%s\n","RETURN");}
"short" {fprintf(archivo,"%s\n","SHORT");}
"int" {fprintf(archivo,"%s\n","INT");}
"unsigned" {fprintf(archivo,"%s\n","UNSIGNED");}
"long" {fprintf(archivo,"%s\n","LONG");}
"for" {fprintf(archivo,"%s\n","FOR");}
"float" {fprintf(archivo,"%s\n","FLOAT");}
"char" {fprintf(archivo,"%s\n","CHAR");}
"double" {fprintf(archivo,"%s\n","DOUBLE");}
"sizeof" {fprintf(archivo,"%s\n","SIZEOF");}
{operador_relacional} {fprintf(archivo,"%s\n",yytext);}
{operador_incremento} {fprintf(archivo,"%s\n",yytext);}
{operador_decremento} {fprintf(archivo,"%s\n",yytext);}
{operador_unario} {fprintf(archivo,"%s\n",yytext);}
{operador_nivel_bit} {fprintf(archivo,"%s\n",yytext);}
{operador_aritmetico} {fprintf(archivo,"%s\n",yytext);}
{operador_logico} {fprintf(archivo,"%s\n",yytext);}
<<EOF>> {yyterminate();}
.
%%
int main(int argc, char** argv){
	if(argc == 1){
		printf("Error: Faltan par%cmetros. \n",160);
		printf("%s\n","Uso correcto: lexico.exe archivo_entrada archivo_salida");
		return 1;
	}
	else if ( argc == 2){
		printf("Error: Falta par%cmetro.\n",160);
		printf("%s\n","Uso: lexico.exe archivo_entrada archivo_salida");
		return 1;
	}
	else if ( argc > 3){
		printf("Error: Demasiados par%cmetros.\n", 160);
		printf("%s\n","Uso: lexico.exe archivo_entrada archivo_salida");
		return 1;
	}
	else if( argc == 3){
		if(!fopen(argv[1],"r")){
			printf("%s\n", "Error: El archivo de entrada no existe.");
			return 1;
		}
		else if(fopen(argv[2],"r")){
			printf("%s\n","Error: El archivo de salida ya existe.");
			return 1;
		}
		yyin = fopen(argv[1],"r");
		archivo = fopen(argv[2],"w");
	}
	yylex();
	return 1;
}
