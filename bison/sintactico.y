%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern int yylineno;
extern FILE* yyin;
extern char *yytext;
void yyerror(char *s);
%}
%token IGUAL
%token OR
%token MENOR
%token MAYOR
%token DISTINTO
%token MENOR_IGUAL
%token MAYOR_IGUAL
%token AND
%token DECREMENTO
%token INCREMENTO
%token MAIN
%token AUTO
%token EXTERN
%token REGISTER
%token STATIC
%token BREAK
%token CONTINUE
%token DEFAULT
%token DO
%token WHILE
%token GOTO
%token IF
%token ELSE
%token RETURN
%token SHORT
%token INT
%token UNSIGNED
%token LONG
%token FOR
%token FLOAT
%token CHAR
%token DOUBLE
%token SIZEOF
%token ENTERO
%token CONSTANTE_CADENA
%token CONSTANTE_CARACTER
%%
programa: MAIN '(' D1 ')' D2 '{' D3 D4 '}';
D1: par_lin_ord
    |  ;
D2: dec_lin_ord |  ;
D3: dec_var_loc |  ;
D4: sentencia D5 |  ;
D5: D4 ;
par_lin_ord: IDENTIFICADOR ',' IDENTIFICADOR ;
dec_lin_ord: declaracion declaracion ;
dec_var_loc: declaracion D6 ;
D6: dec_var_loc |  ;
declaracion: D7 D8 ;
D7: A1 | A1 tipo | tipo ;
A1: esp_alm_var A2 ;
A2: A1 |  ;
D8: especificacion_declaracion B1 B2 ';' ;
B1: inicializacion_variable |  ;
B2: ',' D8 |  ;
esp_alm_var: AUTO | EXTERN | REGISTER | STATIC ;
especificacion_declaracion: nombre_variable
  | declaracion_puntero
  | '(' especificacion_declaracion ')' ;

declaracion_puntero: '*' especificacion_declaracion ;
inicializacion_variable: '=' D9 | '=' '{' D10 ;
D9: valor_inicial ;
D10: valor_inicial D11 ;
D11: ',' D10 | '}' ;
valor_inicial: expresion ;
sentencia: sentencia_break | sentencia_continue | sentencia_default | bucle_do_while
 | expresion ';' | bucle_for | sentencia_goto | sentencia_if | etiqueta sentencia
 | sentencia_NULL | sentencia_return | bucle_while ;
sentencia_break: BREAK ';' ;
sentencia_continue: CONTINUE ';' ;
sentencia_default: DEFAULT ':' sentencia ;
bucle_do_while: DO sentencia WHILE '(' expresion ')' ';' ;
bucle_for: FOR '(' D12 ';' D13 ';' D12 ')' sentencia ;
D12: expresion D14 ;
D13: expresion ;
D14: ',' |  ;
sentencia_goto: GOTO etiqueta ';' ;
sentencia_if: IF '(' expresion ')' sentencia D15 ;
D15: ELSE sentencia D16 |  ;
D16: D15 |  ;
etiqueta: IDENTIFICADOR ':' ;
sentencia_NULL: ';' ;
sentencia_return: RETURN D17 ';' ;
D17: expresion |  ;
bucle_while: WHILE '(' expresion ')' sentencia ;
expresion: expresion operador_binario expresion |
 operando_expresion | expresion_ternaria | operador_unario expresion
 | lvalor operando_asignacion expresion | lvalor operador_incremento
 | lvalor operador_decremento | operador_incremento lvalor | operador_decremento lvalor ;
operador_binario: operador_unario | operador_relacional | operador_logico
| operador_aritmetico | operador_nivel_bit ;
operador_unario: cast | operador_sizeof | operador_incremento | operador_decremento
| '*' | '&' | '-' | '~' | '|' ;
cast: '(' tipo ')' ;
operador_sizeof: SIZEOF '(' objeto ')' ;
objeto: tipo | expresion ;
tipo: INT | SHORT D18 | UNSIGNED D18 | LONG D18 | LONG FLOAT | CHAR | DOUBLE | FLOAT ;
D18: INT |  ;
operador_relacional: IGUAL | DISTINTO | '<' | '>' | MENOR_IGUAL | MAYOR_IGUAL ;
operador_logico: AND | OR | '!' ;
operador_expresion: nombre | constante_numerica | CONSTANTE_CARACTER | CONSTANTE_CADENA | '(' expresion ')' ;
constante_numerica: ENTERO | REAL ;
expresion_ternaria: '(' expresion ')' '?' expresion ':' ;
operador_aritmetico: '*' | '-' | '+' | '/' | '%' ;
operador_nivel_bit: '&' | '|' | '^' | MENOR | MAYOR ;
operador_incremento: INCREMENTO ;
operador_decremento: DECREMENTO ;
lvalor: nombre | ref_dir_ind | '(' lvalor ')' ;
nombre: nombre_variable ;
nombre_variable: IDENTIFICADOR ;
ref_dir_ind: '*' expresion_puntero ;
expresion_puntero: expresion ;
operando_asignacion: D19 '=' ;
D19: operador_aritmetico | operador_nivel_bit ;
%%
void yyerror(char *s) {
	printf("Error sint%cctico en la l%cnea: %d\n",160,161,yylineno);
	exit(-1);

}

void main(int argc, char** argv)
{
  if(argc == 1){
    printf("Error: Falta par%cmetro.\n",160);
    printf("Uso: sintactico.exe archivo");
    exit(1);
  }
  else if(!fopen(argv[1])){
    printf("Error: El archivo no existe.");
    exit(1);
  }
  else if(argc > 2){
    printf("Error: Demasiados par%cmetros",160);
    printf("Uso: sintactico.exe archivo");
    exit(1);
  }
  else if(argc == 2){
    int analizador_sintactico = yyparse();
    if(analizador_sintactico = 0){
      printf("An%clisis sint%cctico concluido.\n",160,160);
      fclose(yyin);
      exit(0);
    }
  }
yyparse();
printf("0k\n");
}
