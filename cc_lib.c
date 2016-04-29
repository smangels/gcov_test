
#include "cc_lib.h"
#include "stdio.h"
#include "string.h"

void test_me(LibraryStructS *s)
{
	s->kindergarten=1;
	memset(s->name, 0, sizeof(s->name));
	if (s->kindergarten == 0)
	{
		memset(s->name, 0xFF, sizeof(s->name));
	}
}
