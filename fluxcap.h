
#include "query_types.h"

void set_query_func(int type,int (*pQTFunc)(char *));

int megawrapper(int type, char * query);
