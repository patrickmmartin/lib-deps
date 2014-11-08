#include <stdio.h>

#include "fluxcap.h"

int main(int argc, char * argv[])
{
  printf("fluxmain\n");
  for (int i = 0 ; i < 8 ; i++)
    {
      megawrapper(i, "?");
    }

}
