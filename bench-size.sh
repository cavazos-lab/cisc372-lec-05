
for size in 100 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950 1000 1100 1200 1300 1400 1500 1600 1800 2000
do
  gcc -DSIZE=$size matmul-seq.c -o matmul-seq-$size &> /dev/null
  gcc -fopenmp -DSIZE=$size matmul-omp.c -o matmul-omp-$size &> /dev/null
  echo "------------"
  echo "size=$size"
  echo "------------"
  echo "sequential"
  /usr/bin/time -f "%E" ./matmul-seq
  echo "------------"
  echo "OpenMP"
  /usr/bin/time -f "%E" ./matmul-omp
  echo "############"
done

