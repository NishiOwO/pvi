# $Id$

include mk/config.mk

CFLAGS = -I include
LDFLAGS = -L pcre
LIBS = -lpcre

EXEC =

OBJS = src/main.o src/arg.o src/array.o

.PHONY: all fail docs pcre clean mrproper
.SUFFIXES: .c .o

TARGET = pvi$(EXEC)
-include diagnose.mk
fail:
	@echo "Please run ./diagnose"
	@exit 1

pvi$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

pcre:
	cd pcre && $(MAKE)

docs:
	cd docs && $(MAKE)

clean:
	rm -f pvi.exe pvi src/*.o

mrproper: clean
	cd pcre && $(MAKE) clean
	rm -f diagnose.mk
