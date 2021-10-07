CXX = g++
CXXFLAGS = -Wall -O2 $(shell pkg-config --cflags lua5.3) 
LDLIBS = $(shell pkg-config --libs lua5.3)
RM = rm -v -f

all: example01 example02 exampleThree.so

example01: example01.cpp
example02: example02.cpp
exampleThree.so: example03.cpp
	$(CXX) $(CXXFLAGS) $^ $(LDLIBS) -shared -fPIC -o exampleThree.so

clean:
	@$(RM) example01 example02 exampleThree.so 
	@$(RM) *~
