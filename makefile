#
# makefile
# This file is part of tripforce.
# See tripforce.c for copyright or LICENSE for license information.
#
     
CC=gcc
CFLAGS=-O3 -ansi -march=native
LDFLAGS=-lcrypto -fopenmp
INSTALLDIR=/usr/local/bin
OUTPUT=tripforce
INPUT=$(wildcard *.c)

.PHONY: all install uninstall remove clean profile

all: $(INPUT)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(INPUT) $(LDFLAGS)

install: all
	mv $(OUTPUT) $(INSTALLDIR)

uninstall:
	rm -rf $(INSTALLDIR)/$(OUTPUT)

remove: uninstall

clean:
	rm -rf $(OUTPUT) $(wildcard *.out)

profile: clean
	$(CC) -pg $(INPUT) $(LDFLAGS)
