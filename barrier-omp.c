
 #include <stdio.h> 

 #include <omp.h>

 int main() {

   double startTime;

   #pragma omp parallel private (startTime) num_threads(4)
   {
     startTime = omp_get_wtime();
     // Each thread sleep ID second (master thread sleep 0 s)
     while( (omp_get_wtime() - startTime) < (double)(omp_get_thread_num()));
     printf("I (%d) finish to count\n", omp_get_thread_num());
     // Each thread will wait other
     #pragma omp barrier
     printf("I (%d) pass the Barrier\n", omp_get_thread_num());

     #pragma omp single
     {
       printf("I (%d) am the only one executing this code\n", omp_get_thread_num());
     }

     #pragma omp master
     {
       printf("I (%d) am the Master\n", omp_get_thread_num());
     }
   }

   return 0;
 }


