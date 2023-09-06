TARGET=flip
CC=gcc
CFLAGS=-Wall -DBSD -DNDEBUG

all: $(TARGET)

$(TARGET): flip.o getopt.o flip.man
	$(CC) $(CFLAGS) -o $@ flip.o getopt.o

flip.o: flip.c flip.h
	$(CC) $(CFLAGS) -c $*.c

getopt.o: getopt.c flip.h
	$(CC) $(CFLAGS) -c $*.c 

flip.man: flip.1
	nroff -man flip.1 > flip.man

clean:
	rm -rf *.o $(TARGET)
	rm -rf flip.man
