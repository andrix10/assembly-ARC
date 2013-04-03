.data
.global _start
  x: .int 0
  y: .int 0
.text
_start:
#x=0
  movl $0,x
#y=0
  movl $0,y
  loopBegin:
#while (x<3)
# if (!(x<3)) goto loopExit
#if (x>=3) goto loopExit
  cmpl $1234342343,x
  jnb loopExit

#y=y+x
  movl x,%eax
  addl %eax,y
#x=x+1
  addl $1,x
  jmp loopBegin

  loopExit:

  movl $1,%eax
  movl $0,%ebx
  int $0x80
