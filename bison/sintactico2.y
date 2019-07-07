%{

#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern int yylineno;
extern FILE* yyin;
void yyerror(const char* s);
//void yylineno(const char* s);
extern char *yytext;


%}


%token BREAK
%token CONTINUE
%token DEFAULT
%token DO
%token WHILE
%token FOR
%token GOTO
%token IF
%token ELSE
%token RETURN
%token DIGITO
%token CONSTANTE_CADENA
%token CONSTANTE_CARACTER
%token IDENTIFICADOR
%token TIPO
%token ESP_ALM_VAR
%token SIZEOF
%token OP_UN
%token OP_INC
%token OP_DEC
%token OP_BIT
%token MAIN
%token EQUAL
%token NOTEQUAL
%token LESSTHAN
%token GREATERTHAN
%token EQLESSTHAN
%token EQGREATERTHAN
%token AND
%token OR
%token BIGGER
%token SMALLER


%%

programa: MAIN '(' D1 ')' D2 '{' D3 '}';

D1: par_lin_ord |   ;

D2: dec_lin_ord |   ;

D3: D4 D5;

D4: dec_var_loc |   ;

D5: sentencia D6 |    ;

D6: D5;

par_lin_ord: IDENTIFICADOR ',' IDENTIFICADOR;

dec_lin_ord: 	declaracion declaracion;

dec_var_loc: 	declaracion D7;

D7: dec_var_loc |   ;

declaracion: D8 D9 ';';

D8: D10 | D10 tipo | tipo;

D10: esp_alm_var D11;

D11: esp_alm_var |  ;

D9: especificacion_declaracion D12 D13 ';';

D12: inicializacion_variable |   ;

D13: ',' D9 | ;

esp_alm_var: ESP_ALM_VAR;

tipo: TIPO;

especificacion_declaracion: nombre_variable
                            | declaracion_puntero
                            | '(' especificacion_declaracion ')'
                            ;

nombre_variable: IDENTIFICADOR
                 ;

declaracion_puntero: '*' especificacion_declaracion
                      ;

inicializacion_variable: '=' valor_inicial
                         | '=' '{' D14 '}'
                         ;

D14: valor_inicial D15;

D15: ',' D14 |  ;

valor_inicial: expresion
               ;

sentencia: sentencia_break
           | sentencia_continue
           | sentencia_default
           | bucle_do_while
           | expresion ';'
           | bucle_for
           | sentencia_goto
           | sentencia_if
           | etiqueta sentencia
           | sentencia_NULL
           | sentencia_return
           | bucle_while
           ;

sentencia_break: BREAK ';'
                 ;

sentencia_continue: CONTINUE ';'
                 ;

sentencia_default: DEFAULT ';'
                 ;

bucle_do_while: DO sentencia WHILE '(' expresion ')' ';'
                 ;

bucle_for: FOR '(' D16 ';' D17 ';' D16 ')' sentencia
           ;

D16: expresion D19;

D19: ',' D16 |  ;

D17: expresion |  ;

sentencia_goto: GOTO etiqueta ';'
                ;

sentencia_if: IF '(' expresion ')' sentencia D18;

D18: ELSE sentencia D19;

D19: D18 |   ;

etiqueta: IDENTIFICADOR ':'
          ;

sentencia_NULL: ';'
                 ;

sentencia_return: RETURN ';'
                  | RETURN expresion ';'
                  ;

bucle_while: WHILE '(' expresion ')' sentencia
             ;

expresion: expresion operador_binario expresion
           | operando_expresion
           | expresion_ternaria
           | operador_unario expresion
           | lvalor operador_asignacion expresion
           | lvalor operador_incremento
           | lvalor operador_decremento
           | operador_incremento lvalor
           | operador_decremento lvalor
           ;

operador_binario: operador_unario
                  | operador_relacional
                  | operador_logico
                  | operador_aritmetico
                  | operador_nivel_bit
                  ;

operador_unario: cast
                 | operador_sizeof
                 | operador_incremento
                 | operador_decremento
                 | '*'
                 | '&'
                 | '-'
                 | '~'
                 | '|'
                 ;

cast: '(' tipo ')'
      ;

operador_sizeof: SIZEOF '(' objeto ')'
                 ;

objeto: tipo
        | expresion
        ;

operador_incremento: OP_INC
                     ;

operador_decremento: OP_DEC
                     ;

operador_relacional: EQUAL
                     | NOTEQUAL
                     | '<'
                     | '>'
                     | EQGREATERTHAN
                     | EQLESSTHAN
                     ;

operador_logico: AND
                 | OR
                 | '!'
                 ;

operador_aritmetico: '*'
                     | '-'
                     | '+'
                     | '/'
                     | '%'
                     ;

operador_nivel_bit: '&'
                    | '|'
                    | '^'
                    | BIGGER
                    | SMALLER
                    ;

operando_expresion: nombre
                    | constante_numerica
                    | constante_caracter
                    | constante_cadena
                    | '(' expresion ')'
                    ;

nombre: nombre_variable
        ;

constante_numerica: entero
                    | real
                    ;

expresion_ternaria: '(' expresion ')' '?' expresion ':' expresion
                    ;

lvalor: nombre
        | ref_dir_ind
        | '(' lvalor ')'
        ;

ref_dir_ind: '*' expresion_puntero
              ;

expresion_puntero: expresion
                   ;

operador_asignacion: '='
                     | operador_aritmetico '='
                     | operador_nivel_bit '='
                     ;

constante_cadena: CONSTANTE_CADENA
                  ;

constante_caracter: CONSTANTE_CARACTER
                    ;

entero: DIGITO
        ;

real: entero '.' entero exponente
      | entero '.' entero
      | entero '.' exponente
      | '.' entero exponente
      | '.' entero
      | '.' exponente
      | entero '.'
      | '.'
      ;

exponente: 'E' entero
           | 'E' '+' entero
           | 'E' '-' entero
           ;


%%

int main(argc,argv)
  int argc;
  char **argv;
  {

    if(argc > 2){
      printf("Error: Demasiados par%cmetros en la l%cnea de comandos.\n",160,161);
      printf("Uso: sintactico.exe archivo\n");
      exit(-1);
    }
    else if(argc == 1){
      printf("Error: Falta par%cmetro en la l%cnea de comandos.\n",160,161);
      printf("Uso: sintactico.exe archivo\n");
      exit(-1);
    }
    else if(argc == 2){

      yyin = fopen( argv[1], "r" );
      if(yyin==NULL){
        printf("Error: El archivo de entrada no existe.\n");
        fclose(yyin);
        exit(-1);
      }
      else{


        //yylex();
        int i = yyparse();
        if(i == 0){
          printf("An%clisis sint%cctico concluido.\n",160,160);
          fclose(yyin);
          exit(0);
        }


      }


    }


}


void yyerror(const char *s) {
	printf("Error sint%cctico en la l%cnea: %d\n",160,161,yylineno);
	exit(-1);

}
