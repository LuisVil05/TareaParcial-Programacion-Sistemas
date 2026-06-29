CC=gcc

prog: Main.o usuarios.o productos.o
	$(CC) -o prog Main.o usuarios.o productos.o

Main.o: Main.c usuarios.h productos.h
	$(CC) -c Main.c

usuarios.o: usuarios.c usuarios.h
	$(CC) -c usuarios.c

productos.o: productos.c productos.h
	$(CC) -c productos.c

clean:
	rm *.o prog