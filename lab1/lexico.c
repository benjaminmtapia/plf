#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char** argv)
{
		FILE* archivo_entrada;
		FILE* archivo_salida;
		
		archivo_entrada = fopen(argv[1],"r");

		//Errores
		if(argc == 1){
			printf("%s","Error: Faltan parametros" );
			exit(1);
		}
		
		if(argv[1]==NULL || argv[2]==NULL){
			printf("%s","Error: Falta parametro" );
			exit(1);
		}
		if(argc>3){
			printf("%s","Error: Demasiados parametros" );
			exit(1);
		}

		archivo_entrada = fopen(argv[1],"r");
		if(archivo_entrada == NULL){
			printf("%s","Error: El archivo de entrada no existe." );
			exit(1);
		}
		if(archivo_salida = fopen(argv[2],"r")){
			printf("%s","Error: El archivo de salida ya existe." );
			exit(1);
		}

		archivo_salida=fopen(argv[2],"w");
		//lectura de archivo
		char buffer[25000];
		char* linea = (char*)malloc(sizeof(char));
		int i=0;
		int largo = 0;
		int contador = 0;
		char caracter;
		while(!feof(archivo_entrada)){
			linea = fgets(linea,25000,archivo_entrada);
			largo = strlen(linea);
			for (i = 0; i < largo; ++i)
			{
				caracter = linea[i];
				switch(caracter){
					case 'm':
						if(linea[i+1]=='a' && linea[i+2]=='i' && linea[i+3]=='n'){
							fprintf(archivo_salida, "%s\n","MAIN" );
							//printf("%s\n","reconozco main" );
							i=i+3;
						}
						break;
					case 'c':
						//continue
						if(linea[i+1]=='o' && linea[i+2]=='n' && linea[i+3]=='t' && linea[i+4]=='i' && linea[i+5]=='n' && linea[i+6]=='u' && linea[i+7]=='e'){
							fprintf(archivo_salida, "%s\n","CONTINUE" );
							//printf("%s\n","encontre continue" );
							i = i+7;
						}
						//char
						else if(linea[i+1]=='h' && linea[i+2]=='a' && linea[i+3]=='r'){
							fprintf(archivo_salida, "%s\n","CHAR" );
							//printf("%s\n","encontre char" );
							i = i+3;
						}
						break;
					case 'i':
						//if
						if(linea[i+1]=='f'){
							fprintf(archivo_salida, "%s\n", "IF");
							//printf("%s\n","encontre if" );
							i = i+1;
						}
						//int
						else if(linea[i+1]=='n' && linea[i+2]=='t'){
							fprintf(archivo_salida, "%s\n","INT" );
							//printf("%s\n","encontre int" );
							i= i+2;
						}
						break;
					case 'a':
						//auto
						if(linea[i+1]=='u' && linea[i+2]=='t' && linea[i+3]=='o'){
							fprintf(archivo_salida, "%s\n", "AUTO");
							//printf("%s\n","encontre auto" );
							i=i+3;
						}
						break;
					case 'e':
						//extern
						if(linea[i+1]=='x' && linea[i+2]=='t' && linea[i+3]=='e' && linea[i+4]=='r' && linea[i+5]=='n'){
							fprintf(archivo_salida, "%s\n", "EXTERN");
							//printf("%s\n","encontre extern" );
							i=i+5;
						}
						//else
						else if(linea[i+1]=='l' && linea[i+2]=='s' && linea[i+3]=='e'){
							fprintf(archivo_salida, "%s\n", "ELSE" );
							//printf("%s\n","encontre else" );
							i=i+3;
						}
						break;
					case 'r':
						//register
						if(linea[i+1]=='e' && linea[i+2]=='g' && linea[i+3]=='i' && linea[i+4]=='s' && linea[i+5]=='t' && linea[i+6]=='e' && linea[i+7]=='r'){
							fprintf(archivo_salida, "%s\n", "REGISTER");
							//printf("%s\n","encontre register" );
							i=i+7;
						}
						//return
						else if(linea[i+1]=='e' && linea[i+2]=='t' && linea[i+3]=='u' && linea[i+4]=='r' && linea[i+5]=='n'){
							fprintf(archivo_salida, "%s\n","RETURN" );
							//printf("%s\n","encontre return" );
							i=i+5;
						}
						break;
					case 's':
						//static
						if(linea[i+1]=='t' && linea[i+2]=='a' && linea[i+3]=='t' && linea[i+4]=='i' && linea[i+5]=='c'){
							fprintf(archivo_salida, "%s\n","STATIC" );
							//printf("%s\n","encontre static" );
							i=i+5;
						}
						//sizeof
						else if(linea[i+1]=='i' && linea[i+2]=='z' && linea[i+3]=='e' && linea[i+4]=='o' && linea[i+5]=='f'){
							fprintf(archivo_salida, "%s\n","SIZEOF" );
							//printf("%s\n","encontre sizeof" );
							i=i+5;
						}
						//short
						else if(linea[i+1]=='h' && linea[i+2]=='o' && linea[i+3]=='r' && linea[i+4]=='t'){
							fprintf(archivo_salida, "%s\n","SHORT" );
							//printf("%s\n","encontre short" );
							i=i+4;
						}
						break;
					case 'b':
						//break
						if(linea[i+1]=='r' && linea[i+2]=='e' && linea[i+3]=='a' && linea[i+4]=='k'){
							fprintf(archivo_salida, "%s\n","BREAK" );
							//printf("%s\n","encontre break" );
							i=i+4;
						}
						break;
					case 'd':
						//double
						if(linea[i+1]=='o' && linea[i+2]=='u' && linea[i+3]=='b' && linea[i+4]=='l' && linea[i+5]=='e'){
							fprintf(archivo_salida, "%s\n", "DOUBLE");
							//printf("%s\n","encontre double" );
							i=i+5;
						}
						//default
						else if(linea[i+1]=='e' && linea[i+2]=='f' && linea[i+3]=='a' && linea[i+4]=='u' && linea[i+5]=='l' && linea[i+6]=='t'){
							fprintf(archivo_salida, "%s\n","DEFAULT" );
							//printf("%s\n","encontre default" );
							i=i+6;
						}
						
						//do
						else if(linea[i+1]=='o'){
							fprintf(archivo_salida, "%s\n","DO" );
							//printf("%s\n","encontre do" );
							i++;
						}
						break;
					case 'w':
						//while
						if(linea[i+1]=='h' && linea[i+2]=='i' && linea[i+3]=='l' && linea[i+4]=='e'){
							fprintf(archivo_salida, "%s\n", "WHILE");
							//printf("%s\n","encontre while" );
							i=i+4;
						}
						break;

					case 'f':
						//for
						if(linea[i+1]=='o' && linea[i+2]=='r'){
							fprintf(archivo_salida, "%s\n","FOR" );
							//printf("%s\n", "encontre for" );
							i=i+2;
						}
						//float
						else if(linea[i+1]=='l' && linea[i+2]=='o' && linea[i+3]=='a' && linea[i+4]=='t'){
							fprintf(archivo_salida, "%s\n","FLOAT" );
							//printf("%s\n", "encontre float" );
							i=i+4;
						}
						break;
					case 'g':
						//goto
						if(linea[i+1]=='o' && linea[i+2]=='t' && linea[i+3]=='o'){
							fprintf(archivo_salida, "%s\n","GOTO" );
							//printf("%s\n","encontre goto" );
							i=i+3;
						}
						break;
					case 'u':
						//unsigned
						if(linea[i+1]=='n' && linea[i+2]=='s' && linea[i+3]=='i' && linea[i+4]=='g' && linea[i+5]=='n'
							&& linea[i+6]=='e' && linea[i+7]=='d'){
							fprintf(archivo_salida, "%s\n","UNSIGNED" );
							//printf("%s\n","encontre unsigned" );
							i=i+7;
						}
						break;
					case 'l':
						//long
						if(linea[i+1]=='o' && linea[i+2]=='n' && linea[i+3]=='g'){
							fprintf(archivo_salida, "%s\n", "LONG" );
							//printf("%s\n","encontre long" );
							i=i+3;
						}
						break;
					case '(':
						fprintf(archivo_salida, "%s\n", "(");
						//printf("%s\n","(" );
						break;
					case ')':
						fprintf(archivo_salida, "%s\n",")" );
						//printf("%s\n",")" );
						break;
					case '{':
						fprintf(archivo_salida, "%s\n", "{");
						//printf("%s\n","{" );
						break;
					case '}':
						fprintf(archivo_salida, "%s\n", "}");
						//printf("%s\n","}" );
						break;
					case ';':
						fprintf(archivo_salida, "%s\n",";" );
						//printf("%s\n",";" );	
						break;
					case ',':
						fprintf(archivo_salida, "%s\n","," );
						//printf("%s\n","," );
						break;
					case '*':
						fprintf(archivo_salida, "%s\n","*" );
						//printf("%s\n","*" );
						break;
					case '=':
						if(linea[i+1]=='='){
							fprintf(archivo_salida, "%s\n", "==");
							//printf("%s\n","==" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", "=");
							//printf("%s\n","=" );
						}
						break;
					case ':':
						fprintf(archivo_salida, "%s\n",":" );
						//printf("%s\n",":" );
						break;
					case '&':
						if(linea[i+1]=='&'){
							fprintf(archivo_salida, "%s\n","&&" );
							//printf("%s\n","&&" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", "&");
							//printf("%s\n","&" );
						}
						break;
					case '-':
						if(linea[i+1]=='-'){
							fprintf(archivo_salida, "%s\n","--" );
							//printf("%s\n","--" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n","-" );
							//printf("%s\n","-" );
						}
						break;
					case '~':
						fprintf(archivo_salida, "%s\n","~" );
						//printf("%s\n","~" );
						break;
					case '|':
						if(linea[i+1]=='|'){
							fprintf(archivo_salida, "%s\n", "||");
							//printf("%s\n","||" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", "|");
							//printf("%s\n","|" );
						}
						break;
					case '!':
						if(linea[i+1]=='='){
							fprintf(archivo_salida, "%s\n", "!=" );
							//printf("%s\n","!=" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", "!");
							//printf("%s\n","!" );
						}
						break;
					case '<':
						if(linea[i+1]=='='){
							fprintf(archivo_salida, "%s\n","<=" );
							//printf("%s\n","<=" );
							i++;
						}
						else if(linea[i+1]=='<'){
							fprintf(archivo_salida, "%s\n", "<<");
							//printf("%s\n","<<" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", "<");
							//printf("%s\n","<" );
						}
						break;
					case '>':
						if(linea[i+1]=='='){
							fprintf(archivo_salida, "%s\n", ">=");
							//printf("%s\n",">=" );
							i++;
						}
						else if(linea[i+1]=='>'){
							fprintf(archivo_salida, "%s\n",">>" );
							//printf("%s\n",">>" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n", ">");
							//printf("%s\n",">" );
						}
						break;
					case '^':
						fprintf(archivo_salida, "%s\n","^" );
						//printf("%s\n","^" );
						break;
					case '+':
						if(linea[i+1]=='+'){
							fprintf(archivo_salida, "%s\n", "++" );
							//printf("%s\n","++" );
							i++;
						}
						else{
							fprintf(archivo_salida, "%s\n","+" );
							//printf("%s\n","+" );
						}
						break;
					case '%':
						fprintf(archivo_salida, "%s\n","%" );
						//printf("%s\n", "%");
						break;
					case '/':
						fprintf(archivo_salida, "%s\n","/" );
						//printf("%s\n","/" );
						break;
					case '?':
						fprintf(archivo_salida, "%s\n", "?");
						break;
				}
			}			
		}	
		fclose(archivo_salida);
		fclose(archivo_entrada);
	return 0;
}