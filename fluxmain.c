#include <stdio.h>

#include "fluxcap.h"

int main(int argc, char * argv[])
{
  printf("fluxmain\n");
  for (int i = 1 ; i < 9 ; i++)
    {
      megawrapper(i, "?\n");
    }

}
