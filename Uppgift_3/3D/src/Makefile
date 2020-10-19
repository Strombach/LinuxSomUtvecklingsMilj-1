#declare compile varible
CC= gcc

#declare installpath variable
ipath= /usr/local/bin

#declare name of executable
exec= program1

.PHONY: all clean install uninstall

all: program1

program1: main.o a_functions.o b_functions.o c_functions.o d_functions.o
	$(CC) main.o a_functions.o b_functions.o c_functions.o d_functions.o -o $(exec)

main.o: main.c main.h
	$(CC) -c main.c

a_functions.o: a_functions.c a.h
	$(CC) -c a_functions.c

b_functions.o: b_functions.c b.h
	$(CC) -c b_functions.c

c_functions.o: c_functions.c c.h
	$(CC) -c c_functions.c

d_functions.o: d_functions.c d.h
	$(CC) -c d_functions.c

clean:
	rm *.o

install:
	cp -i ./$(exec) $(ipath) 

uninstall:
	rm $(ipath)/$(exec)
