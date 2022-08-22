/* Escriba un programa en LEX, que permita hacer un simple traductor de ingles a español. */
/* Considere por lo menos 10 palabras. */

/* Seccion de opciones */
/* Le indica a flex que solo lea un archivo de entrada */
%option noyywrap
/* Obtener el numero de linea donde se produce un error */
%option yylineno

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    FILE *yyin;
    int vida1=100, vida2 = 100;
%}

CASA        "house"
CARRO       "car"
AVION       "plane"
PERRO       "dog"
HOMBRE      "man"
MUJER       "woman"
CANASTO     "basket"
PELOTA      "ball"
AMIGO       "friend"
PELICULA    "movie"    

%%

{CASA}          {printf("(%s) significa casa",yytext);}
{CARRO}         {printf("(%s) significa carro",yytext);}  
{AVION}         {printf("(%s) significa avión",yytext);}  
{PERRO}         {printf("(%s) significa perro",yytext);}  
{HOMBRE}        {printf("(%s) significa hombre",yytext);}  
{MUJER}         {printf("(%s) significa mujer",yytext);}
{PELOTA}        {printf("(%s) significa pelota",yytext);}  
{AMIGO}         {printf("(%s) significa amigo",yytext);}  
{PELICULA}      {printf("(%s) significa pelicula",yytext);}
{CANASTO}       {printf("(%s) significa canasto",yytext);}   

%%

int main(int argc, char *argv[]){
    /* Se abre el archivo en modo lectura y se deja apuntado el puntero yyin */

    if((yyin = fopen(argv[1], "rt")) == NULL){
        printf("\nNo se pudo abrir el archivo \n");
        return 1;
    }

    else{
        printf("\nEl archivo pudo abrirse correctamente \n");
        yylex();
    }

    printf("\nLectura de archivo finalizada \n");
    fclose(yyin);
    return 0;   
}
