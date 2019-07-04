%{
#include "as.tab.h"
%}

%option noyywrap

%%
\n {return LINEA;}
. {return CARACTER;}
%%

