.data
#unnsigned dividend = ?; // initialize dividend
dividend: .int 0xabcd1234
#unsigned remainder = 0; // initialize remainder
remainder: .int 0
#unsigned divisor = ?; // initialize divisor
divisor: .int 2
#unsigned quotient = 0; // initialize quotient
quotient: .int 0
#unsigned count = 32; // assume 32-bit
count: .int 32
oneAscii: .ascii "1"
zeroAscii: .ascii "0"
.text
.global _start
_start:
loopBegin:
#while (count)
#if(!count) goto loopExit
#if(count=0) goto loopExit
   cmpl $0,count
   jz loopExit
#{
#left shift one bit from dividend into remainder
   movl dividend,%eax
   addl %eax,%eax
   movl %eax, remainder
   movl dividend,%eax
   addl %eax,%eax
   movl %eax, dividend
   adcl $0,remainder
#left shift quotient one bit
   movl quotient,%eax
   addl %eax,%eax
   movl %eax,quotient
#if (remainder >= divisor)
#if (remainder <divisor) goto else
   movl divisor,%eax
   cmpl %eax,remainder
   jb else
#{
#remainder -= divisor;
   subl %eax,remainder
#quotient += 1;
   addl $1,quotient
#write(1,"1",1);
   movl $4,%eax
   movl $1,%ebx
   movl $oneAscii,%ecx
   movl $1,%edx
   int $0x80
jmp endIf
#}
#else
else:
#{
#write(1,"0",1);
#}
endIf:
#count -= 1;
   subl $1,count
   jmp loopBegin
#}
loopExit:

   movl $1,%eax
   movl $0,%ebx
   int $0x80
