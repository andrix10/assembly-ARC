#include <unistd.h>

int main(void)
{
	char ch;
	int result;
	unsigned num;
	num=0;
	do
	{
		result=read(0, &ch, 1);
		if (result && (ch!=10))
		{
			num=(num*10)+(ch - '0');
		}
	}
	while (result && (ch!=10)); //EOF or we just read linefeed	
#}
