CC = g++
CARGS = 
DARGS = 
IN = src/*.cpp
LIBS = 
BINDIR = ./bin/
OUT = build.out

default: build

clean:
	rm -rf $(BINDIR)*

debug:
	$(CC) $(CARGS) $(DARGS) $(IN) $(LIBS) -o $(BINDIR)$(OUT)

build:
	$(CC) $(CARGS) $(IN) $(LIBS) -o $(BINDIR)$(OUT)
