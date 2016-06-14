CC := g++
CFLAGS := -std=c++11 -Wall -Wextra
SRCDIR := src
BUILDDIR := build
TARGETDIR := bin
TARGET := $(TARGETDIR)/compiler

LEX := flex
YACC := bison -y
YFLAGS := -d
TESTCODE := test/main.code

all: grammar.o lex.o
	mkdir -p $(TARGETDIR)
	$(CC) $(CFLAGS) $(SRCDIR)/main.cpp $(BUILDDIR)/grammar.o $(BUILDDIR)/lex.o -o $(TARGET)
	
grammar.o:
	mkdir -p $(BUILDDIR)
	$(YACC) $(YFLAGS) $(SRCDIR)/grammar.y
	$(CC) -c y.tab.c -o $(BUILDDIR)/grammar.o
    
lex.o:
	mkdir -p $(BUILDDIR)
	$(LEX) $(SRCDIR)/lex.l
	$(CC) -c lex.yy.c -o $(BUILDDIR)/lex.o

test: all
	$(TARGET) < $(TESTCODE)
	
clean:
	$(RM) -r $(BUILDDIR) $(TARGETDIR)
	$(RM) y.tab.c y.tab.h
	$(RM) lex.yy.c

