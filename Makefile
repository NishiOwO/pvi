CC = cc
AR = ar

CFLAGS = -I include -I pcre/include -DHAVE_CONFIG_H -DPCRE_STATIC
LDFLAGS =
LIBS =

EXEC =

PVI_OBJS = src/main.o
PCRE_OBJS = pcre/src/pcre_byte_order.o pcre/src/pcre_chartables.o pcre/src/pcre_compile.o pcre/src/pcre_config.o pcre/src/pcre_dfa_exec.o pcre/src/pcre_exec.o pcre/src/pcre_fullinfo.o pcre/src/pcre_get.o pcre/src/pcre_globals.o pcre/src/pcre_maketables.o pcre/src/pcre_newline.o pcre/src/pcre_ord2utf8.o pcre/src/pcre_refcount.o pcre/src/pcre_string_utils.o pcre/src/pcre_study.o pcre/src/pcre_tables.o pcre/src/pcre_ucd.o pcre/src/pcre_valid_utf8.o pcre/src/pcre_version.o pcre/src/pcre_xclass.o

.PHONY: all clean
.SUFFIXES: .c .o

all: pvi$(EXEC)

pvi$(EXEC): $(PVI_OBJS) pcre.a
	$(CC) $(LDFLAGS) -o $@ $(PVI_OBJS) $(LIBS) pcre.a

pcre.a: $(PCRE_OBJS)
	$(AR) rcs $@ $(PCRE_OBJS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f pvi.exe pvi *.a src/*.o pcre/src/*.o
