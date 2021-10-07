CXX = g++
CXXFLAGS = -Wall -O2 $(shell pkg-config --cflags lua) 
LDLIBS = $(shell pkg-config --libs lua)
RM = rm -v -f

all: zad.so

zad.so: zad.cpp
	$(CXX) $(CXXFLAGS) $^ $(LDLIBS) -shared -fPIC -o zad.so

clean:
	@$(RM) zad.so zad.so
	@$(RM) *~
