CC=gcc

IDIR =./include
ODIR=./obj
SRCDIR=./src
BINDIR=./bin

CFLAGS=-I$(IDIR)
LIBS=-lm

_DEPS = common.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = bye_func.o hello_func.o main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: all
all: check_dir main

check_dir:
	@if [ ! -d $(ODIR) ] ; then echo "Creating $(ODIR)" ; mkdir $(ODIR); fi
	@if [ ! -d $(BINDIR) ] ; then echo "Creating $(BINDIR)" ; mkdir $(BINDIR); fi

main: $(OBJ)
	$(CC) -o $(BINDIR)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(BINDIR)/*
