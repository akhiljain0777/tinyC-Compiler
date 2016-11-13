tinyc: y.tab.o lex.yy.o ass6_14CS10003_translator.o ass6_14CS10003_target_translator.o 
	g++ -g ass6_14CS10003_translator.o ass6_14CS10003_target_translator.o lex.yy.o y.tab.o -lfl -o tinyc
	 ./tinyc < ass6_14CS10003_test1.c
	 ./tinyc < ass6_14CS10003_test2.c 
	 ./tinyc < ass6_14CS10003_test3.c
	 ./tinyc < ass6_14CS10003_test4.c
	 ./tinyc < ass6_14CS10003_test5.c
	# Above are the individual commands to generate the .s file to output.s then run make output to compile the library then do ./output to run
	
	# make run to execute all the test files at once
lex.yy.c: ass6_14CS10003.l
	flex ass6_14CS10003.l
y.tab.c: ass6_14CS10003.y
	yacc -dtv ass6_14CS10003.y
ass6_14CS10003_target_translator.o: ass6_14CS10003_target_translator.cxx
	g++ -g -c ass6_14CS10003_target_translator.cxx
ass6_14CS10003_translator.o: ass6_14CS10003_translator.cxx
	g++ -g -c ass6_14CS10003_translator.cxx
lex.yy.o: lex.yy.c
	g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	g++ -g -DYYDEBUG -c y.tab.c
libass2_14CS10003.a: ass2_14CS10003.o
	ar -rcs libass2_14CS10003.a ass2_14CS10003.o

ass2_14CS10003.o: ass2_14CS10003.c myl.h
	gcc -Wall  -c ass2_14CS10003.c
clean:
	rm test1 test2 test3 test4 test5 lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass6_14CS10003_translator.o ass6_14CS10003_target_translator.o ass6_14CS10003_test1.o ass6_14CS10003_test2.o ass6_14CS10003_test3.o ass6_14CS10003_test4.o ass6_14CS10003_test5.o libass2_14CS10003.a ass2_14CS10003.o output.o ass6_14CS10003_quad1.out ass6_14CS10003_quad2.out ass6_14CS10003_quad3.out ass6_14CS10003_quad4.out ass6_14CS10003_quad5.out


test1: ass6_14CS10003_test1.o libass2_14CS10003.a
	gcc -g ass6_14CS10003_test1.o -o test1 -L. -lass2_14CS10003
ass6_14CS10003_test1.o: ass6_14CS10003_test1.s myl.h
	gcc -g -Wall  -c ass6_14CS10003_test1.s -o ass6_14CS10003_test1.o

test2: ass6_14CS10003_test2.o libass2_14CS10003.a
	gcc -g  ass6_14CS10003_test2.o -o test2 -L. -lass2_14CS10003
ass6_14CS10003_test2.o: ass6_14CS10003_test2.s myl.h
	gcc -g -Wall -c ass6_14CS10003_test2.s

test3: ass6_14CS10003_test3.o libass2_14CS10003.a
	gcc -g  ass6_14CS10003_test3.o -o test3 -L. -lass2_14CS10003
ass6_14CS10003_test3.o: ass6_14CS10003_test3.s myl.h
	gcc -g -Wall  -c ass6_14CS10003_test3.s

test4: ass6_14CS10003_test4.o libass2_14CS10003.a
	gcc -g  ass6_14CS10003_test4.o -o test4 -L. -lass2_14CS10003
ass6_14CS10003_test4.o: ass6_14CS10003_test4.s myl.h
	gcc -g -Wall  -c ass6_14CS10003_test4.s

test5: ass6_14CS10003_test5.o libass2_14CS10003.a
	gcc -g  ass6_14CS10003_test5.o -o test5 -L. -lass2_14CS10003
ass6_14CS10003_test5.o: ass6_14CS10003_test5.s myl.h
	gcc -g -Wall -c ass6_14CS10003_test5.s

pointerhandling:pointerhandling.o libass2_14CS10003.a
	gcc -g  pointerhandling.o -o pointerhandling -L. -lass2_14CS10003
pointerhandling.o: pointerhandling.s myl.h
	gcc -g -Wall -c pointerhandling.s

#output: output.o
output: output.o libass2_14CS10003.a
	gcc -g  output.o -o output -L. -lass2_14CS10003
output.o: output.s myl.h
	gcc -g -Wall -c output.s

run: 
		
	./tinyc < ass6_14CS10003_test1.c > ass6_14CS10003_quad1.out
  	
	mv output.s ass6_14CS10003_test1.s
	
	make test1
	
	./tinyc < ass6_14CS10003_test2.c > ass6_14CS10003_quad2.out

	mv output.s ass6_14CS10003_test2.s
	
	make test2

	./tinyc < ass6_14CS10003_test3.c > ass6_14CS10003_quad3.out

	mv output.s ass6_14CS10003_test3.s

	make test3

	./tinyc < ass6_14CS10003_test4.c > ass6_14CS10003_quad4.out
	
	mv output.s ass6_14CS10003_test4.s

	make test4

	./tinyc < ass6_14CS10003_test5.c > ass6_14CS10003_quad5.out
	
	mv output.s ass6_14CS10003_test5.s

	make test5
	
	./tinyc < pointerhandling.c > pointerhandling.out
	
	mv output.s pointerhandling.s

	make pointerhandling
	#Below are the individual commands for compiling each test file
	#./test1
	#./test2
	#./test3
	#./test4
	#./test5
	#./pointerhandling

