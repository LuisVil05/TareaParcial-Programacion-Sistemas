#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "usuarios.h"

int login() {
    FILE *archivo = fopen("vendedores.txt", "r");
    if (archivo == NULL) return 0;

    int lineas = 0;
    char buffer[150];
    while (fgets(buffer, 150, archivo)) {
        lineas++;
    }
    rewind(archivo);

    Vendedor *vendedores = (Vendedor *)malloc(lineas * sizeof(Vendedor));

    for (int i = 0; i < lineas; i++) {
        fscanf(archivo, "%[^,],%[^,],%[^\n]\n", vendedores[i].usuario, vendedores[i].clave, vendedores[i].nombre);
    }
    fclose(archivo);

    char user[50], pass[50];
    int intentos = 0;
    int autenticado = 0;

    while (intentos < 3 && autenticado == 0) {
        printf("Usuario: ");
        scanf("%s", user);
        printf("Clave: ");
        scanf("%s", pass);

        for (int i = 0; i < lineas; i++) {
            if (strcmp(user, vendedores[i].usuario) == 0 && strcmp(pass, vendedores[i].clave) == 0) {
                autenticado = 1;
                break;
            }
        }
        if (autenticado == 0) {
            intentos++;
            printf("Error. Intentos restantes: %d\n", 3 - intentos);
        }
    }

    free(vendedores);
    return autenticado;
}