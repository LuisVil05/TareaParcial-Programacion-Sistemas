#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "productos.h"

void sistema_ventas() {
    FILE *f_prod = fopen("producto.txt", "r");
    if (f_prod == NULL) return;

    int num_prod = 0;
    char buffer[200];
    while (fgets(buffer, 200, f_prod)) num_prod++;
    rewind(f_prod);

    Producto *inventario = (Producto *)malloc(num_prod * sizeof(Producto));
    for (int i = 0; i < num_prod; i++) {
        fscanf(f_prod, "%[^,],%[^,],%d,%f,%f\n", inventario[i].codigo, inventario[i].nombre, &inventario[i].cantidad, &inventario[i].costo, &inventario[i].precio_venta);
    }
    fclose(f_prod);

    FILE *f_ventas = fopen("ventas.txt", "r");
    int num_factura = 0;
    if (f_ventas != NULL) {
        while (fgets(buffer, 200, f_ventas)) {
            sscanf(buffer, "%d,", &num_factura);
        }
        fclose(f_ventas);
    }
    num_factura++;

    char cod_venta[20];
    int cant_venta;
    int continuar = 1;

    Producto carrito[50];
    int cant_carrito[50];
    int total_items = 0;

    while (continuar == 1) {
        printf("Ingrese codigo (o '0' para terminar): ");
        scanf("%s", cod_venta);
        if (strcmp(cod_venta, "0") == 0) break;

        printf("Cantidad: ");
        scanf("%d", &cant_venta);

        int encontrado = -1;
        for (int i = 0; i < num_prod; i++) {
            if (strcmp(inventario[i].codigo, cod_venta) == 0) {
                encontrado = i;
                break;
            }
        }

        if (encontrado != -1 && inventario[encontrado].cantidad >= cant_venta) {
            carrito[total_items] = inventario[encontrado];
            cant_carrito[total_items] = cant_venta;
            inventario[encontrado].cantidad -= cant_venta;
            total_items++;
        } else {
            printf("Error en stock o producto no encontrado.\n");
        }
    }

    if (total_items > 0) {
        char fecha[15];
        printf("Fecha (aaaa-mm-dd): ");
        scanf("%s", fecha);

        float total_fact = 0;
        printf("\n--- FACTURA %d ---\n", num_factura);
        for (int i = 0; i < total_items; i++) {
            float subtotal = cant_carrito[i] * carrito[i].precio_venta;
            total_fact += subtotal;
            printf("%s | Cant: %d | Total: %.2f\n", carrito[i].nombre, cant_carrito[i], subtotal);
        }
        printf("TOTAL: %.2f\n", total_fact);

        int confirmar;
        printf("Confirmar (1=Si, 0=No): ");
        scanf("%d", &confirmar);

        if (confirmar == 1) {
            FILE *f_prod_w = fopen("producto.txt", "w");
            for (int i = 0; i < num_prod; i++) {
                fprintf(f_prod_w, "%s,%s,%d,%.2f,%.2f\n", inventario[i].codigo, inventario[i].nombre, inventario[i].cantidad, inventario[i].costo, inventario[i].precio_venta);
            }
            fclose(f_prod_w);

            FILE *f_ventas_a = fopen("ventas.txt", "a");
            for (int i = 0; i < total_items; i++) {
                fprintf(f_ventas_a, "%d,%s,%s,%d,%.2f,%.2f,%s\n", num_factura, carrito[i].codigo, carrito[i].nombre, cant_carrito[i], carrito[i].costo, carrito[i].precio_venta, fecha);
            }
            fclose(f_ventas_a);
        }
    }
    free(inventario);
}