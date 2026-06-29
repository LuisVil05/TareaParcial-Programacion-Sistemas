#ifndef USUARIOS_H
#define USUARIOS_H

typedef struct {
    char usuario[50];
    char clave[50];
    char nombre[50];
} Vendedor;

int login();

#endif