TITLE move loops          (movelooping.asm)                     
   
;Last updated 2.15.2016 Written by dr Sayaka Tamura
INCLUDE Irvine32.inc
.data
   array word  111,2345,4095,1,5
   count word  0
   line byte "Second loop starts ... ",0
   
.code
main PROC
  mov eax, 0
  mov ecx, 5
  mov esi, offset array

  printing:
	;mov eax, array + count you cannot add variable directly
	mov ax, [esi]
	call writedec
	call crlf

	add esi,2

  loop printing

  call crlf

  mov edx, offset line
  call writestring
  call crlf

  mov eax, 0
  mov ecx, 5
  mov esi, offset array ;esi is register

  printing1:
	mov ax, [esi] 
	call writedec
	call crlf

	add esi,2

  loop printing1
      
  exit
	 
main ENDP
 
end main