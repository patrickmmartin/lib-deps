#include <stdio.h>

#define MAKE_FN_NAME(x) int query_type ## x (char * query)
#define FUNCTION_NAME(y) MAKE_FN_NAME(y)

FUNCTION_NAME(QUERY_TYPE)
{
  printf("query type %d %s", QUERY_TYPE, query);
}
