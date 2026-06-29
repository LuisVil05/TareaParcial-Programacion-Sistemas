#include <stdio.h>
#include "usuarios.h"
#include "productos.h"

int main() {
    if (login() == 1) {
        sistema_ventas();
    }
    return 0;
}
// Luis Villegas
