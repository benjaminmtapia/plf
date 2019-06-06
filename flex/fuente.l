%{
int lineas = 0, caracteres = 0;
char* salida = NULL;
%}

%option noyywrap

%%
\n {printf("salto de linea\n");exit (1);}
. {caracteres++;}
%%

void main()
{
yylex();
printf("\nL%cneas = %d\nCaracteres = %d\n", 161, lineas, caracteres);
}
