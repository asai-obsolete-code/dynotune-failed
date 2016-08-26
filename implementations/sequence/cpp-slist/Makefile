
.PHONY: test

all: main

main: main.cpp ../../common.h
	g++ -std=c++11 -o $@ $<

test: main
	./main ../../../data/numbers/small
