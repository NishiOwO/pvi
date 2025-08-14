# $Id$

CC = cc
AR = ar
CFLAGS = -I include -DHAVE_CONFIG_H -DPCRE_STATIC
LDFLAGS =

OBJS = src/pcre_byte_order.o src/pcre_chartables.o src/pcre_compile.o src/pcre_config.o src/pcre_dfa_exec.o src/pcre_exec.o src/pcre_fullinfo.o src/pcre_get.o src/pcre_globals.o src/pcre_maketables.o src/pcre_newline.o src/pcre_ord2utf8.o src/pcre_refcount.o src/pcre_string_utils.o src/pcre_study.o src/pcre_tables.o src/pcre_ucd.o src/pcre_valid_utf8.o src/pcre_version.o src/pcre_xclass.o

.PHONY: all clean
.SUFFIXES: .c .o

TARGET = libpcre.a
-include ../diagnose.mk

libpcre.a: $(OBJS)
	$(AR) rcs $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.a src/*.o
