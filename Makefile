# Rules to compile .c files into .o files
display.o: display.c
    gcc -c display.c

main.o: main.c
    gcc -c main.c

# An all rule that will combine all .o files into an executable clock
all: display.o main.o
    gcc display.o main.o -o clock

# A clean rule that will remove the executable clock and all .o files
clean:
    rm -f clock display.o main.o

# A run rule that will run the script and pipe the output into the clock binary
run: all
    ./script.sh | ./clock
