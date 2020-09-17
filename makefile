# this is a comment
# specify the object files ...
OBJ= main.o functions.o


# specify the compiler
CC   = cc   # this is the cross platform standard C compiler
CXX  = g++  # this is the GNU C++ compiler
#CXX = CC   # Solaris C++ compiler


# specify the compiler options
CFLAGS = -g

# specify compiler preprocessor options
CPPFLAGS = -I/usr/local/include

# specify linker options
LDFLAGS  = -L/usr/local/lib

# specify the name of the ultimate executable file
EXEC = exec



# create the executable
$(EXEC): $(OBJ)
	$(CC) $(LDFLAGS) -o $(EXEC) $(OBJ)
	@echo 'exec has been created'



functions.o: functions.c functions.h main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c functions.c
main.o: functions.h main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c main.c

check: $(EXEC)
	./$(EXEC)

clean: 
	 -/bin/rm -f $(EXEC) $(OBJ)