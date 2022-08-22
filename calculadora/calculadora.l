/* Escriba un programa en LEX, que permita reconocer los números, */
/* los símbolos y los caracteres de una calculadora. */

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
%}

RESTA           ["\-"]
DIGITOS         [(0-9)]
SUMA            ["+"]
MULTIPLICACION  ["*"]
DIVISION        ["/"]
DECIMAL         ["."]
%%

{RESTA}                         {printf("Resta (%s)\n", yytext);}
{DIGITOS}+                      {printf("Numero (%s)\n", yytext);}
{DIGITOS}+{DECIMAL}{DIGITOS}    {printf("Numero con Decimales (%s)\n", yytext);}
{SUMA}                          {printf("Suma (%s)\n", yytext);}
{MULTIPLICACION}                {printf("Multiplicacion (%s)\n", yytext);}
{DIVISION}                      {printf("Division (%s)\n", yytext);}

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