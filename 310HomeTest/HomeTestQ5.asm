TITLE TakeHomeQ5 (Sayaka_TakeHomeQ5.asm)

INCLUDE Irvine32.inc
.data
Number DB "Enter two numbers to multiply.",0
numberA DB "A =",0
a DD ?
numberB DB "B =",0
b DD ?
multiple DB "*",0
equal DB "=",0

.code
main PROC
   call clrscr
   mov eax,0
   mov edx,offset Number
   call writeString
   call crlf
   call reada
   call crlf
   call readb
   call crlf
   call multiply
exit
main ENDP

reada PROC
   mov edx,offset numberA
   call writeString
   call readint
   mov a,eax
   ret
reada ENDP

readb PROC
   mov edx,offset numberB
   call writeString
   call readint
   mov b,eax
   ret
readb ENDP

multiply PROC
   mov ebx,0
   mov eax,0
   mov ecx,b
   mov eax,a
   push eax
   mov edx,offset multiple
   call writedec
   call writeString
   mov eax,0    
   mov eax,b
   mov edx,offset equal
   call writedec
   call writeString
   pop eax
multiplys:
   add ebx,eax
   Loop multiplys
   
   mov eax,ebx
   call writedec
   ret
multiply ENDP

end main