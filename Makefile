

CC=gcc
CFLAGS=
DEPS=cc_lib.h Makefile
OBJ=cc_main.o cc_lib.o
LIBS=-lgcov
GCOV_GCNO=$(patsubst %.o,%.gcno,$(OBJ))
GCOV_GCDA=$()


all: coverage-html


.PHONY: clean
clean:
	rm -f *.o *.gc* cc_main *.info *.html

%.o: %.c
	$(CC) -fprofile-arcs -ftest-coverage -g -c -o $@ $< $(CFLAGS)

cc_main: $(OBJ)
	gcc $(LIBS) --coverage $^ -o $@

coverage-html: cc_main
	./$<
	gcovr -r . --html --html-details -o cc_main.html -s

