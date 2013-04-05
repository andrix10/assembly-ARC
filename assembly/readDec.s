.data
num: .int 0
ch: .byte 0
result: .int 0
.text
.global _start
_start:
#include <unistd.h>

#int main(void)
#{
#	char ch;
#	int result;
#	unsigned num;
#	num=0;
        movl $0,num
	loopBegin:
#	do
#	{
#		result=read(0, &ch, 1);
		movl $3,%eax
		movl $0,%ebx
		movl $ch,%ecx
		movl $1,%edx
		int $0x80
		movl %eax,result 
#		if (result && (ch!=10))
#		if (result==0) goto endIf
		cmpl $0,result
		jz  endIf
#		if (ch==10) goto endIf
		cmpb $10,ch
		jz endIf
#		{
#			num=(num*10)+(ch - '0');
			movl $10,%eax
			mull num  # store the product if edx:eax
			addb ch,%eax
			movl $0,%eax
			movb ch,%bl
			subl $0x30,%eax
			movl %eax,num
#		}
		endIf:
#	}
#	while (result && (ch!=10)); //EOF or we just read linefeed	
	cmpl $0, result
	jz loopExit
	cmpb $10,ch
	jnz loopBegin
	loopExit:	
#}
	movl $1,%eax
	movl $0,%ebx
	int $0x80
