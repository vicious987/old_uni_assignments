CXX = g++
CXXFLAGS = -Wall -O2 $(shell pkg-config --cflags lua5.3) 
LDLIBS = $(shell pkg-config --libs lua5.3)

all: example01 example02 example03 

example01: example01.cpp
example02: example02.cpp
example03: example03.cpp

clean:
	rm -f example01 example02 example03 




