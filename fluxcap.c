#include <stdio.h>
#include "query_types.h"

int megawrapper(int type, char * query)
{
  switch (type)
    {
    case 1:
      query_type1(query);
      break;
    case 2:
      query_type2(query);
      break;
    case 3:
      query_type3(query);
      break;
    case 4:
      query_type4(query);
      break;
    case 5:
      query_type5(query);
      break;
    case 6:
      query_type6(query);
      break;
    case 7:
      query_type7(query);
      break; 
   case 8:
      query_type8(query); 
      break;
    default:
      printf("unknown %d", type);
    }

}

