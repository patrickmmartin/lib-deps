#include <stdio.h>
#include "query_types.h"

int megawrapper(int type, char * query)
{
  switch (type)
    {
    case 1:
      query_type1(query);
    case 2:
      query_type2(query);
    case 3:
      query_type3(query);
    case 4:
      query_type4(query);
    case 5:
      query_type5(query);
    case 6:
      query_type6(query);
    case 7:
      query_type7(query);
    case 8:
      query_type8(query);
    default:
      printf("unknown %d", type);
    }

}

