# include <stdio.h>


int a,b,c;
a = 0 | 1;


int* array = (int) malloc(sizeof(int) * 6);

typedef struct nodo{
	char caracter;
	struct nodo* siguiente = NULL;
}Nodo;

int* iniciarArr(int* lista){
	int i = 0;
	for(i = 0; i < 6; i++){
		lista[i] = i;
	}
	return lista;
}



int* iniciarArrdo(int* lista){
	int i = 0;
	do{
		lista[i] = i;
		i++; 
	}while(i < 6);
	return lista;
}

int* decrece(int* array){
	int i = 6;
	while (i > 0){
		if(i < 0){
			break;
		}
		array[i] = i;
		i--;

	}
}


int* elegir(int opcion, int* array){
	if(opcion == 1 || opcion < 2){
		array = iniciarArr(int* lista);
	}
	else{
		array = iniciarArr(int* lista);
	}
	return 0;
}



int main (){
	static int y = 3;

	int x = 0;
	printf("%d", x + 1 );
	return 0;
}



