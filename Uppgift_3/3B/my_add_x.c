#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  char str[256];
  int sum = 0;

  printf("Enter integers to add. Separate with <ENTER>. Add and quit with emptyline.\n");

  while (fgets(str, sizeof(str), stdin) != NULL)
  {
    if (str[0] != '\n')
    {
      sum += (int)strtol(str, NULL, 10);
    }
    else
    {
      break;
    }
  }

  printf("Sum of integers: %d\n", sum);

  return 0;
}
