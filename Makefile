
# sequential compilation
CC=gcc
LD=gcc

CCFLAGS=-g

# OpenMP compilation
CCFLAGS_OMP=-fopenmp
LDFLAGS_OMP=-lgomp

# Rules

all: \
  matmul-seq \
  helloworld-omp \
  matmul-omp \
  barrier-omp \

# Matmul Sequential

matmul-seq: matmul-seq.c
	$(CC) $(CCFLAGS) matmul-seq.c -o matmul-seq

# HelloWorld OpenMP

helloworld-omp: helloworld-omp.c
	$(CC) $(CCFLAGS) $(CCFLAGS_OMP) helloworld-omp.c -o helloworld-omp

# Matmul OpemMP
matmul-omp: matmul-omp.o
	$(LD) $(LDFLAGS_OMP) matmul-omp.o -o matmul-omp

matmul-omp.o: matmul-omp.c
	$(CC) $(CCFLAGS) $(CCFLAGS_OMP) -c matmul-omp.c -o matmul-omp.o
barrier-omp: barrier-omp.c
	$(CC) $(CCFLAGS_OMP) barrier-omp.c -o barrier-omp

clean:
	rm -rf *.o matmul-seq helloworld-omp matmul-omp barrier-omp

