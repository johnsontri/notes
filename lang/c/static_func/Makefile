RM?= rm -vf
CFLAGS+= -Wall

.PHONY: all 
all: main

main: foo.o
	${CC} ${CFLAGS} main.c ${.ALLSRC} -o main

.PHONY: break
break: foo.o
	${CC} ${CFLAGS} main.c ${.ALLSRC} -o main -DBROKEN

.PHONY: clean
clean:
	${RM} *.o
	${RM} main
