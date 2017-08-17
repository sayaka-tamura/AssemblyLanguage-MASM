TITLE Test Question (MyanswerD.asm)
 INCLUDE Irvine32.inc
.data
  Y1 Dword 400
  Y2 dword 300
  Y3 dword 400
  Y4 dword 1000
  
  Plus byte " + ", 0
  Equals byte " = ",0

.code

main PROC
   mov eax,y1
   call writedec
   mov edx, offset plus
   call writestring
   
   mov eax,y2
   call writedec
   call writestring
   
   mov eax,y3
   call writedec
   call writestring
   
   mov eax,y4
   call writedec
   
   mov edx,offset equals
    call writestring

   mov eax,y1
   add eax,y2
   add eax,y3
   add eax,y4
   call writedec

 exit
main ENDP
END main


