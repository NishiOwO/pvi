# $Id$

.PHONY: all
.SUFFIXES: .txt .m4

all: ../README.txt

../README.txt: README.txt
	cp README.txt $@

.m4.txt:
	m4 $< > $@
