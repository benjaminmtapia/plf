%{
int lineas = 0, caracteres = 0;
%}

%option noyywrap

%%
\n {lineas++; caracteres++;}
. {caracteres++;}
%%

void main()
{
yylex();
printf("\nL%cneas = %d\nCaracteres = %d\n", 161, lineas, caracteres);
}
