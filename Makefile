# $Id$

include mk/config.mk

CFLAGS = -I include
LDFLAGS = -L pcre
LIBS = -lpcre

EXEC =

OBJS = src/main.o src/arg.o src/array.o

.PHONY: all pcre clean mrproper
.SUFFIXES: .c .o

all: pvi$(EXEC)

pvi$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

pcre:
	cd pcre && $(MAKE)

clean:
	rm -f pvi.exe pvi src/*.o

mrproper: clean
	cd pcre && $(MAKE) clean
