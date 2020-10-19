#include <stdio.h>
#include <stdlib.h>
#include "my_add.h"

int main(int argc, char *argv[])
{
  int num1 = atoi(argv[1]);
  int num2 = atoi(argv[2]);

  printf("%d\n", add(num1, num2));

  return 0;
}
