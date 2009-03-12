# define targets here
TARGETS=lisp

CLEANFILES=$(TARGETS) *.o

CC=gcc
AS=nasm
ARCH=macho
ASFLAGS=-f $(ARCH)

test: support.o string.o secd.o test.o
	ld -o test $^

all: $(TARGETS)

lisp: driver.o main.o lisp.o cons.o
	gcc -o lisp $^

clean:
	-rm -f $(CLEANFILES)

redo: clean all

%.o : %.c
	$(CC) -c $< -o $@

%.o : %.asm
	$(AS) $(ASFLAGS) -o $@ $<

