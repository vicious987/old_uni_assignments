CXX = g++
CXXFLAGS = -Wall -O2 $(shell pkg-config --cflags lua) 
LDLIBS = $(shell pkg-config --libs lua)

all: example01 example02 example03 example04

example01: example01.cpp
example02: example02.cpp
example03: example03.cpp
example04: example04.cpp

clean:
	rm -f example01 example02 example03 example04
