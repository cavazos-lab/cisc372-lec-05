
#include <omp.h>

#include "size-def.h"

float A[N][P]; // op 1
float B[P][M]; // op 2
float C[N][M]; // res

int main() {
  unsigned long i, j, k;

  for (i = 0; i < N; i++)
    for (k = 0; k < P; k++)
      A[i][k] = 0.;
  for (k = 0; k < P; k++)
    for (j = 0; j < M; j++)
      B[k][j] = 0.;
  for (i = 0; i < N; i++)
    for (j = 0; j < M; j++)
      C[i][j] = 0.;

  #pragma omp parallel shared(A,B,C) private(i,j,k)
  {

  #pragma omp for schedule (static)
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      for (k = 0; k < P; k++) {
        C[i][j] += A[i][k] * B[k][j];
      }
    }
  }

  }

  return 0;
}

