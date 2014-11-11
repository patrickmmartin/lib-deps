#include <stdio.h>

#include "fluxcap.h"      // megawrapper
#include "query_types.h"  // query_type1

int main(int argc, char * argv[])
{
  printf("fluxlite_dyn\n");
  set_query_func(1, &query_type1);
  megawrapper(1, "?\n");
}
