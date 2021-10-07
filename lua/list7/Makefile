CXX = g++
CXXFLAGS = -Wall -O2 $(shell pkg-config --cflags lua) 
LDLIBS = $(shell pkg-config --libs lua)
RM = rm -v -f

all: zad2

zad2: zad2.cpp

clean:
	rm -f zad2
