.text
.global _start
_start:
#	pushl $10
	#move stack pointer by 4 bytes
	addl $-4,%esp
	#copy the 32bit pattern of 10 to where esp points to
	movl $10,(%esp)
	pushl $156
	pushw $0x2e

#	popw %ax
	#copy the 16bit thing pointed to by esp to ax
	movw (%esp),%ax
	#move the stack pointer up 2 bytes
	addl $2,%esp
	popl %ebx
	popl %ecx
	
	movl $1,%eax
	movl $0,%ebx
	int $0x80
