## Part of the solution for Assignment 1 (CS 464/564)
## by Stefan Bruda.

## Uncomment this line (and comment out the following line) to produce
## an executable that provides some debug output.
#CXXFLAGS = -g -Wall -pedantic -DDEBUG
CXXFLAGS = -g -Wall -pedantic

all: rsshell

tcp-utils.o: tcp-utils.h tcp-utils.cc
	$(CXX) $(CXXFLAGS) -c -o tcp-utils.o tcp-utils.cc

tokenize.o: tokenize.h tokenize.cc
	$(CXX) $(CXXFLAGS) -c -o tokenize.o tokenize.cc

rsshell.o: tcp-utils.h tokenize.h rsshell.cc
	$(CXX) $(CXXFLAGS) -c -o rsshell.o rsshell.cc

rsshell: rsshell.o tcp-utils.o tokenize.o
	$(CXX) $(CXXFLAGS) -o rsshell rsshell.o tcp-utils.o tokenize.o

clean:
	rm -f rsshell *~ *.o *.bak core \#*
