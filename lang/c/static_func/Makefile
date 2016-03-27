RM?= rm -vf

.PHONY: all 
all: main

main: foo.o
	${CC} ${CFLAGS} main.c ${.ALLSRC} -o main

.PHONY: clean
clean:
	${RM} *.o
	${RM} main
