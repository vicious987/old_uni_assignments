UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
CC = gcc -g
endif
ifeq ($(UNAME), Darwin)
CC = clang -g
endif

CFLAGS	= -std=gnu11 -march=native -O2 -Wall -Wextra

BINS = bsearch cache matmult transpose randwalk
SRCS = $(wildcard *.c *.h *.md *.gp *.dat *.sh Makefile)

all: $(BINS) # raport.html

bsearch: bsearch.o common.o test.o
bsearch.o: bsearch.c common.h test.h
cache: cache.o common.o test.o
cache.o: cache.c common.h test.h
matmult: matmult.o common.o test.o
matmult.o: matmult.c common.h test.h
randwalk: randwalk.o common.o test.o
randwalk.o: randwalk.c common.h test.h
transpose: transpose.o common.o test.o
transpose.o: transpose.c common.h test.h
test.o: test.c test.h common.h

# requires "markdown" and "gnuplot" packages to be installed
raport.html: raport.md figure.png

z1t1:
	./matmult -n 1024 -v 2 -s -b 2> z1t1.txt
#	./matmult -n 1024 -v 3 -s > 2.txt
#	./matmult -n 2048 -v 3 -s >? 1zad/1_2.txt

%.html: %.md
	markdown $< > $@

%.png: %.gp %.dat
	gnuplot $< > $@

%.eps: %.gp %.dat
	gnuplot $< > $@

clean:
	@rm -vf *.o *.html *.png *~ $(BINS)

dist:
	mkdir -p stripped 
	cp -a $(SRCS) stripped/
	cd stripped && \
	  for f in *.c; do \
	    sed -i -e '/^#if.*SOLUTION/,/^#endif.*SOLUTION/d' $$f; \
	  done
	cd stripped && tar cvzf ../../pracownia_2-$$(date +'%Y%m%d%H%M%S').tgz *
	rm -rf stripped

# vim: ts=8 sw=8
