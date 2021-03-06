/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_SINTACTICO2_TAB_H_INCLUDED
# define YY_YY_SINTACTICO2_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    BREAK = 258,
    CONTINUE = 259,
    DEFAULT = 260,
    DO = 261,
    WHILE = 262,
    FOR = 263,
    GOTO = 264,
    IF = 265,
    ELSE = 266,
    RETURN = 267,
    DIGITO = 268,
    CONSTANTE_CADENA = 269,
    CONSTANTE_CARACTER = 270,
    IDENTIFICADOR = 271,
    TIPO = 272,
    ESP_ALM_VAR = 273,
    SIZEOF = 274,
    OP_UN = 275,
    OP_INC = 276,
    OP_DEC = 277,
    OP_BIT = 278,
    MAIN = 279,
    EQUAL = 280,
    NOTEQUAL = 281,
    LESSTHAN = 282,
    GREATERTHAN = 283,
    EQLESSTHAN = 284,
    EQGREATERTHAN = 285,
    AND = 286,
    OR = 287,
    BIGGER = 288,
    SMALLER = 289
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SINTACTICO2_TAB_H_INCLUDED  */
