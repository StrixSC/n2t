OUT=assembler
CC=g++
CFLAGS=-I.
DEBUG_FLAGS=-g
DEBUG_OUT=assembler.debug

assembler: assembler.cpp
	$(CC) -o $(OUT) assembler.cpp $(CFLAGS)

debug:
	$(CC) -o $(DEBUG_OUT) $(DEBUG_FLAGS) assembler.cpp $(CFLAGS)
