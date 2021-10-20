CXXFLAGS= -fPIC #-fvisibility=hidden

app: shared.o application.o libtestlib.so
	$(CXX) -L. -o $@ shared.o application.o -ltestlib

libtestlib.so: shared.o library.o
	$(LINK.c) -shared $^ -o $@ 

.PHONY: run clean
clean:
	rm -f *.o *.so app

run: app
	env LD_LIBRARY_PATH=. ./$^
