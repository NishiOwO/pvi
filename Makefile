CC = cc
CFLAGS = -I include
LDFLAGS =
LIBS =

EXEC =

OBJS = src/main.o

.PHONY: all clean
.SUFFIXES: .c .o

all: pvi$(EXEC)

pvi$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f pvi.exe pvi src/*.o
