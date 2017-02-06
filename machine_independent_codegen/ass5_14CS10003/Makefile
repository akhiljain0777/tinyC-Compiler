a.out: y.tab.o lex.yy.o ass5_14CS10003_translator.o 
	g++ -g ass5_14CS10003_translator.o lex.yy.o y.tab.o -lfl
	#make run to generate the output
	#make clean to clear all the system generated files
lex.yy.c: ass5_14CS10003.l
	flex ass5_14CS10003.l
y.tab.c: ass5_14CS10003.y
	yacc -dtv ass5_14CS10003.y
ass5_14CS10003_translator.o: ass5_14CS10003_translator.cxx
	g++ -g -c ass5_14CS10003_translator.cxx
lex.yy.o: lex.yy.c
	g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	g++ -g -DYYDEBUG -c y.tab.c
clean:
	rm lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass5_14CS10003_translator.o a.out
run: 
	./a.out < ass5_14CS10003_test1.c > ass5_14CS10003_quad1.out
	./a.out < ass5_14CS10003_test2.c > ass5_14CS10003_quad2.out
	./a.out < ass5_14CS10003_test3.c > ass5_14CS10003_quad3.out
	./a.out < ass5_14CS10003_test4.c > ass5_14CS10003_quad4.out
	./a.out < ass5_14CS10003_test5.c > ass5_14CS10003_quad5.out

