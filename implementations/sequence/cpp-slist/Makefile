
.PHONY: test

all: main

%.o : %.cpp ../../common.h
	g++ -std=c++11 -c $< -o $@
%.o : %.c ../../common.h
	g++ -std=c++11 -c $< -o $@

main: ../../common.o impl.o
	g++ -std=c++11 -o $@ $^

test: main
	./main ../../../data/numbers/small
