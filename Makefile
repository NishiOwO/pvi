# $Id$

include mk/config.mk

CFLAGS = -I include
LDFLAGS = -L pcre
LIBS = -lpcre

EXEC =

OBJS = src/main.o src/arg.o

.PHONY: all clean
.SUFFIXES: .c .o

all: pvi$(EXEC)

pvi$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f pvi.exe pvi src/*.o
