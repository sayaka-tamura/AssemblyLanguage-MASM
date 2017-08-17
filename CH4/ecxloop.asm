   TITLE chicken loops          (ecxloop.asm)                     
   
;Last updated 2.15.2016 Written by Sayaka Tamura
;count numbers with drawing a line
INCLUDE Irvine32.inc
.data
   array dword  111,2345,4095,1,5
   line byte "*********************",0
   
.code
main PROC
  mov eax, 0
  mov edx, offset line 

  mov ecx, 3 ;if "ecx,array" ->111 times repeat

  mylines:
	mov eax, ecx
	call writedec
	call writestring
	call crlf
  loop mylines
      
  exit
	 
main ENDP
 
end main