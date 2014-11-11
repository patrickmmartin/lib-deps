#include <stdio.h>
#include "query_types.h"

static int (*QTFuncs[])(char *) = {};

void set_query_func(int type, int (*func)(char *))
{
  if ((type > 0) && (type < 8))
    QTFuncs[type] = func;
}


int megawrapper(int type, char * query)
{
  if ((type > 0) && (type < 8))
    {
      if (QTFuncs[type])
	QTFuncs[type](query);
    }
  else
    {
      printf("unknown %d", type);
    }
}

